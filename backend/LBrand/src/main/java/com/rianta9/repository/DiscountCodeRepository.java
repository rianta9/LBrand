/**
 * 
 */
package com.rianta9.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestParam;

import com.rianta9.entity.DiscountCode;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 21:07:27
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "discountCode", path = "discount-code")
public interface DiscountCodeRepository extends JpaRepository<DiscountCode, Long>{
	Page<DiscountCode> findByBrandBrandId(@RequestParam("brandId") Long brandId, Pageable pageable);

	/**
	 * @param brandId
	 * @return
	 */
	List<DiscountCode> findAllByBrandBrandId(Long brandId);
	
	DiscountCode findOneByBrandBrandIdAndCode(Long brandId, String code);
}
