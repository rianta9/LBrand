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

import com.rianta9.entity.BookingProductDetail;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 20:55:08
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "bookingProductDetail", path = "booking-product-detail")
public interface BookingProductDetailRepository extends JpaRepository<BookingProductDetail, Long>{
	Page<BookingProductDetail> findByBookingBookingId(@RequestParam("bookingId") Long bookingId, Pageable pageable);
}
