/**
 * 
 */
package com.rianta9.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestParam;

import com.rianta9.entity.Booking;
import com.rianta9.model.interf.ISalesStatistic;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 20:53:38
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "booking", path = "booking")
public interface BookingRepository extends JpaRepository<Booking, Long>{
	Page<Booking> findByAccountAccountId(@RequestParam("accountId") Long accountId, Pageable pageable);

	/**
	 * @param brandId
	 * @return
	 */
	@Query(value = "select b.*\r\n"
			+ "from booking as b\r\n"
			+ "join brand_capacity as bc on b.brand_capacity_id = bc.brand_capacity_id\r\n"
			+ "where bc.brand_id = ?1", nativeQuery = true)
	List<Booking> findAllByBrandId(Long brandId);

	/**
	 * @param accountId
	 * @return
	 */
	List<Booking> findAllByAccountAccountId(Long accountId);
	
	List<Booking> findAllByAccountAccountIdOrderByDateCreatedDesc(Long accountId);
	
	Booking findByBookingIdAndAccountAccountId(Long bookingId, Long accountId);

	/**
	 * @param valueOf
	 * @return
	 */
	Booking findByBookingId(Long bookingId);

	/**
	 * @param brandId
	 * @param bookingId
	 * @return
	 */
	Booking findAllByBrandCapacityBrandBrandIdAndBookingId(Long brandId, Long bookingId);
	
	List<Booking> findAllByAccountAccountIdAndDateCreated(Long accountId, Date dateCreated);
	
	/**
	 * Thống kê số lượng đơn đặt bàn theo các tháng của năm
	 * @param year
	 * @return
	 */
	@Query(value="select m.month, count(b.booking_id) as value \r\n"
			+ "from temp_month as m \r\n"
			+ "left join (\r\n"
			+ "	select * from booking as b\r\n"
			+ "	where year(b.date_created) = ?1\r\n"
			+ ") as b on m.month = MONTH(b.date_created)\r\n"
			+ "group by m.month", nativeQuery = true)
	List<ISalesStatistic> listBookingStatisticByMonthsOfYear(int year);
	
	
	@Query(value = "select m.month, count(tb.booking_id) as value \r\n"
			+ "from temp_month as m \r\n"
			+ "left join (\r\n"
			+ "	select b.* from booking as b\r\n"
			+ "	join brand_capacity as bc on b.brand_capacity_id = bc.brand_capacity_id\r\n"
			+ "	where bc.brand_id = ?1 and year(b.date_created) = ?2\r\n"
			+ ") as tb on m.month = MONTH(tb.date_created)\r\n"
			+ "group by m.month", nativeQuery = true)
	List<ISalesStatistic> listBookingStatisticByMonthsOfYear(Long brandId, int year);
	
	/**
	 * Thống kê doanh số đặt bàn gọi món theo từng tháng của năm
	 * @param year
	 * @return
	 */
	@Query(value = "select m.month, case when sales is null then 0 else sales end as value \r\n"
			+ "from temp_month as m\r\n"
			+ "left join(\r\n"
			+ "	select MONTH(b.date_in) as month, case when SUM(tb.sales) is null then 0 else SUM(tb.sales-b.deposit) end as sales\r\n"
			+ "	from booking as b \r\n"
			+ "	join(\r\n"
			+ "		select bpd.booking_id, SUM(bpd.quantity*bpd.sale_price) as sales\r\n"
			+ "		from booking_product_detail as bpd\r\n"
			+ "		group by bpd.booking_id\r\n"
			+ "	) as tb on b.booking_id = tb.booking_id\r\n"
			+ "	where b.booking_status_id = 3 and YEAR(b.date_in) = ?1\r\n"
			+ "	group by MONTH(b.date_in)\r\n"
			+ ") as tb on m.month = tb.month\r\n"
			+ "group by m.month, sales", nativeQuery = true)
	List<ISalesStatistic> listProductBookingSalesStatisticByMonthsOfYear(int year);
	
	
	/**
	 * Thống kê doanh số đặt bàn gọi món theo từng tháng của năm của một thương hiệu
	 * @param brandId
	 * @param year
	 * @return
	 */
	@Query(value = "select m.month, case when sales is null then 0 else sales end as value \r\n"
			+ "from temp_month as m\r\n"
			+ "left join(\r\n"
			+ "	select MONTH(b.date_in) as month, case when SUM(tb.sales) is null then 0 else SUM(tb.sales-b.deposit) end as sales\r\n"
			+ "	from booking as b \r\n"
			+ "	join brand_capacity as bc on b.brand_capacity_id = bc.brand_capacity_id\r\n"
			+ "	join(\r\n"
			+ "		select bpd.booking_id, SUM(bpd.quantity*bpd.sale_price) as sales\r\n"
			+ "		from booking_product_detail as bpd\r\n"
			+ "		group by bpd.booking_id\r\n"
			+ "	) as tb on b.booking_id = tb.booking_id\r\n"
			+ "	where bc.brand_id = ?1 and b.booking_status_id = 3 and YEAR(b.date_in) = ?2\r\n"
			+ "	group by MONTH(b.date_in)\r\n"
			+ ") as tb on m.month = tb.month\r\n"
			+ "group by m.month, sales", nativeQuery = true)
	List<ISalesStatistic> listProductBookingSalesStatisticByMonthsOfYear(Long brandId, int year);
	
	
	/**
	 * Thống kê doanh số đặt bàn dịch vụ theo từng tháng của năm
	 * @param year
	 * @return
	 */
	@Query(value = "select m.month, case when sales is null then 0 else sales end as value \r\n"
			+ "from temp_month as m\r\n"
			+ "left join(\r\n"
			+ "	select MONTH(b.date_in) as month, SUM(b.number_of_children*bsd.sale_price_for_children+b.number_of_adults*sale_price_for_adult - b.deposit) as sales\r\n"
			+ "	from booking as b \r\n"
			+ "	join booking_service_detail as bsd on b.booking_id = bsd.booking_id\r\n"
			+ "	where b.booking_status_id = 3 and YEAR(b.date_in) = ?1\r\n"
			+ "	group by MONTH(b.date_in)\r\n"
			+ ") as tb on m.month = tb.month\r\n"
			+ "group by m.month, sales", nativeQuery = true)
	List<ISalesStatistic> listServiceBookingSalesStatisticByMonthsOfYear(int year);
	
	
	@Query(value = "select m.month, case when sales is null then 0 else sales end as value \r\n"
			+ "from temp_month as m\r\n"
			+ "left join(\r\n"
			+ "	select MONTH(b.date_in) as month, SUM(b.number_of_children*bsd.sale_price_for_children+b.number_of_adults*sale_price_for_adult - b.deposit) as sales\r\n"
			+ "	from booking as b\r\n"
			+ "	join brand_capacity as bc on b.brand_capacity_id = bc.brand_capacity_id\r\n"
			+ "	join booking_service_detail as bsd on b.booking_id = bsd.booking_id\r\n"
			+ "	where bc.brand_id = ?1 and b.booking_status_id = 3 and YEAR(b.date_in) = ?2\r\n"
			+ "	group by MONTH(b.date_in)\r\n"
			+ ") as tb on m.month = tb.month\r\n"
			+ "group by m.month, sales", nativeQuery = true)
	List<ISalesStatistic> listServiceBookingSalesStatisticByMonthsOfYear(Long brandId, int year);
}
