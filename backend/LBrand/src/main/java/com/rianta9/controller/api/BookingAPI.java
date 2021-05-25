/**
 * 
 */
package com.rianta9.controller.api;

import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.rianta9.entity.DiscountCode;
import com.rianta9.entity.Product;
import com.rianta9.form.BookingForm;
import com.rianta9.model.ApplyCartItem;
import com.rianta9.model.ApplyDiscountCode;
import com.rianta9.model.Cart;
import com.rianta9.model.CartItem;
import com.rianta9.repository.BrandRepository;
import com.rianta9.repository.DiscountCodeRepository;
import com.rianta9.repository.ProductRepository;
import com.rianta9.util.MoneyHelper;

/**
 * @author rianta9
 * @datecreated 14 thg 5, 2021 09:18:33
 */
@RestController
public class BookingAPI {
	@Autowired
	private BrandRepository brandRepository;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private DiscountCodeRepository discountCodeRepository;
	
	@GetMapping(value = "/api/v1/cart/{brandId}/add-product/{productId}")
	public ResponseEntity<ApplyCartItem> addProductCart(@PathVariable Long brandId, @PathVariable Long productId, HttpSession session) {
		if (brandId == null || productId == null)
			return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
		
		// Tìm kiếm sản phẩm theo thương hiệu
		Product product = productRepository.findOneByBrandBrandIdAndProductId(brandId, productId);
		if (brandRepository.findByBrandId(brandId) == null || product == null)
			return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST); // ko tìm thấy thương hiệu hoặc sản phẩm

		// Lấy danh sách đặt bàn của các thương hiệu
		HashMap<Long, Cart> listBrandBooking = (HashMap<Long, Cart>) session.getAttribute("myBooking");
		if (listBrandBooking == null) {
			listBrandBooking = new HashMap<>();
		}

		// Lấy dữ liệu đặt bàn của thương hiệu brandId
		Cart brandBooking;
		if (!listBrandBooking.containsKey(brandId)) {
			brandBooking = new Cart();
			listBrandBooking.put(brandId, brandBooking);
		}
		else brandBooking = listBrandBooking.get(brandId);
		
		CartItem cartItem = brandBooking.findCartItem(productId);
		if(cartItem == null) {
			cartItem = new CartItem();
			cartItem.setProduct(product);
			cartItem.setQuantity(1);
			brandBooking.addToCart(cartItem); // cập nhật giỏ hàng
		}
		else cartItem.addQuantity(1); // cập nhật giỏ hàng
		
		
		// lấy data trả về
		ApplyCartItem result = new ApplyCartItem();
		result.setProductId(productId);
		result.setBrandId(brandId);
		result.setProductName(product.getProductName());
		result.setAvatar(product.getAvatar());
		result.setQuantity(cartItem.getQuantity());
		result.setSalePrice(cartItem.getStringSalePrice());
		result.setTotalPriceCartItem(cartItem.getStringTotalPrice());
		result.setTotalPriceCart(brandBooking.getStringTotalPrice());
		
		// Cập nhật booking form
		BookingForm bookingForm = (BookingForm)session.getAttribute("brandBooking");
		if(bookingForm != null) {
			bookingForm.setTotalPriceWithoutDiscount(brandBooking.getTotalPrice());
			result.setTotalPriceBooking(bookingForm.getStringTotalPrice());
			session.setAttribute("brandBooking", bookingForm); // cập nhật bookingform
		}
		
