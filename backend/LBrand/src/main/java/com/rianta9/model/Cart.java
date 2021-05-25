/**
 * 
 */
package com.rianta9.model;

import java.util.ArrayList;
import java.util.List;

import com.rianta9.entity.Booking;
import com.rianta9.entity.BookingProductDetail;
import com.rianta9.entity.BookingServiceDetail;
import com.rianta9.entity.Brand;
import com.rianta9.util.MoneyHelper;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @author rianta9
 * @datecreated 8 thg 5, 2021 16:15:54
 */

@Getter
@Setter
@ToString
public class Cart {
	private List<CartItem> listItem;
	
	public Cart() {
		listItem = new ArrayList<CartItem>();
	}
	
	public Cart(List<CartItem> listItem) {
		this.listItem = listItem;
	}
	
	public int getTotalItems() {
		if(listItem == null) return 0;
		return listItem.size();
	}
	
	public Long getTotalPrice() {
		Long result = 0l;
		if(listItem != null) {
			for (CartItem item : listItem) {
				result += item.getTotalPrice();
			}
		}
		return result;
	}
	
	public String getStringTotalPrice() {
		return MoneyHelper.toMoneyType(getTotalPrice());
	}
	
	public CartItem findCartItem(Long productId) {
		if(listItem == null) return null;
		for (CartItem item : listItem) {
			if(item.equals(productId)) return item;
		}
		return null;
	}
	
	/**
	 * Nếu giỏ hàng đã có sản phẩm productId, cập nhật số lượng(cộng thêm). Nếu ko, thêm sản phẩm vào giỏ
	 * @param item
	 * @return
	 */
	public boolean addToCart(CartItem item) {
		if(item == null || item.getProduct() == null) return false;
		CartItem oldItem = findCartItem(item.getProduct().getProductId());
		if(oldItem == null) listItem.add(item);
		else oldItem.addQuantity(item.getQuantity());
		return true;
	}
	
	public boolean removeItem(Long productId) {		
		CartItem item = findCartItem(productId);
		if(item != null) return listItem.remove(item);
		return false;
	}
}
