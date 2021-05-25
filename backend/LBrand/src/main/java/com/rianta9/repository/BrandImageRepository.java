/**
 * 
 */
package com.rianta9.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.rianta9.entity.BrandImage;

/**
 * @author rianta9
 * @datecreated 5 thg 5, 2021 17:18:34
 */

@RepositoryRestResource(collectionResourceRel = "brandImage", path = "brand-image")
public interface BrandImageRepository extends JpaRepository<BrandImage, Long>{

}
