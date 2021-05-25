/**
 * 
 */
package com.rianta9.form;

import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rianta9.util.Constants;
import com.rianta9.util.DateTimeUtil;
import com.rianta9.util.MoneyHelper;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @author rianta9
 * @datecreated 8 thg 5, 2021 16:37:30
 */

@Getter
@Setter
@Component
@ToString
public class BookingForm {
	@NotNull(message = "Trường này là bắt buộc!")
	@Min(value = 0, message = "Số lượng phải lớn hơn hoặc bằng 0!")
	private Integer numberOfAdult;
	
	@NotNull(message = "Trường này là bắt buộc!")
	@Min(value = 0, message = "Số lượng phải lớn hơn hoặc bằng 0!")
	private Integer numberOfChildren;
	
	@NotNull(message = "Trường này là bắt buộc!")
	@Temporal(TemporalType.DATE)
	@JsonFormat(pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateIn;
	
	@NotNull(message = "Trường này là bắt buộc!")
	private String timeIn;
	
	@NotNull(message = "Trường này là bắt buộc!")
	private Long capacityId;
	private Integer floor;
	
	private Long brandId;
	private String brandName;
	private String avatar; // ảnh đại diện thương hiệu
	
	@Size(max = 250, message = "Chỉ nhập tối đa 250 ký tự!")
	private String note;
	
	private Long accountId;
	
	// Thông tin liên lạc
	private String customer; // họ tên
	private String contactPhone; // số điện thoại liên lạc
	
	private Long discount;
	
	private Long deposit;
	
	private Long totalPriceWithoutDiscount;
		
	private Integer paymentMethodId;
	private String paymentMethodName;
	
	private Integer bookingType;
	
	public String getContactInfo() {
		if(customer == null || contactPhone == null) {
			System.out.println("Lỗi thông tin khách hàng null!");
			return null;
		}
		String result = "Người liên hệ: " + customer;
		result += "; Sđt: " + contactPhone;
		return result;
	}
	
	public BookingForm(){
		discount = 0l;
		deposit = 0l;
		totalPriceWithoutDiscount = 0l;
		bookingType = Constants.BookingType.NORMAL;
		paymentMethodId = Constants.PaymentMethod.NO_DEPOSIT;
		paymentMethodName = Constants.PaymentMethod.S_NO_DEPOSIT;
	}
	
	public void resetPrice() {
		discount = 0l;
		deposit = 0l;
		totalPriceWithoutDiscount = 0l;
		bookingType = Constants.BookingType.NORMAL;
		paymentMethodId = Constants.PaymentMethod.NO_DEPOSIT;
		paymentMethodName = Constants.PaymentMethod.S_NO_DEPOSIT;
	}
	
	public String getStringDateIn() {
		return DateTimeUtil.toStringType(dateIn);
	}
	
	public String getStringDiscount() {
		if(discount == null) discount = 0l;
		return MoneyHelper.toMoneyType(discount);
	}
	
	public String getStringDeposit() {
		if(deposit == null) deposit = 0l;
		return MoneyHelper.toMoneyType(deposit);
	}
	
	public String getStringTotalPriceWithoutDisccount() {
		return MoneyHelper.toMoneyType(totalPriceWithoutDiscount);
	}
	
	public String getStringTotalPrice() {
		if((bookingType == Constants.BookingType.NORMAL || bookingType == Constants.BookingType.BOOKING_SERVICE) && totalPriceWithoutDiscount == 0l) {
			return "Chưa tính";
		}
		return MoneyHelper.toMoneyType(totalPriceWithoutDiscount-discount);
	}
}
