/**
 * 
 */
package com.rianta9.controller.web;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.rianta9.config.ConfigVNPay;
import com.rianta9.converter.BookingConverter;
import com.rianta9.entity.Account;
import com.rianta9.entity.Booking;
import com.rianta9.entity.BookingProductDetail;
import com.rianta9.entity.BookingServiceDetail;
import com.rianta9.entity.Brand;
import com.rianta9.entity.PaymentMethod;
import com.rianta9.entity.Product;
import com.rianta9.entity.Service;
import com.rianta9.form.BookingForm;
import com.rianta9.form.CheckoutForm;
import com.rianta9.model.Cart;
import com.rianta9.model.CartItem;
import com.rianta9.model.interf.IBrandCapacityStatistic;
import com.rianta9.repository.AccountRepository;
import com.rianta9.repository.BookingProductDetailRepository;
import com.rianta9.repository.BookingRepository;
import com.rianta9.repository.BookingServiceDetailRepository;
import com.rianta9.repository.BrandCapacityRepository;
import com.rianta9.repository.BrandRepository;
import com.rianta9.repository.PaymentMethodRepository;
import com.rianta9.repository.ProductRepository;
import com.rianta9.repository.ServiceRepository;
import com.rianta9.util.Constants;
import com.rianta9.util.DateTimeUtil;
import com.rianta9.util.MoneyHelper;
import com.rianta9.util.RandomUUID;

/**
 * @author rianta9
 * @datecreated 8 thg 5, 2021 16:22:45
 */

@Controller
public class BookingController {
	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private BookingRepository bookingRepository;

	@Autowired
	private BrandRepository brandRepository;

	@Autowired
	private BookingServiceDetailRepository bookingServiceDetailRepository;

	@Autowired
	private BookingProductDetailRepository bookingProductDetailRepository;

	@Autowired
	private BrandCapacityRepository brandCapacityRepository;

	@Autowired
	private PaymentMethodRepository paymentMethodRepository;

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private ServiceRepository serviceRepository;

	@Autowired
	private BookingConverter bookingConverter;

	@RequestMapping(value = "/booking/{brandId}/add-product/{productId}")
	public String addProductToBooking(@PathVariable Long brandId, @PathVariable Long productId,
			@RequestParam(required = false) Integer quantity, RedirectAttributes redirectAttributes,
			HttpSession session) {
		if (brandId == null || productId == null)
			return "error/404";
		if (brandRepository.findByBrandId(brandId) == null)
			return "error/404"; // ko tìm thấy thương hiệu

		HashMap<Long, Cart> listProductBooking = (HashMap<Long, Cart>) session.getAttribute("myBooking");
		if (listProductBooking == null) {
			listProductBooking = new HashMap<>();
		}

		// Lấy dữ liệu đặt bàn của thương hiệu brandId
		Cart brandBooking;
		if (listProductBooking.containsKey(brandId)) {
			brandBooking = listProductBooking.get(brandId);
		} else { // tạo mới nếu ko tìm thấy
			brandBooking = new Cart();
			listProductBooking.put(brandId, brandBooking);
		}

		/* Thêm sản phẩm vào giỏ hàng */
		// Kiểm tra có tìm thấy productId của thương hiệu brandId ko
		Product product = productRepository.findOneByBrandBrandIdAndProductId(brandId, productId);
		if (product == null) {
			redirectAttributes.addFlashAttribute("notification", "Không tìm thấy sản phẩm!");
			return "redirect:/brand/" + redirectAttributes;
		}
		if (quantity == null)
			quantity = 1;
		if (quantity < 1)
			quantity = 0;

		// Kiểm tra có tìm thấy product ở trong listCartItem hay không
		CartItem cartItem = brandBooking.findCartItem(productId);
		if (cartItem == null) {// ko có thì tạo mới
			cartItem = new CartItem(product, quantity);
			brandBooking.addToCart(cartItem);
		} // có thì update số lượng
		else
			cartItem.setQuantity(cartItem.getQuantity() + quantity);
		System.out.println("Cart Item" + cartItem.toString());
		session.setAttribute("myBooking", listProductBooking);
		redirectAttributes.addFlashAttribute("notification", "Thêm sản phẩm thành công!");
		return "redirect:/brand/" + brandId;
	}

