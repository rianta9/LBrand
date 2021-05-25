/**
 * 
 */
package com.rianta9.repository;

import java.util.List;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestParam;

import com.rianta9.entity.Account;
import com.rianta9.entity.Brand;
import com.rianta9.model.interf.IItemStatistic;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 20:58:58
 */

@RepositoryRestResource(collectionResourceRel = "brand", path = "brand")
public interface BrandRepository extends JpaRepository<Brand, Long> {
	
	Brand findByBrandId(Long id);
	
	Page<Brand> findByServiceTypeServiceTypeId(@RequestParam("serviceTypeId") Integer serviceTypeId, Pageable pageable);

	Page<Brand> findByBrandNameContaining(@RequestParam("brandName") String brandName, Pageable pageable);

	Page<Brand> findAllByStatus(int status, Pageable pageable);

	Page<Brand> findAllByBrandNameContainingAndStatus(String query, int status, Pageable pageable);

	/**
	 * Lấy top thương hiệu bán chạy nhất trong tháng
	 * 
	 * @param quantity Số lương lấy ra
	 * @return
	 */
	@Query(value = "select b.*\r\n" + "from brand as b\r\n" + "join(\r\n"
			+ "	select top (?1) br.brand_id, COUNT(*) as number_of_booking \r\n" + "	from brand as br\r\n"
			+ "	join brand_capacity as bc on br.brand_id = bc.brand_id\r\n"
			+ "	join booking as bo on bc.brand_capacity_id = bo.brand_capacity_id\r\n"
			+ "	where bo.date_created between DATEADD(MONTH, -1, GETDATE()) and GETDATE() and bo.booking_status_id = 3\r\n"
			+ "	group by br.brand_id\r\n" + "	order by number_of_booking desc\r\n"
			+ ") as tb on b.brand_id = tb.brand_id", nativeQuery = true)
	List<Brand> findTopBestSellerBrandByMonth(int quantity);

	/**
	 * Lấy lịch sử thương hiệu đã xem
	 * 
	 * @param quantity  Số lượng lấy ra
	 * @param accountId Lấy lịch sử của tài khoản
	 * @return
	 */
	@Query(value = "select top(?1) b.*\r\n" + "from brand as b\r\n"
			+ "join brand_interaction as bi on b.brand_id = bi.brand_id\r\n" + "where bi.account_id = ?2\r\n"
			+ "order by bi.last_view_date desc\r\n" + "", nativeQuery = true)
	List<Brand> findTopViewedHistory(int quantity, Long accountId);

	/**
	 * Tìm kiếm theo tên thương hiệu, trạng thái, sắp xếp theo thương hiệu mới
	 * @param query
	 * @param p
	 * @param object
	 * @return
	 */
	Page<Brand> findAllByBrandNameContainingAndStatusOrderByDateCreatedDesc(String query, int status, Pageable pageable);

	

	
	/**
	 * Tìm kiếm theo loại hình dịch vụ, tên thương hiệu, trạng thái và sắp xếp theo thương hiệu mới
	 * 
	 * @param serviceTypeId
	 * @param query
	 * @param status
	 * @param pageable
	 * @return
	 */
	Page<Brand> findAllByServiceTypeServiceTypeIdAndBrandNameContainingAndStatusOrderByDateCreatedDesc(
			Integer serviceTypeId, String query, int status, Pageable pageable);

	/**
	 * Tìm kiếm theo loại hình dịch vụ, tên thương hiệu và trạng thái
	 * 
	 * @param query
	 * @param status
	 * @param pageable
	 * @return
	 */
	Page<Brand> findAllByServiceTypeServiceTypeIdAndBrandNameContainingAndStatus(Integer serviceTypeId, String query,
			int status, Pageable pageable);

	/**
	 * 
	 * @param category
	 * @param status
	 * @param pageable
	 * @return
	 */
	Page<Brand> findAllByServiceTypeServiceTypeIdAndStatus(Integer serviceTypeId, int status, Pageable pageable);

