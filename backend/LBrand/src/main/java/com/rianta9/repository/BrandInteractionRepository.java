/**
 * 
 */
package com.rianta9.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.rianta9.entity.BrandInteraction;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 21:01:36
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "brandInteraction", path = "brand-interaction")
public interface BrandInteractionRepository extends JpaRepository<BrandInteraction, Long>{

	/**
	 * @param accountId
	 * @param brandId
	 * @return
	 */
	BrandInteraction findByAccountAccountIdAndBrandBrandId(Long accountId, Long brandId);
	
}