	@RequestMapping(value = "/booking/{brandId}/remove/{productId}")
	public String removeProductBooking(@PathVariable Long brandId, @PathVariable Long productId,
			RedirectAttributes redirectAttributes, HttpSession session) {
		HashMap<Long, Cart> listProductBooking = (HashMap<Long, Cart>) session.getAttribute("myBooking");
		if (listProductBooking == null) {
			listProductBooking = new HashMap<>();
		}

		// Lấy dữ liệu đặt bàn của thương hiệu brandId
		Cart brandBooking;
		if (listProductBooking.containsKey(brandId)) {
			brandBooking = listProductBooking.get(brandId);
			boolean rs = brandBooking.removeItem(productId);
			if (rs)
				redirectAttributes.addFlashAttribute("notification", "Xoá sản phẩm thành công!");
			else
				redirectAttributes.addFlashAttribute("notification", "Xoá sản phẩm thất bại!");
		}

		session.setAttribute("myBooking", listProductBooking);
		redirectAttributes.addFlashAttribute("notification", "Xoá sản phẩm thành công!");
		return "redirect:/brand/" + brandId;
	}

	@GetMapping(value = "/checkout/brand/{brandId}")
	public String viewCheckout(Model model, @PathVariable Long brandId, HttpSession session,
			RedirectAttributes redirectAttributes) {
		if (brandId == null || brandRepository.findByBrandId(brandId) == null)
			return "error/404";

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username == null)
			return "redirect:/login";

		Account account = accountRepository.findByUsername(username);
		if (account == null)
			return "redirect:/login";

		CheckoutForm checkoutForm = new CheckoutForm();

		// Lấy thông tin đặt bàn
		HashMap<Long, Cart> listProductBooking = (HashMap<Long, Cart>) session.getAttribute("myBooking");

		if (listProductBooking == null) {
			listProductBooking = new HashMap<>();
		}

		BookingForm bookingForm = (BookingForm) session.getAttribute("brandBooking");
		if (bookingForm == null)
			return "redirect:/brand/" + brandId;
		if (bookingForm.getBrandId() == null || !bookingForm.getBrandId().equals(brandId)) {
			return "redirect:/brand/" + brandId;
		}

		checkoutForm.setCustomer(bookingForm.getCustomer());
		checkoutForm.setContactPhone(bookingForm.getContactPhone());
		checkoutForm.setNote(bookingForm.getNote());
		checkoutForm.setPaymentMethodId(bookingForm.getPaymentMethodId());

		// Tính toán lại dữ liệu(tổng tiền, tiền đặt cọc, phương thức thanh toán)
		bookingForm.resetPrice(); // reset dữ liệu(giảm giá, tổng tiền, tiền đặt cọc, phương thức thanh toán)
		// Lấy số tiền đặt cọc
		long numberOfPeople = bookingForm.getNumberOfChildren() + bookingForm.getNumberOfAdult();
		if (numberOfPeople >= 10) {
			bookingForm.setDeposit(numberOfPeople * 20000);
			bookingForm.setPaymentMethodId(Constants.PaymentMethod.CONFIRM_BEFORE_DEPOSIT);
			bookingForm.setPaymentMethodName(Constants.PaymentMethod.S_CONFIRM_BEFORE_DEPOSIT);
		}

