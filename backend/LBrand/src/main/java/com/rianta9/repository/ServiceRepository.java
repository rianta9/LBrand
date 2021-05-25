/**
 * 
 */
package com.rianta9.repository;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestParam;

import com.rianta9.entity.Service;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 21:17:05
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "service", path = "service")
public interface ServiceRepository extends JpaRepository<Service, Long> {
	Service findByServiceId(Long serviceId);
	
	Page<Service> findByBrandBrandId(@RequestParam("brandId") Long brandId, Pageable pageable);

	/**
	 * @param i
	 * @param of
	 * @return
	 */
	Page<Service> findAllByStatus(int status, Pageable pageable);

	/**
	 * @param query
	 * @param i
	 * @param of
	 * @return
	 */
	Page<Service> findAllByServiceNameContainingAndStatus(String query, int status, Pageable pageable);

	/**
	 * Lấy top dịch vụ bán chạy nhất trong khoảng 1 tháng
	 * 
	 * @param quantity Số lượng lấy ra
	 * @return
	 */
	@Query(value = "select *\r\n" + "from service as s\r\n" + "join (\r\n"
			+ "	select top (?1) s.service_id, s.service_name, COUNT(*) as number_of_booking from booking_service_detail as bsd\r\n"
			+ "	join service as s on bsd.service_id = s.service_id\r\n"
			+ "	join booking as bo on bo.booking_id = bsd.booking_id\r\n"
			+ "	where bo.date_created between DATEADD(MONTH, -1, GETDATE()) and GETDATE() and bo.booking_status_id = 3\r\n"
			+ "	group by s.service_id, s.service_name\r\n" + "	order by number_of_booking desc\r\n"
			+ ") as tb on s.service_id = tb.service_id", nativeQuery = true)
	List<Service> findTopBestSellerServiceByMonth(int quantity);

	/**
	 * Lấy top dịch vụ đang khuyến mãi sắp xếp giảm dần theo phần trăm khuyến mãi, tăng dần theo giá khuyến mãi
	 * @param quantity Số lượng lấy ra
	 * @return
	 */
	@Query(value = "select top (?1) s.*\r\n"
			+ "from [service] as s\r\n"
			+ "where (s.price_for_adult-s.sale_price_for_adult)/s.price_for_adult*100 > 10\r\n"
			+ "order by (s.price_for_adult-s.sale_price_for_adult)/s.price_for_adult*100 desc, s.sale_price_for_adult", nativeQuery = true)
	List<Service> findTopSaleService(int quantity);
	
	/**
	 * Lấy top dịch vụ đã xem theo thứ tự thời gian
	 * @param quantity
	 * @param accountId
	 * @return
	 */
	@Query(value = "select top(?1) s.*\r\n"
			+ "from [service] as s\r\n"
			+ "join service_interaction as si on s.service_id = si.service_id\r\n"
			+ "where si.account_id = ?2\r\n"
			+ "order by si.last_view_date desc", nativeQuery=true)
	List<Service> findTopViewedHistory(int quantity, Long accountId);
	
	
	/**
	 * Lấy top dịch vụ được gợi ý(theo lượt yêu thích thương hiệu, lượt yêu thích dịch vụ, đang giảm giá)
	 * @param quantity
	 * @param account
	 * @return
	 */
	@Query(value = "select top(?1) s.*\r\n"
			+ "from [service] as s\r\n"
			+ "join (\r\n"
			+ "	select distinct s.service_id\r\n"
			+ "	from brand as b\r\n"
			+ "	join service as s on b.brand_id = s.brand_id\r\n"
			+ "	join brand_interaction as bi on b.brand_id = bi.brand_id\r\n"
			+ "	where bi.account_id = ?2 and bi.favourite = 1\r\n"
			+ "	union\r\n"
			+ "	select s.service_id\r\n"
			+ "	from [service] as s\r\n"
			+ "	join service_interaction as si on s.service_id = si.service_id\r\n"
			+ "	where si.account_id = ?2 and si.favourite = 1\r\n"
			+ "	union\r\n"
			+ "	select s.service_id\r\n"
			+ "	from [service] as s\r\n"
			+ "	where (s.price_for_adult-s.sale_price_for_adult)/s.price_for_adult*100 >= 10\r\n"
			+ ") as tb on s.service_id = tb.service_id\r\n"
			+ "order by NEWID()", nativeQuery=true)
	List<Service> findTopRecommendedService(int quantity, Long account);