		// cập nhật listBooking trên session
		session.setAttribute("myBooking", listBrandBooking);
		return  new ResponseEntity<>(result, HttpStatus.OK);		
	}
	
	
	@PutMapping(value = "/api/v1/cart/{brandId}/update-product/{productId}")
	public ResponseEntity<ApplyCartItem> updateProductCart(@PathVariable Long brandId, @PathVariable Long productId, @RequestBody CartItem getQuantity, HttpSession session) {
		if (brandId == null || productId == null)
			return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
		if (brandRepository.findByBrandId(brandId) == null)
			return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST); // ko tìm thấy thương hiệu

		HashMap<Long, Cart> listBrandBooking = (HashMap<Long, Cart>) session.getAttribute("myBooking");
		if (listBrandBooking == null) {
			listBrandBooking = new HashMap<>();
			return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
		}

		// Lấy dữ liệu đặt bàn của thương hiệu brandId
		Cart brandBooking;
		if (listBrandBooking.containsKey(brandId)) {
			brandBooking = listBrandBooking.get(brandId);
			CartItem cartItem = brandBooking.findCartItem(productId);
			if(cartItem != null && cartItem.getQuantity() > 0) {
				cartItem.setQuantity(getQuantity.getQuantity());
				session.setAttribute("myBooking", listBrandBooking); // cập nhật listBooking trong session
				
				// Get result data
				ApplyCartItem result = new ApplyCartItem();
				result.setProductId(productId);
				result.setBrandId(brandId);
				result.setProductName(cartItem.getProduct().getProductName());
				result.setAvatar(cartItem.getProduct().getAvatar());
				result.setQuantity(cartItem.getQuantity());
				result.setSalePrice(cartItem.getStringSalePrice());
				result.setTotalPriceCartItem(cartItem.getStringTotalPrice());
				result.setTotalPriceCart(brandBooking.getStringTotalPrice());
				
				// Update totalPriceWithoutDiscount
				BookingForm bookingForm = (BookingForm)session.getAttribute("brandBooking");
				if(bookingForm != null) {
					bookingForm.setTotalPriceWithoutDiscount(brandBooking.getTotalPrice());
					result.setTotalPriceBooking(bookingForm.getStringTotalPrice());
					session.setAttribute("brandBooking", bookingForm); // cập nhật bookingform
				}
				return  new ResponseEntity<>(result, HttpStatus.OK);
			}
		}
		return  new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping(value = "api/v1/checkout/{brandId}/apply-discount-code")
	public ResponseEntity<ApplyDiscountCode> applyDiscountCode(HttpSession session, @RequestBody ApplyDiscountCode apply, @PathVariable Long brandId){
		if (brandId == null)
			return new ResponseEntity<>(apply, HttpStatus.BAD_REQUEST);
		if (brandRepository.findByBrandId(brandId) == null)
			return new ResponseEntity<>(apply, HttpStatus.BAD_REQUEST); // ko tìm thấy thương hiệu

		DiscountCode discountCode = discountCodeRepository.findOneByBrandBrandIdAndCode(brandId, apply.getDiscountCode());
		if(discountCode != null) {
			BookingForm bookingForm = (BookingForm)session.getAttribute("brandBooking");
			if(bookingForm != null) {
				Long totalPriceWithoutDiscount = bookingForm.getTotalPriceWithoutDiscount();
				System.out.println("Total price without discount: " + totalPriceWithoutDiscount);
				System.out.println("Min price to discount: " + discountCode.getMinPrice().longValue());
				if(totalPriceWithoutDiscount >= discountCode.getMinPrice().longValue()) { // hoá đơn nằm trong khoảng giá cho phép
					Date today = new Date();
					if(today.compareTo(discountCode.getDateBegin()) >= 0 && today.compareTo(discountCode.getDateEnd()) <= 0) { // Nằm trong khoảng thời gian cho phép
						Long discount = Math.min(totalPriceWithoutDiscount*discountCode.getPercentDiscount()/100, discountCode.getMaxDiscount().longValue());
						bookingForm.setDiscount(discount); // cập nhật giảm giá
						apply.setDiscount(MoneyHelper.toMoneyType(discount));
						apply.setTotalPrice(bookingForm.getStringTotalPrice());
						session.setAttribute("brandBooking", bookingForm); // lưu vào session
						System.out.println("ApplyDiscountCode:" + apply.toString());
						return new ResponseEntity<ApplyDiscountCode>(apply, HttpStatus.OK);
					}
					else System.out.println("Mã giảm giá đã hết thời hạn sử dụng!");
				}
				else System.out.println("Giá hoá đơn thấp hơn mức giá yêu cầu!");
			}
			else System.out.println("Booking form không tồn tại!");
		}
		else System.out.println("Discount code không tồn tại!");
		
		return new ResponseEntity<>(apply, HttpStatus.BAD_REQUEST);
	}
}
