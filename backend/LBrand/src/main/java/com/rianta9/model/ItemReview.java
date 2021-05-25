/**
 * 
 */
package com.rianta9.model;

import java.util.Date;

import com.rianta9.model.interf.IItemReview;
import com.rianta9.util.DateTimeUtil;

import lombok.Data;

/**
 * @author rianta9
 * @datecreated 22 thg 5, 2021 00:35:29
 */
@Data
public class ItemReview implements IItemReview{
	private Long bookingId;
	private Long brandId;
	private String avatar;
	private String brandName;
	private Date dateCreated;
	private Date dateIn;
	private String totalPrice;
	
	
	public String getStringDateIn() {
		return DateTimeUtil.toStringType(dateIn);
	}
}
