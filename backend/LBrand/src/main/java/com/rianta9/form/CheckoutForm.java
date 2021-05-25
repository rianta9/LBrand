/**
 * 
 */
package com.rianta9.form;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;

/**
 * @author rianta9
 * @datecreated 17 thg 5, 2021 09:47:12
 */
@Data
public class CheckoutForm {
	@NotNull(message = "Trường này là bắt buộc!")
	@Size(max = 50, message = "Chỉ nhập tối đa 50 ký tự!")
	private String customer;
	
	@NotNull(message = "Trường này là bắt buộc!")
	@Size(max = 11, message = "Số điện thoại không được quá 11 ký tự!")
	@Size(min = 10, message = "Số điện thoại không được ít hơn 10 ký tự!")
	private String contactPhone;
	
	private String note;
	
	@NotNull(message = "Trường này là bắt buộc!")
	private Integer paymentMethodId;
}
