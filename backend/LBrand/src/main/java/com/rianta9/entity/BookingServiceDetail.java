/**
 * 
 */
package com.rianta9.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.rianta9.util.MoneyHelper;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @author rianta9
 * @datecreated 15 thg 4, 2021 22:47:54
 */

@Getter
@Setter
@NoArgsConstructor
@Entity
public class BookingServiceDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "bigint")
	private Long bookingDetailId;
	
	@ManyToOne
	@JoinColumn(name = "booking_id", nullable = false)
	private Booking booking;
	
	@ManyToOne
	@JoinColumn(name = "service_id", nullable = false)
	private Service service;
	
	@Column(columnDefinition = "money", nullable = false)
	private BigDecimal salePriceForAdult;
	
	@Column(columnDefinition = "money", nullable = false)
	private BigDecimal salePriceForChildren;
	
	public String getStringSalePriceForAdult() {
		return MoneyHelper.toMoneyType(salePriceForAdult);
	}
	
	public String getStringSalePriceForChildren() {
		return MoneyHelper.toMoneyType(salePriceForChildren);
	}
}