	/**
	 * @param query
	 * @param p
	 * @return
	 */
	@Query(value = "select b.*\r\n"
			+ "from brand as b\r\n"
			+ "left join(\r\n"
			+ "	select br.brand_id, COUNT(*) as number_of_booking \r\n"
			+ "	from brand as br\r\n"
			+ "	left join brand_capacity as bc on br.brand_id = bc.brand_id\r\n"
			+ "	left join booking as bo on bc.brand_capacity_id = bo.brand_capacity_id\r\n"
			+ "	where \r\n"
			+ "		bo.date_created between DATEADD(MONTH, -1, GETDATE()) and GETDATE() and bo.booking_status_id = 3\r\n"
			+ "	group by br.brand_id\r\n"
			+ ") as tb on b.brand_id = tb.brand_id\r\n"
			+ "where b.brand_name like %?1% and b.status = ?2\r\n"
			+ "order by number_of_booking desc", 
		countQuery = "select count(*)\r\n"
			+ "from brand as b\r\n"
			+ "left join(\r\n"
			+ "	select br.brand_id, COUNT(*) as number_of_booking \r\n"
			+ "	from brand as br\r\n"
			+ "	left join brand_capacity as bc on br.brand_id = bc.brand_id\r\n"
			+ "	left join booking as bo on bc.brand_capacity_id = bo.brand_capacity_id\r\n"
			+ "	where \r\n"
			+ "		bo.date_created between DATEADD(MONTH, -1, GETDATE()) and GETDATE() and bo.booking_status_id = 3\r\n"
			+ "	group by br.brand_id\r\n"
			+ ") as tb on b.brand_id = tb.brand_id\r\n"
			+ "where b.brand_name like %?1% and b.status = ?2\r\n"
			
		, nativeQuery = true)
	Page<Brand> findAllByBrandNameLikeAndStatusOrderByTrending(String query, int status, Pageable pageable);

	
	@Query(value = "select b.*\r\n" + "from brand as b\r\n" + "left join(\r\n"
			+ "	select br.brand_id, COUNT(*) as number_of_booking \r\n" + "	from brand as br\r\n"
			+ "	left join brand_capacity as bc on br.brand_id = bc.brand_id\r\n"
			+ "	left join booking as bo on bc.brand_capacity_id = bo.brand_capacity_id\r\n"
			+ "	where bo.date_created between DATEADD(MONTH, -1, GETDATE()) and GETDATE() and bo.booking_status_id = 3\r\n"
			+ "	group by br.brand_id\r\n" + ") as tb on b.brand_id = tb.brand_id\r\n"
			+ " where b.service_type_id = ?1 and b.brand_name like %?2% and b.status = ?3\r\n"
			+ "order by number_of_booking desc"
		, countQuery = "select count(*)\r\n" + "from brand as b\r\n" + "left join(\r\n"
			+ "	select br.brand_id, COUNT(*) as number_of_booking \r\n" + "	from brand as br\r\n"
			+ "	left join brand_capacity as bc on br.brand_id = bc.brand_id\r\n"
			+ "	left join booking as bo on bc.brand_capacity_id = bo.brand_capacity_id\r\n"
			+ "	where bo.date_created between DATEADD(MONTH, -1, GETDATE()) and GETDATE() and bo.booking_status_id = 3\r\n"
			+ "	group by br.brand_id\r\n" + ") as tb on b.brand_id = tb.brand_id\r\n"
			+ " where b.service_type_id = ?1 and b.brand_name like %?2% and b.status = ?3\r\n"
			
		, nativeQuery = true)
	Page<Brand> findAllByServiceTypeIdAndBrandNameLikeAndStatusOrderByTrending(Integer serviceTypeId, String query,
			int status, Pageable pageable);

	/**
	 * Tìm kiếm thương hiệu theo tên và trạng thái, sắp xếp theo lượt yêu thích
	 * 
	 * @param query
	 * @param p
	 * @return
	 */
	@Query(value = "select b.*\r\n"
			+ "from brand as b\r\n"
			+ "left join(\r\n"
			+ "	select br.brand_id, COUNT(*) as number_of_favourite\r\n"
			+ "	from brand as br \r\n"
			+ "	join brand_interaction as bi on br.brand_id = bi.brand_id\r\n"
			+ "	where bi.favourite = 1\r\n"
			+ "	group by br.brand_id\r\n"
			+ ") as tb on b.brand_id = tb.brand_id\r\n"
			+ "where b.brand_name like %?1% and b.status = ?2\r\n"
			+ "order by number_of_favourite"
		, countQuery = "select count(*)\r\n"
			+ "from brand as b\r\n"
			+ "left join(\r\n"
			+ "	select br.brand_id, COUNT(*) as number_of_favourite\r\n"
			+ "	from brand as br \r\n"
			+ "	join brand_interaction as bi on br.brand_id = bi.brand_id\r\n"
			+ "	where bi.favourite = 1\r\n"
			+ "	group by br.brand_id\r\n"
			+ ") as tb on b.brand_id = tb.brand_id\r\n"
			+ "where b.brand_name like %?1% and b.status = ?2\r\n"
		, nativeQuery = true)
	Page<Brand> findAllByBrandNameLikeAndStatusOrderByFavourite(String query, int status, Pageable pageable);

