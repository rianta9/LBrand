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

import com.rianta9.entity.ProductImage;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 21:13:57
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "productImage", path = "product-image")
public interface ProductImageRepository extends JpaRepository<ProductImage, Long>{
	Page<ProductImage> findByProductProductId(@RequestParam("productId") Long productId, Pageable pageable);
}