	/**
	 * @param brandId
	 * @return
	 */
	List<Service> findAllByBrandBrandId(Long brandId);

	/**
	 * @param categoryId
	 * @param query
	 * @param i
	 * @param of
	 * @return
	 */
	Page<Service> findAllByServiceCategoryCategoryIdAndServiceNameContainingAndStatusOrderByDateCreatedDesc(Integer categoryId,
			String keyword, int status, Pageable pageable);

	

	/**
	 * @param query
	 * @param aCTIVE
	 * @param of
	 * @return
	 */
	Page<Service> findAllByServiceNameContainingAndStatusOrderByDateCreatedDesc(String query, int status,
			Pageable pageable);

	/**
	 * 
	 * @param categoryCode
	 * @param query
	 * @param status
	 * @param pageable
	 * @return
	 */
	Page<Service> findAllByServiceCategoryCategoryCodeContainingAndServiceNameContainingAndSalePriceForAdultBetweenAndStatusOrderByDateCreatedDesc(
			String categoryCode, String keyword, BigDecimal minPrice, BigDecimal maxPrice, int status, Pageable pageable);

	/**
	 * 
	 * @param categoryCode
	 * @param query
	 * @param status
	 * @param pageable
	 * @return
	 */
	Page<Service> findAllByServiceCategoryCategoryCodeContainingAndServiceNameContainingAndSalePriceForAdultBetweenAndStatus(
			String categoryCode, String keyword, BigDecimal minPrice, BigDecimal maxPrice, int status, Pageable pageable);

	/**
	 * @param categoryCode
	 * @param query
	 * @param minPrice
	 * @param maxPrice
	 * @param aCTIVE
	 * @param of
	 * @return
	 */
	@Query(value = "select s.*\r\n"
			+ "from [service] as s\r\n"
			+ "left join service_category as sc on s.category_id = sc.category_id\r\n"
			+ "left join (\r\n"
			+ "	select si.service_id, count(*) as number_of_favourite\r\n"
			+ "	from service_interaction as si\r\n"
			+ "	group by si.service_id\r\n"
			+ ") as tb on s.service_id = tb.service_id\r\n"
			+ "where sc.category_code like %?1% and s.service_name like %?2% and (s.sale_price_for_adult between ?3 and ?4) and s.status = ?5\r\n"
			+ "order by tb.number_of_favourite desc"
		, countQuery = "select count(*)\r\n"
			+ "from [service] as s\r\n"
			+ "left join service_category as sc on s.category_id = sc.category_id\r\n"
			+ "left join (\r\n"
			+ "	select si.service_id, count(*) as number_of_favourite\r\n"
			+ "	from service_interaction as si\r\n"
			+ "	group by si.service_id\r\n"
			+ ") as tb on s.service_id = tb.service_id\r\n"
			+ "where sc.category_code like %?1% and s.service_name like %?2% and (s.sale_price_for_adult between ?3 and ?4) and s.status = ?5\r\n"
		, nativeQuery = true)
	Page<Service> findAllByServiceCategoryCategoryCodeContainingAndServiceNameContainingAndSalePriceForAdultBetweenAndStatusOrderByFavourite(
			String categoryCode, String keyword, BigDecimal minPrice, BigDecimal maxPrice, int status, Pageable pageable);

