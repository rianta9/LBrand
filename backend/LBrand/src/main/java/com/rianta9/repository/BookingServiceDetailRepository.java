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

import com.rianta9.entity.BookingServiceDetail;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 20:56:27
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "bookingServiceDetail", path = "booking-service-detail")
public interface BookingServiceDetailRepository extends JpaRepository<BookingServiceDetail, Long>{
	Page<BookingServiceDetail> findByBookingBookingId(@RequestParam("bookingId") Long bookingId, Pageable pageable);
}
