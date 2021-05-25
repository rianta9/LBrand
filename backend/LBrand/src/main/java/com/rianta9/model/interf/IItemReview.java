/**
 * 
 */
package com.rianta9.model.interf;

import java.util.Date;

/**
 * @author rianta9
 * @datecreated 22 thg 5, 2021 00:37:06
 */
public interface IItemReview {
	Long getBookingId();
	Long getBrandId();
	String getAvatar();
	String getBrandName();
	Date getDateCreated();
	Date getDateIn();
	String getTotalPrice();
}
