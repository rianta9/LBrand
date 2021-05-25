/**
 * 
 */
package com.rianta9.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.rianta9.entity.Invoice;

/**
 * @author rianta9
 * @datecreated 17 thg 5, 2021 23:16:01
 */

@Repository
public interface InvoiceRepository extends JpaRepository<Invoice, Long>{
	Invoice findByInvoiceId(Long invoiceId);
	List<Invoice> findAllByBookingBookingId(Long bookingId);
}
