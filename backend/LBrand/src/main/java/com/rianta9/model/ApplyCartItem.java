/**
 * 
 */
package com.rianta9.model;

import lombok.Data;

/**
 * @author rianta9
 * @datecreated 16 thg 5, 2021 08:39:05
 */
@Data
public class ApplyCartItem {
	Long productId;
	Long brandId;
	String productName;
	String avatar;
	Integer quantity;
	String salePrice; // product.salePrice
	String totalPriceCartItem; // saleprice*quantity
	String totalPriceCart; // sum(list<CartItem>.totalPrice)
	String totalPriceBooking; // booking price...get data from session
}
