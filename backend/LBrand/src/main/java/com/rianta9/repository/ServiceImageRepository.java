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

import com.rianta9.entity.ServiceImage;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 21:19:21
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "serviceImage", path = "service-image")
public interface ServiceImageRepository extends JpaRepository<ServiceImage, Long>{
	Page<ServiceImage> findByServiceServiceId(@RequestParam("serviceId") Long serviceId, Pageable pageable);
}
