/**
 * 
 */
package com.rianta9.model;

import com.rianta9.entity.Product;
import com.rianta9.util.MoneyHelper;

import lombok.Data;

/**
 * @author rianta9
 * @datecreated 13 thg 5, 2021 23:40:05
 */

@Data
public class CartItem {
	private Product product;
	private int quantity;
	
	public CartItem() {
		quantity = 0;
	}
	
	public CartItem(Product product, int quantity) {
		this.product = product;
		this.quantity = quantity;
	}
	
	public Long getTotalPrice() {
		if(product == null) return 0l;
		return product.getSalePrice().longValue()*quantity;
	}
	
	
	public String getStringTotalPrice() {
		return MoneyHelper.toMoneyType(getTotalPrice());
	}
	
	public String getStringSalePrice() {
		return MoneyHelper.toMoneyType(product.getSalePrice());
	}
	
	public boolean equals(Long productId) {
		if(product != null) {
			if(product.getProductId() == productId) return true; 
		}
		return false;
	}
	
	public void addQuantity(int sl) {
		if(sl < 1) return;
		this.quantity += sl;
	}
}
