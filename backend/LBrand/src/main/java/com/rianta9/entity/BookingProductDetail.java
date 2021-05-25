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
 * @datecreated 15 thg 4, 2021 22:50:04
 */
@Getter
@Setter
@Entity
@NoArgsConstructor
public class BookingProductDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "bigint")
	private Long bookingDetailId;
	
	@ManyToOne
	@JoinColumn(name = "booking_id", nullable = false)
	private Booking booking;
	
	@ManyToOne
	@JoinColumn(name = "product_id", nullable = false)
	private Product product;
	
	@Column(nullable = false)
	private Integer quantity;
	
	@Column(columnDefinition = "money", nullable = false)
	private BigDecimal salePrice;
	
	
	public BookingProductDetail(Product product, int quantity, BigDecimal salePrice) {
		this.product = product;
		this.quantity = quantity;
		this.salePrice = salePrice;
	}
	
	public String getStringSalePrice() {
		return MoneyHelper.toMoneyType(salePrice);
	}
	
	public Long getTotalPrice() {
		return quantity*salePrice.longValue();
	}
	
	public String getStringTotalPrice() {
		return MoneyHelper.toMoneyType(getTotalPrice());
	}
}
