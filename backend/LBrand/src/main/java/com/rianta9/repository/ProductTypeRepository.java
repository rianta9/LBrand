/**
 * 
 */
package com.rianta9.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.rianta9.entity.ProductType;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 21:14:53
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "productType", path = "product-type")
public interface ProductTypeRepository extends JpaRepository<ProductType, Integer>{

}
