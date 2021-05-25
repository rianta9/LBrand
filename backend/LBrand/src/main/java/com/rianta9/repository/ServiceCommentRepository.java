/**
 * 
 */
package com.rianta9.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.rianta9.entity.ServiceComment;

/**
 * @author rianta9
 * @datecreated 7 thg 5, 2021 01:06:04
 */
public interface ServiceCommentRepository extends JpaRepository<ServiceComment, Long>{
	/**
	 * Lấy tất cả đánh giá về dịch vụ của 1 thương hiệu đang ở trạng thái chưa phản hồi
	 * @param brandId
	 * @return
	 */
	@Query(value="select sc.*\r\n"
			+ "from service_comment as sc\r\n"
			+ "join service as s on sc.service_id = s.service_id\r\n"
			+ "where s.brand_id = ?1", nativeQuery = true)
	List<ServiceComment> findAllByBrandId(Long brandId);
}