		// Lấy thông tin các sản phẩm đã chọn
		Cart brandBooking;
		if (listProductBooking.containsKey(brandId)) {
			brandBooking = listProductBooking.get(brandId);
			List<CartItem> listCartItem = brandBooking.getListItem();
			if (listCartItem != null) { // chuyển danh sách lên trang view
				bookingForm.setDeposit(Math.max(bookingForm.getDeposit(), brandBooking.getTotalPrice() * 50 / 100));
				bookingForm.setTotalPriceWithoutDiscount(brandBooking.getTotalPrice());
				bookingForm.setPaymentMethodId(Constants.PaymentMethod.CONFIRM_BEFORE_DEPOSIT);
				bookingForm.setPaymentMethodName(Constants.PaymentMethod.S_CONFIRM_BEFORE_DEPOSIT);
				bookingForm.setBookingType(Constants.BookingType.BOOKING_ORDER);
				model.addAttribute("listBookingProductDetail", listCartItem);
			}
		}

		// Lấy phương thức thanh toán để hiển thị lên trang view
		List<PaymentMethod> listPaymentMethod = new ArrayList<PaymentMethod>();
		if (bookingForm.getDeposit() == 0) {
			listPaymentMethod.add(paymentMethodRepository.getOne(Constants.PaymentMethod.NO_DEPOSIT));
		} else {
			listPaymentMethod.add(paymentMethodRepository.getOne(Constants.PaymentMethod.CONFIRM_BEFORE_DEPOSIT));
			listPaymentMethod.add(paymentMethodRepository.getOne(Constants.PaymentMethod.DEPOSIT_NOW));
		}

		if (model.getAttribute("checkoutForm") == null)
			model.addAttribute("checkoutForm", checkoutForm);
		model.addAttribute("bookingForm", bookingForm);
		model.addAttribute("listPaymentMethods", listPaymentMethod);

