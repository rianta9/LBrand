/**
 * 
 */
package com.rianta9.converter;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.rianta9.entity.Booking;
import com.rianta9.entity.BookingStatus;
import com.rianta9.entity.PaymentMethod;
import com.rianta9.form.BookingForm;
import com.rianta9.repository.AccountRepository;
import com.rianta9.repository.BookingStatusRepository;
import com.rianta9.repository.BrandCapacityRepository;
import com.rianta9.repository.PaymentMethodRepository;
import com.rianta9.util.Constants;
import com.rianta9.util.DateTimeUtil;

/**
 * @author rianta9
 * @datecreated 9 thg 5, 2021 08:42:16
 */
@Component
public class BookingConverter {
	@Autowired
	private AccountRepository accountRepository;
	
	@Autowired
	private BookingStatusRepository bookingStatusRepository;
	
	@Autowired
	private BrandCapacityRepository brandCapacityRepository;
	
	@Autowired
	private PaymentMethodRepository paymentMethodRepository;
	
	public Booking toEntity(BookingForm bookingForm) {
		if(bookingForm == null) return null;
		Booking result = new Booking();
		result.setAccount(accountRepository.findByAccountId(bookingForm.getAccountId()));
		result.setBookingStatus(bookingStatusRepository.getOne(Constants.BookingStatus.WAIT_FOR_CONFIRM));
		if(bookingForm.getDeposit() > 0l) {
			result.setBookingStatus(bookingStatusRepository.getOne(Constants.BookingStatus.WAIT_FOR_CONFIRM_AND_UNPAID_DEPOSIT));
		}
		result.setContactInfo(bookingForm.getContactInfo());
		result.setNote(bookingForm.getNote());
		result.setDateCreated(new Date());
		result.setDateIn(bookingForm.getDateIn());
		result.setTimeIn(DateTimeUtil.toTimeUtil(bookingForm.getTimeIn()));
		result.setBrandCapacity(brandCapacityRepository.getOne(bookingForm.getCapacityId()));
//		result.setListBookingProductDetail(new ArrayList<>());
//		result.setListBookingServiceDetail(new ArrayList<>());
		result.setDeposit(new BigDecimal(bookingForm.getDeposit()));
		result.setDiscount(new BigDecimal(bookingForm.getDiscount()));
		result.setPaymentMethod(paymentMethodRepository.getOne(bookingForm.getPaymentMethodId()));
		result.setNumberOfAdults(bookingForm.getNumberOfAdult());
		result.setNumberOfChildren(bookingForm.getNumberOfChildren());
		return result;
	}
}
