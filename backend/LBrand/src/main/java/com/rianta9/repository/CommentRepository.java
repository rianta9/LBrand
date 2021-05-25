/**
 * 
 */
package com.rianta9.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.rianta9.entity.Comment;
import com.rianta9.model.interf.IItemReview;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 21:04:43
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "comment", path = "comment")
public interface CommentRepository extends JpaRepository<Comment, Long>{
	
	@Query(value = "select bo.booking_id as bookingId, br.brand_id as brandId, br.brand_name as brandName, br.avatar, bo.date_created as dateCreated, bo.date_in as dateIn from booking as bo\r\n"
			+ "join brand_capacity as bca on bo.brand_capacity_id = bca.brand_capacity_id\r\n"
			+ "join brand as br on bca.brand_id = br.brand_id\r\n"
			+ "left join brand_comment as bc on bo.booking_id = bc.booking_id\r\n"
			+ "where bo.account_id = ?1 and bo.booking_status_id = 3 and brand_comment_id is null", nativeQuery = true)
	List<IItemReview> listItemBrandReview(Long accountId);
}
