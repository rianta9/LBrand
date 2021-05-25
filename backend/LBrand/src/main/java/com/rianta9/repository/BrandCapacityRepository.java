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

import com.rianta9.entity.BrandCapacity;
import com.rianta9.model.interf.IBrandCapacityStatistic;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 20:52:22
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "brandCapacity", path = "brand-capacity")
public interface BrandCapacityRepository extends JpaRepository<BrandCapacity, Long>{
	List<BrandCapacity> findAllByBrandBrandId(@RequestParam("brandId") Long brandId);
	
	
	@Query(value="select bc.brand_capacity_id as brandCapacityId, bc.floor, bc.slot, case when b.num_of_reserved is NULL then 0 else b.num_of_reserved end as numberOfReserved\r\n"
			+ "from (\r\n"
			+ "	select *\r\n"
			+ "	from brand_capacity as bc\r\n"
			+ "	where bc.brand_id = ?1\r\n"
			+ ") as bc \r\n"
			+ "left join (\r\n"
			+ "	select b.brand_capacity_id, sum(b.number_of_adults+b.number_of_children) as num_of_reserved\r\n"
			+ "	from booking as b\r\n"
			+ "	where b.date_in = ?2 and b.time_in = ?3\r\n"
			+ "	group by b.brand_capacity_id\r\n"
			+ ") as b on bc.brand_capacity_id = b.brand_capacity_id", nativeQuery = true)
	List<IBrandCapacityStatistic> findAllByBrandIdAndDateInAndTimeIn(Long brandId, Date dateIn, String timeIn);
	
	
	@Query(value = "select top 1 bc.brand_capacity_id as brandCapacityId, bc.floor as floor, bc.slot, case when b.num_of_reserved is NULL then 0 else b.num_of_reserved end as numberOfReserved\r\n"
			+ "from (\r\n"
			+ "	select *\r\n"
			+ "	from brand_capacity as bc\r\n"
			+ "	where bc.brand_id = ?1 and bc.brand_capacity_id = ?2\r\n"
			+ ") as bc \r\n"
			+ "left join (\r\n"
			+ "	select b.brand_capacity_id, sum(b.number_of_adults+b.number_of_children) as num_of_reserved\r\n"
			+ "	from booking as b\r\n"
			+ "	where b.date_in = ?3 and b.time_in = ?4\r\n"
			+ "	group by b.brand_capacity_id\r\n"
			+ ") as b on bc.brand_capacity_id = b.brand_capacity_id", nativeQuery = true)
	IBrandCapacityStatistic findByBrandIdAndCapacityIdAndDateInAndTimeIn(Long brandId, Long capacityId, Date dateIn, String timeIn);
}
