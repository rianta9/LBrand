/**
 * 
 */
package com.rianta9.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestParam;

import com.rianta9.entity.BrandAccount;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 20:48:14
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "brandAccount", path = "brand-account")
public interface BrandAccountRepository extends JpaRepository<BrandAccount, Long>{
	Page<BrandAccount> findByBrandBrandId(@RequestParam("brandId") Long brandId, Pageable pageable);
	
	BrandAccount findByAccountAccountId(Long accountId);
	
	BrandAccount findByBrandBrandIdAndAccountUsername(Long brandId, String username);

	/**
	 * @param brandAccountId
	 * @return
	 */
	BrandAccount findByBrandAccountId(Long brandAccountId);
}
