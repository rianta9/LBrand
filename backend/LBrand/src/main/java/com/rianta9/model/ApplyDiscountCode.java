/**
 * 
 */
package com.rianta9.model;

import lombok.Data;
import lombok.Getter;

/**
 * @author rianta9
 * @datecreated 15 thg 5, 2021 15:43:39
 */

@Data
public class ApplyDiscountCode {
	private String discount;
	private String discountCode;
	private String totalPrice;
}
