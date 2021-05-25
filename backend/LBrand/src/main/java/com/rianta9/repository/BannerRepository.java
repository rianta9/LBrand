/**
 * 
 */
package com.rianta9.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.rianta9.entity.Banner;

/**
 * @author rianta9
 * @datecreated 1 thg 5, 2021 21:29:14
 */
public interface BannerRepository extends JpaRepository<Banner, Long>{
	@Query(value = "select * from banner where date_begin <= ?1 and date_end >= ?1", nativeQuery = true)
	List<Banner> findAllByDateActive(Date date);
}