	@Query(value = "select b.*\r\n"
			+ "from brand as b\r\n"
			+ "left join(\r\n"
			+ "	select br.brand_id, COUNT(*) as number_of_favourite\r\n"
			+ "	from brand as br \r\n"
			+ "	join brand_interaction as bi on br.brand_id = bi.brand_id\r\n"
			+ "	where bi.favourite = 1\r\n"
			+ "	group by br.brand_id\r\n"
			+ ") as tb on b.brand_id = tb.brand_id\r\n"
			+ "where b.service_type_id = ?1 and b.brand_name like %?2% and b.status = ?3\r\n"
			+ "order by number_of_favourite"
		, countQuery = "select count(*)\r\n"
			+ "from brand as b\r\n"
			+ "left join(\r\n"
			+ "	select br.brand_id, COUNT(*) as number_of_favourite\r\n"
			+ "	from brand as br \r\n"
			+ "	join brand_interaction as bi on br.brand_id = bi.brand_id\r\n"
			+ "	where bi.favourite = 1\r\n"
			+ "	group by br.brand_id\r\n"
			+ ") as tb on b.brand_id = tb.brand_id\r\n"
			+ "where b.service_type_id = ?1 and b.brand_name like %?2% and b.status = ?3\r\n"
		, nativeQuery = true)
	Page<Brand> findAllByServiceTypeIdAndBrandNameLikeAndStatusOrderByFavourite(Integer serviceTypeId, String query,
			int status, Pageable pageable);
	
	Brand findByPhoneAndBrandIdNot(String phone, Long brandId);
	Brand findByTelAndBrandIdNot(String tel, Long brandId);
	
	Brand findByPhone(String phone);
	Brand findByTel(String tel);
	
	/**
	 * Thống kê top 10 thương hiệu nổi bật nhất
	 * @param month
	 * @return
	 */
	@Query(value = "select top 10 br.brand_id as brandId, br.brand_name as brandName, br.avatar, COUNT(*) as statisticValue from brand as br\r\n"
			+ "join brand_capacity as bc on br.brand_id = bc.brand_id\r\n"
			+ "join booking as bo on bc.brand_capacity_id = bo.brand_capacity_id\r\n"
			+ "where MONTH(bo.date_created) = ?1 and YEAR(bo.date_created) = ?2 and bo.booking_status_id = 3\r\n"
			+ "group by br.brand_id, br.brand_name, br.avatar\r\n"
			+ "order by statisticValue desc", nativeQuery = true)
	List<IItemStatistic> top10BestSellerBrand(int month, int year);
	
	
	@Query(value = "select top 10 b.brand_id as brandId, b.brand_name as brandName, b.avatar, number_of_favourite as statisticValue\r\n"
			+ "from brand as b\r\n"
			+ "join(\r\n"
			+ "	select bi.brand_id, COUNT(*) as number_of_favourite\r\n"
			+ "	from brand_interaction as bi\r\n"
			+ "	where bi.favourite = 1 and MONTH(bi.last_view_date) = ?1 and YEAR(bi.last_view_date) = ?2\r\n"
			+ "	group by bi.brand_id\r\n"
			+ ") as tb on b.brand_id = tb.brand_id\r\n"
			+ "where b.status = 1\r\n"
			+ "order by number_of_favourite desc", nativeQuery = true)
	List<IItemStatistic> top10BestFavouriteBrand(int month, int year);
	
	@Query(value = "select br.brand_id as brandId, br.avatar, br.brand_name as brandName, sum(case when totalPrice is null then 0 else totalPrice end) as statisticValue\r\n"
			+ "from brand as br\r\n"
			+ "left join brand_capacity as bc on br.brand_id = bc.brand_id\r\n"
			+ "left join booking as bo on bo.brand_capacity_id = bc.brand_capacity_id\r\n"
			+ "left join(\r\n"
			+ "	select b.booking_id, b.date_created, \r\n"
			+ "	SUM(bpd.sale_price*bpd.quantity-b.deposit) as totalPrice\r\n"
			+ "	from booking as b\r\n"
			+ "	join booking_product_detail as bpd on b.booking_id = bpd.booking_id\r\n"
			+ "	where MONTH(b.date_in) = ?1 and YEAR(b.date_in) = ?2 and b.booking_status_id = 3\r\n"
			+ "	group by b.booking_id, b.date_created\r\n"
			+ "	union all\r\n"
			+ "	select b.booking_id, b.date_created,\r\n"
			+ "	SUM(b.number_of_adults*bsd.sale_price_for_adult+b.number_of_children*bsd.sale_price_for_children-b.deposit) as totalPrice\r\n"
			+ "	from booking as b\r\n"
			+ "	join booking_service_detail as bsd on b.booking_id = bsd.booking_id\r\n"
			+ "	where MONTH(b.date_in) = ?1 and YEAR(b.date_in) = ?2 and b.booking_status_id = 3\r\n"
			+ "	group by b.booking_id, b.date_created\r\n"
			+ ") as tb on bo.booking_id = tb.booking_id\r\n"
			+ "group by br.brand_id, br.avatar, br.brand_name order by statisticValue desc", nativeQuery = true)
	List<IItemStatistic> findAllBrandSalesByMonthAndYear(int month, int year);

}
