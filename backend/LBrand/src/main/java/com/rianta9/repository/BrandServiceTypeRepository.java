/**
 * 
 */
package com.rianta9.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.rianta9.entity.BrandServiceType;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 21:02:45
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "brandServiceType", path = "brand-service-type")
public interface BrandServiceTypeRepository extends JpaRepository<BrandServiceType, Integer>{
	
	List<BrandServiceType> findAllByServiceTypeNameIgnoreCase(String serviceTypeName);
}