	/**
	 * @param categoryCode
	 * @param query
	 * @param minPrice
	 * @param maxPrice
	 * @param aCTIVE
	 * @param of
	 * @return
	 */
	@Query(value = "select s.*\r\n"
			+ "from [service] as s\r\n"
			+ "left join service_category as sc on s.category_id = sc.category_id\r\n"
			+ "left join (\r\n"
			+ "	select bsd.service_id, count(*) as number_of_service_booking\r\n"
			+ "	from booking_service_detail as bsd\r\n"
			+ "	join booking as bo on bsd.booking_id = bo.booking_id\r\n"
			+ "	join booking_status as bs on bo.booking_status_id = bs.booking_status_id\r\n"
			+ "	where bs.booking_status_name like N'%kết thúc%'\r\n"
			+ "	group by bsd.service_id\r\n"
			+ ") as tb on s.service_id = tb.service_id\r\n"
			+ "where sc.category_code like %?1% and s.service_name like %?2% and (s.sale_price_for_adult between ?3 and ?4) and s.status = ?5\r\n"
			+ "order by tb.number_of_service_booking desc"
		, countQuery = "select count(*)\r\n"
			+ "from [service] as s\r\n"
			+ "left join service_category as sc on s.category_id = sc.category_id\r\n"
			+ "left join (\r\n"
			+ "	select bsd.service_id, count(*) as number_of_service_booking\r\n"
			+ "	from booking_service_detail as bsd\r\n"
			+ "	join booking as bo on bsd.booking_id = bo.booking_id\r\n"
			+ "	join booking_status as bs on bo.booking_status_id = bs.booking_status_id\r\n"
			+ "	where bs.booking_status_name like N'%kết thúc%'\r\n"
			+ "	group by bsd.service_id\r\n"
			+ ") as tb on s.service_id = tb.service_id\r\n"
			+ "where sc.category_code like %?1% and s.service_name like %?2% and (s.sale_price_for_adult between ?3 and ?4) and s.status = ?5\r\n"
		, nativeQuery = true)
	Page<Service> findAllByServiceCategoryCategoryCodeContainingAndServiceNameContainingAndSalePriceForAdultBetweenAndStatusOrderByTrending(
			String categoryCode, String keyword, BigDecimal minPrice, BigDecimal maxPrice, int status, Pageable pageable);

	/**
	 * @param categoryCode
	 * @param query
	 * @param minPrice
	 * @param maxPrice
	 * @param aCTIVE
	 * @param of
	 * @return
	 */
	Page<Service> findAllByServiceCategoryCategoryCodeContainingAndServiceNameContainingAndSalePriceForAdultBetweenAndStatusOrderBySalePriceForAdultDesc(
			String categoryCode, String query, BigDecimal minPrice, BigDecimal maxPrice, int status, Pageable pageable);

	/**
	 * @param categoryCode
	 * @param query
	 * @param minPrice
	 * @param maxPrice
	 * @param aCTIVE
	 * @param of
	 * @return
	 */
	Page<Service> findAllByServiceCategoryCategoryCodeContainingAndServiceNameContainingAndSalePriceForAdultBetweenAndStatusOrderBySalePriceForAdultAsc(
			String categoryCode, String query, BigDecimal minPrice, BigDecimal maxPrice, int status, Pageable pageable);

	/**
	 * @param categoryCode
	 * @param query
	 * @param minPrice
	 * @param maxPrice
	 * @param aCTIVE
	 * @param of
	 * @return
	 */
	@Query(value="select *\r\n"
			+ "from [service] as s\r\n"
			+ "left join service_category as sc on s.category_id = sc.category_id\r\n"
			+ "where sc.category_code like %?1% and s.service_name like %?2% \r\n"
			+ "and (s.sale_price_for_adult between ?3 and ?4 and s.status = ?5) \r\n"
			+ "and s.sale_price_for_adult != s.price_for_adult\r\n"
			+ "order by ((s.price_for_adult-s.sale_price_for_adult)/s.price_for_adult*100) desc"
		, countQuery = "select COUNT(*)\r\n"
			+ "from [service] as s\r\n"
			+ "left join service_category as sc on s.category_id = sc.category_id\r\n"
			+ "where sc.category_code like %?1% and s.service_name like %?2% \r\n"
			+ "and (s.sale_price_for_adult between ?3 and ?4 and s.status = ?5)\r\n"
			+ "and s.sale_price_for_adult != s.price_for_adult\r\n"
		, nativeQuery = true)
	Page<Service> findAllByServiceCategoryCategoryCodeContainingAndServiceNameContainingAndSalePriceForAdultBetweenAndStatusOrderByInSaleDesc(
			String categoryCode, String query, BigDecimal minPrice, BigDecimal maxPrice, int status, Pageable pageable);
}