		return "web/view-checkout";
	}

	@GetMapping(value = "/checkout/brand/{brandId}/service/{serviceId}")
	public String viewCheckoutService(Model model, @PathVariable Long brandId, @PathVariable Long serviceId,
			HttpSession session, RedirectAttributes redirectAttributes) {
		if (brandId == null || brandRepository.findByBrandId(brandId) == null || serviceId == null
				|| serviceRepository.findByServiceId(serviceId) == null)
			return "error/404";

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();

		// Lấy username ra
		if (username == null)
			return "redirect:/login";
		Account account = accountRepository.findByUsername(username);
		if (account == null)
			return "redirect:/login";

		CheckoutForm checkoutForm = new CheckoutForm();

		// Lấy thông tin đặt bàn
		BookingForm bookingForm = (BookingForm) session.getAttribute("brandBooking");
		if (bookingForm == null)
			return "redirect:/service/" + serviceId;
		if (bookingForm.getBrandId() == null || !bookingForm.getBrandId().equals(brandId)) {
			// booking form hiện tại ko phải là của thương hiệu brand
			return "redirect:/service/" + serviceId;
		}

		checkoutForm.setCustomer(bookingForm.getCustomer());
		checkoutForm.setContactPhone(bookingForm.getContactPhone());
		checkoutForm.setNote(bookingForm.getNote());
		checkoutForm.setPaymentMethodId(bookingForm.getPaymentMethodId());

		// Lấy thông tin dịch vụ đã chọn
		HashMap<Long, Service> listServiceBooking = (HashMap<Long, Service>) session.getAttribute("myServiceBooking");
		if (listServiceBooking == null) {
			listServiceBooking = new HashMap<>();
			return "redirect:/service/" + serviceId;
		}
		Service serviceBooking;
		if (listServiceBooking.containsKey(brandId)) {
			serviceBooking = listServiceBooking.get(brandId);
			model.addAttribute("bookingServiceDetail", serviceBooking); // chuyển lên view để binding
		} else
			return "redirect:/service/" + serviceId;

		// Tính toán lại dữ liệu(tổng tiền, tiền đặt cọc, phương thức thanh toán)
		bookingForm.resetPrice(); // reset dữ liệu(giảm giá, tổng tiền, tiền đặt cọc, phương thức thanh toán)
		bookingForm.setTotalPriceWithoutDiscount(
				serviceBooking.getSalePriceForAdult().longValue() * bookingForm.getNumberOfAdult()
						+ serviceBooking.getSalePriceForChildren().longValue() * bookingForm.getNumberOfChildren());
		// Lấy số tiền đặt cọc
		long numberOfPeople = bookingForm.getNumberOfChildren() + bookingForm.getNumberOfAdult();
		if (numberOfPeople >= 10) {
			bookingForm.setDeposit(numberOfPeople * 20000);
			bookingForm.setPaymentMethodId(Constants.PaymentMethod.CONFIRM_BEFORE_DEPOSIT);
			bookingForm.setPaymentMethodName(Constants.PaymentMethod.S_CONFIRM_BEFORE_DEPOSIT);
		}
		bookingForm.setBookingType(Constants.BookingType.BOOKING_SERVICE);

		model.addAttribute("bookingForm", bookingForm); // lấy dữ liệu để hiển thị lên view

		// Lấy phương thức thanh toán phù hợp với đơn đặt bàn của người dùng
		List<PaymentMethod> listPaymentMethod = new ArrayList<PaymentMethod>();
		if (bookingForm.getDeposit() == 0) {
			listPaymentMethod.add(paymentMethodRepository.getOne(Constants.PaymentMethod.NO_DEPOSIT));
		} else {
			listPaymentMethod.add(paymentMethodRepository.getOne(Constants.PaymentMethod.CONFIRM_BEFORE_DEPOSIT));
			listPaymentMethod.add(paymentMethodRepository.getOne(Constants.PaymentMethod.DEPOSIT_NOW));
		}

		model.addAttribute("listPaymentMethods", listPaymentMethod);
		if (model.getAttribute("checkoutForm") == null)
			model.addAttribute("checkoutForm", checkoutForm);

		return "web/view-checkout";
	}

	@PostMapping(value = "/checkout/brand/{brandId}/payment")
	public String doPayment(@Valid @ModelAttribute CheckoutForm checkoutForm, BindingResult result,
			@PathVariable Long brandId, Model model, HttpSession session, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		if (brandId == null || brandRepository.findByBrandId(brandId) == null)
			return "error/404";

		// Lấy thông tin đặt bàn
		BookingForm bookingForm = (BookingForm) session.getAttribute("brandBooking");
		if (bookingForm == null)
			return "redirect:/brand/" + brandId;
		if (bookingForm.getBrandId() == null || !bookingForm.getBrandId().equals(brandId)) {
			// booking form hiện tại ko phải là của thương hiệu brand
			return "redirect:/brand/" + brandId;
		}

		// doPayment yêu cầu phải được chuyển hướng từ link /checkout/brand/...
		String referer = request.getHeader("Referer");
		if (referer == null || !referer.contains("/checkout/brand/") || !referer.contains(brandId.toString()))
			return "error/405";

		// chuyển hướng từ yêu cầu đặt bàn dịch vụ
		Service serviceBooking = null;
		List<CartItem> listCartItem = null;
		HashMap<Long, Cart> listProductBooking = null;
		HashMap<Long, Service> listServiceBooking = null;

		if (referer.contains("/service/")) {
			listServiceBooking = (HashMap<Long, Service>) session.getAttribute("myServiceBooking");
			if (listServiceBooking == null) {
				return "redirect:/brand/" + brandId;
			}

			if (listServiceBooking.containsKey(brandId)) {
				serviceBooking = listServiceBooking.get(brandId);
			} else
				return "redirect:/brand/" + brandId;
		} else { // chuyển hướng từ yêu cầu đặt bàn thông thường hoặc đặt bàn gọi món
					// Lấy thông tin đặt bàn
			listProductBooking = (HashMap<Long, Cart>) session.getAttribute("myBooking");

			if (listProductBooking == null) {
				return "redirect:/brand/" + brandId;
			}
			Cart brandBooking;
			if (listProductBooking.containsKey(brandId)) {
				brandBooking = listProductBooking.get(brandId);
				listCartItem = brandBooking.getListItem();

			}
		}

		if (result.hasErrors()) {
			model.addAttribute("bookingForm", bookingForm);
			model.addAttribute("checkoutForm", checkoutForm);
			if (listCartItem != null) { // chuyển danh sách lên trang view
				model.addAttribute("listBookingProductDetail", listCartItem);
			}
			if (serviceBooking != null) {
				model.addAttribute("bookingServiceDetail", serviceBooking);
			}
			return "web/view-checkout";
		}

		if (checkoutForm.getPaymentMethodId() == Constants.PaymentMethod.DEPOSIT_NOW)
			bookingForm.setPaymentMethodId(Constants.PaymentMethod.DEPOSIT_NOW);

		/* Lưu booking vào csdl */
		Booking booking = bookingConverter.toEntity(bookingForm);
		booking = bookingRepository.saveAndFlush(booking);
		if (booking == null) {
			model.addAttribute("notification", "Đặt bàn không thành công!");
			model.addAttribute("bookingForm", bookingForm);
			model.addAttribute("checkoutForm", checkoutForm);
			if (listCartItem != null) { // chuyển danh sách lên trang view
				model.addAttribute("listBookingProductDetail", listCartItem);
			}
			if (serviceBooking != null) {
				model.addAttribute("bookingServiceDetail", serviceBooking);
			}
			return "web/view-checkout";
		}

		// Lưu booking service detail vào csdl
		if (bookingForm.getBookingType() == Constants.BookingType.BOOKING_SERVICE && serviceBooking != null) {
			BookingServiceDetail bookingServiceDetail = new BookingServiceDetail();
			bookingServiceDetail.setBooking(booking);
			bookingServiceDetail.setService(serviceBooking);
			bookingServiceDetail.setSalePriceForAdult(serviceBooking.getSalePriceForAdult());
			bookingServiceDetail.setSalePriceForChildren(serviceBooking.getSalePriceForChildren());
			bookingServiceDetailRepository.saveAndFlush(bookingServiceDetail);
		}

		// Lưu danh sách booking product detail vào csdl
		if (bookingForm.getBookingType() == Constants.BookingType.BOOKING_ORDER && listCartItem != null) {
			for (CartItem cartItem : listCartItem) {
				BookingProductDetail bookingProductDetail = new BookingProductDetail();
				bookingProductDetail.setBooking(booking);
				bookingProductDetail.setProduct(cartItem.getProduct());
				bookingProductDetail.setSalePrice(cartItem.getProduct().getSalePrice());
				bookingProductDetail.setQuantity(cartItem.getQuantity());
				bookingProductDetailRepository.saveAndFlush(bookingProductDetail);
			}
		}

		// Cập nhật lại session
		if (listProductBooking != null)
			listProductBooking.remove(brandId);
		if (listServiceBooking != null)
			listServiceBooking.remove(brandId);
		session.setAttribute("myBooking", listProductBooking);
		session.setAttribute("myServiceBooking", listServiceBooking);
		session.removeAttribute("brandBooking");

		if (bookingForm.getPaymentMethodId() == Constants.PaymentMethod.DEPOSIT_NOW) {
			try {
				String urlPayment = vnpay_ajax(request, booking.getBookingId());
				if (urlPayment != null) {
					return "redirect:" + urlPayment;
				}
			} catch (UnsupportedEncodingException e) {
				System.out.println("Khong the thanh toan truc tiep vao hien tai!");
			}
			return "redirect:/my-account/booking-detail/" + booking.getBookingId();
		}
			
		return "redirect:/my-account/booking-detail/" + booking.getBookingId();
	}
	
	public String vnpay_ajax(HttpServletRequest request, Long bookingId)
			throws UnsupportedEncodingException {
		
		if(bookingId == null) return null;
		Booking booking = bookingRepository.findByBookingId(bookingId);
		if(booking == null) return null;
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		if(username == null) return null;

		Account account = accountRepository.findByUsername(username);
		if(account == null) return null;
		
		// Xác nhận người sở hữu đơn đặt bàn
		if(booking.getAccount().getAccountId() != account.getAccountId()) {
			return null;
		}
		
		// Xác nhận đơn đặt bàn này cần phải thanh toán đặt cọc
		if(booking.getBookingStatus().getBookingStatusId() != Constants.BookingStatus.CONFIRMED_AND_UNPAID_DEPOSIT 
			&& booking.getBookingStatus().getBookingStatusId() != Constants.BookingStatus.WAIT_FOR_CONFIRM_AND_UNPAID_DEPOSIT ) {
			return null;
		}
		
		
		
		String vnp_Version = "2.0.0";
		String vnp_Command = "pay";
		String vnp_OrderInfo = "Thanh toan tien dat coc cho don dat ban: #" + booking.getBookingId() + ", thoi diem: " + DateTimeUtil.toStringDateTimeType(new Date());
		String orderType = "billpayment";
//		String vnp_TxnRef = ConfigVNPay.getRandomNumber(8);
		String vnp_TxnRef = booking.getBookingId().toString();
		String vnp_IpAddr = ConfigVNPay.getIpAddress(request);
		String vnp_TmnCode = ConfigVNPay.vnp_TmnCode;

		String vnp_TransactionNo = RandomUUID.getRandomID();
		String vnp_hashSecret = ConfigVNPay.vnp_HashSecret;

		long amount = booking.getDeposit().longValue() * 100; // nhan 100 de bo phan thap phan(VNPay noi vay)
		Map<String, String> vnp_Params = new HashMap<>();
		vnp_Params.put("vnp_Version", vnp_Version);
		vnp_Params.put("vnp_Command", vnp_Command);
		vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
		vnp_Params.put("vnp_Amount", String.valueOf(amount));
		vnp_Params.put("vnp_CurrCode", "VND");
		
//		String bank_code = null; // de nguoi dung chon tren VNPay luon
//		if (bank_code != null && !bank_code.isEmpty()) {
//			vnp_Params.put("vnp_BankCode", bank_code);
//		}
		
		vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
		vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
		vnp_Params.put("vnp_OrderType", orderType);

		String locate = "vn";
		vnp_Params.put("vnp_Locale", locate);
		
		vnp_Params.put("vnp_ReturnUrl", ConfigVNPay.vnp_Returnurl);
		vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

		Date dt = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = formatter.format(dt);
		String vnp_CreateDate = dateString;
		String vnp_TransDate = vnp_CreateDate;
		vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

		// Build data to hash and querystring
		List fieldNames = new ArrayList(vnp_Params.keySet());
		Collections.sort(fieldNames);
		StringBuilder hashData = new StringBuilder();
		StringBuilder query = new StringBuilder();
		Iterator itr = fieldNames.iterator();
		while (itr.hasNext()) {
			String fieldName = (String) itr.next();
			String fieldValue = (String) vnp_Params.get(fieldName);
			if ((fieldValue != null) && (fieldValue.length() > 0)) {
				// Build hash data
				hashData.append(fieldName);
				hashData.append('=');
				hashData.append(fieldValue);
				// Build query
				query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
				query.append('=');
				query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

				if (itr.hasNext()) {
					query.append('&');
					hashData.append('&');
				}
			}
		}
		String queryUrl = query.toString();
		String vnp_SecureHash = ConfigVNPay.Sha256(ConfigVNPay.vnp_HashSecret + hashData.toString());
		// System.out.println("HashData=" + hashData.toString());
		queryUrl += "&vnp_SecureHashType=SHA256&vnp_SecureHash=" + vnp_SecureHash;
		String paymentUrl = ConfigVNPay.vnp_PayUrl + "?" + queryUrl;
		com.google.gson.JsonObject job = new JsonObject();
		job.addProperty("code", "00");
		job.addProperty("message", "success");
		job.addProperty("data", paymentUrl);
		Gson gson = new Gson();
		return paymentUrl;
	}
}
