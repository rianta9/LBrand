/**
 * 
 */
package com.rianta9.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestParam;

import com.rianta9.entity.ProductComment;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 21:13:05
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "productComment", path = "product-comment")
public interface ProductCommentRepository extends JpaRepository<ProductComment, Long>{
	Page<ProductComment> findByProductProductId(@RequestParam("productId") Long productId, Pageable pageable);

	
	/**
	 * @param brandId
	 * @return
	 */
	@Query(value = "select pc.*\r\n"
			+ "from product_comment as pc\r\n"
			+ "join product as p on pc.product_id = p.product_id\r\n"
			+ "where p.brand_id = ?1", nativeQuery = true)
	List<ProductComment> findAllByBrandId(Long brandId);
}
