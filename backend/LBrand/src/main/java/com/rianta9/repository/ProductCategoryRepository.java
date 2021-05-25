/**
 * 
 */
package com.rianta9.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.rianta9.entity.ProductCategory;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 21:11:55
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "productCategory", path = "product-category")
public interface ProductCategoryRepository extends JpaRepository<ProductCategory, Integer>{

}
