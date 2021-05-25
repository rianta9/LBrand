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

import com.rianta9.entity.BrandComment;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 21:00:00
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "brandComment", path = "brand-comment")
public interface BrandCommentRepository extends JpaRepository<BrandComment, Long>{
	Page<BrandComment> findByBrandBrandId(@RequestParam("brandId") Long brandId, Pageable pageable);

	/**
	 * @param brandId
	 * @return
	 */
	List<BrandComment> findAllByBrandBrandId(Long brandId);
}
