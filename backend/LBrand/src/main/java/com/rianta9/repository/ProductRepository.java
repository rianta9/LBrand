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

import com.rianta9.entity.Product;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 21:10:06
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "product", path = "product")
public interface ProductRepository extends JpaRepository<Product, Long>{
	Page<Product> findByBrandBrandId(@RequestParam("brandId") Long brandId, Pageable pageable);
	
	List<Product> findAllByBrandBrandId(Long brandId);
	
	Product findOneByBrandBrandIdAndProductId(Long brandId, Long productId);
	
	Product findOneByBrandBrandIdAndProductNameIgnoreCase(Long brandId, String productName);
	
	Product findOneByBrandBrandIdAndProductIdNotAndProductNameIgnoreCase(Long brandId, Long productId, String productName);

	/**
	 * @param productId
	 * @return
	 */
	Product findByProductId(Long productId);

}
