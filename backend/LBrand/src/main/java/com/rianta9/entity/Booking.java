/**
 * 
 */
package com.rianta9.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rianta9.util.Constants;
import com.rianta9.util.DateTimeUtil;
import com.rianta9.util.MoneyHelper;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @author rianta9
 * @datecreated 15 thg 4, 2021 22:24:22
 */
@Getter
@Setter
@Entity
@ToString
public class Booking {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "bigint")
	private Long bookingId;

	@ManyToOne
	@JoinColumn(name = "account_id", nullable = false)
	private Account account;

	@ManyToOne
	@JoinColumn(name = "brand_capacity_id")
	private BrandCapacity brandCapacity;

	@Basic
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateCreated;

	@ManyToOne
	@JoinColumn(name = "booking_status_id", nullable = false)
	private BookingStatus bookingStatus;

	@Column(nullable = false)
	private Integer numberOfAdults;

	@Column(nullable = false)
	private Integer numberOfChildren;

	private String note;
	private String contactInfo;

	@Basic
	@Column(nullable = false)
	@Temporal(TemporalType.DATE)
	@JsonFormat(pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateIn;

	@Basic
	@Column(nullable = false)
	@Temporal(TemporalType.TIME)
	@JsonFormat(pattern = "HH:mm")
	@DateTimeFormat(pattern = "HH:mm")
	private Date timeIn;

	@ManyToOne
	@JoinColumn(name = "payment_method_id", nullable = false)
	private PaymentMethod paymentMethod;

	@Column(nullable = false, columnDefinition = "money")
	private BigDecimal deposit; // số tiền đặt cọc

	@Column(nullable = false, columnDefinition = "money")
	private BigDecimal discount;

	@OneToMany(mappedBy = "booking", cascade = CascadeType.ALL)
	private List<BookingProductDetail> listBookingProductDetail;

	@OneToMany(mappedBy = "booking", cascade = CascadeType.ALL)
	private List<BookingServiceDetail> listBookingServiceDetail;

	public Booking() {
		listBookingProductDetail = new ArrayList<BookingProductDetail>();
		listBookingProductDetail = new ArrayList<BookingProductDetail>();
	}

	public String getStringDateCreated() {
		return DateTimeUtil.toStringType(this.dateCreated);
	}

	public String getStringDateIn() {
		return DateTimeUtil.toStringType(this.dateIn);
	}

	public String getStringTimeIn() {
		return DateTimeUtil.toStringTimeTypeHHmm(timeIn);
	}

	/**
	 * Tìm kiếm một sản phẩm trong danh sách sản phẩm
	 * 
	 * @param productId
	 * @return
	 */
	public BookingProductDetail findBookingProductDetail(Long productId) {
		if (listBookingProductDetail == null) {
			listBookingProductDetail = new ArrayList<BookingProductDetail>();
			return null;
		}
		for (BookingProductDetail bookingProductDetail : listBookingProductDetail) {
			if (bookingProductDetail != null && bookingProductDetail.getProduct().getProductId() == productId)
				return bookingProductDetail;
		}
		return null;
	}

	/**
	 * Lấy loại đặt bàn(thông thường, đặt bàn dịch vụ, đặt bàn gọi món)
	 * 
	 * @return
	 */
	public String getBookingType() {
		if (listBookingServiceDetail.size() != 0) {
			String type = "Đặt bàn dịch vụ " + listBookingServiceDetail.get(0).getService().getServiceName();
			if (listBookingProductDetail.size() != 0)
				type += " + Đặt bàn gọi món";
			return type;
		}

		else if (listBookingProductDetail.size() != 0)
			return "Đặt bàn gọi món";
		else
			return "Đặt bàn thông thường";
	}

	/**
	 * Lấy tổng tiền dịch vụ
	 * 
	 * @return
	 */
	public Long getTotalPriceOfService() {
		Long totalPrice = 0l;
		if (listBookingServiceDetail != null && listBookingServiceDetail.size() != 0) {
			for (BookingServiceDetail booking : listBookingServiceDetail) {
				totalPrice += booking.getSalePriceForAdult().longValue() * numberOfAdults;
				totalPrice += booking.getSalePriceForChildren().longValue() * numberOfChildren;
			}
		}
		return totalPrice;
	}

	public String getStringTotalPriceOfService() {
		return MoneyHelper.toMoneyType(getTotalPriceOfService());
	}

	/**
	 * Lấy tổng tiền của các sản phẩm*số lượng
	 * 
	 * @return
	 */
	public Long getTotalPriceOfListProduct() {
		Long totalPrice = 0l;
		if (listBookingProductDetail != null && listBookingProductDetail.size() != 0) {
			for (BookingProductDetail booking : listBookingProductDetail) {
				totalPrice += booking.getSalePrice().longValue() * booking.getQuantity();
			}
		}
		return totalPrice;
	}

	public String getStringTotalPriceOfListProduct() {
		return MoneyHelper.toMoneyType(getTotalPriceOfListProduct());
	}

	/**
	 * Lấy tổng tiền chưa tính giảm giá
	 * 
	 * @return
	 */
	public Long getTotalPriceWithoutDiscount() {
		Long totalPrice = 0l;
		totalPrice += getTotalPriceOfService();
		totalPrice += getTotalPriceOfListProduct();
		return totalPrice;
	}

	public String getStringTotalPriceWithoutDiscount() {
		if (listBookingProductDetail.size() == 0 && listBookingServiceDetail.size() == 0)
			return "Chưa tính";
		return MoneyHelper.toMoneyType(getTotalPriceWithoutDiscount());
	}

	/**
	 * Lấy số tiền giảm giá
	 * 
	 * @return
	 */
	public String getStringDiscountMoney() {
		if (discount == null)
			return MoneyHelper.toMoneyType(new BigDecimal(0));
		return MoneyHelper.toMoneyType(discount);
	}

	/**
	 * Lấy tổng tiền hoá đơn sau khi đã giảm giá
	 * 
	 * @return
	 */
	public String getStringTotalPrice() {
		if (listBookingProductDetail.size() == 0 && listBookingServiceDetail.size() == 0)
			return "Chưa tính";
		return MoneyHelper.toMoneyType(getTotalPrice());
	}

	public Long getTotalPrice() {
		if (listBookingProductDetail.size() == 0 && listBookingServiceDetail.size() == 0)
			return 0l;
		Long discountMoney = 0l;
		if (discount != null)
			discountMoney = discount.longValue();
		Long totalPrice = getTotalPriceWithoutDiscount() - discountMoney;
		return totalPrice;
	}

	/**
	 * Lấy tiền đặt cọc
	 * 
	 * @return
	 */
	public String getStringDeposit() {
		return MoneyHelper.toMoneyType(deposit);
	}

	public String getStringId() {
		return String.format("%09d", bookingId);
	}

	public Brand getBrand() {
		return brandCapacity.getBrand();
	}

	public boolean needPayment() {
		if (bookingStatus.getBookingStatusId() == Constants.BookingStatus.CONFIRMED_AND_UNPAID_DEPOSIT
				|| bookingStatus.getBookingStatusId() == Constants.BookingStatus.WAIT_FOR_CONFIRM_AND_UNPAID_DEPOSIT) {
			return true;
		}
		return false;
	}
	
	/**
	 * Đơn đặt bàn có thể huỷ bỏ
	 * @return
	 */
	public boolean canCancel() {
		if(bookingStatus.getBookingStatusId() == Constants.BookingStatus.WAIT_FOR_CONFIRM
			|| bookingStatus.getBookingStatusId() == Constants.BookingStatus.CONFIRMED
			|| bookingStatus.getBookingStatusId() == Constants.BookingStatus.CONFIRMED_AND_UNPAID_DEPOSIT
			|| bookingStatus.getBookingStatusId() == Constants.BookingStatus.WAIT_FOR_CONFIRM_AND_UNPAID_DEPOSIT) {
			return true;
		}
		return false;
	}
}
