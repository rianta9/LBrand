/**
 * 
 */
package com.rianta9.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.rianta9.entity.BookingStatus;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 20:57:43
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "bookingStatus", path = "booking-status")
public interface BookingStatusRepository extends JpaRepository<BookingStatus, Integer>{
	BookingStatus findByBookingStatusId(Integer bookingStatusId);
}
