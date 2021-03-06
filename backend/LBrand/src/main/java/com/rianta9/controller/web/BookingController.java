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
			return "error/404"; // ko t??m th???y th????ng hi???u

		HashMap<Long, Cart> listProductBooking = (HashMap<Long, Cart>) session.getAttribute("myBooking");
		if (listProductBooking == null) {
			listProductBooking = new HashMap<>();
		}

		// L???y d??? li???u ?????t b??n c???a th????ng hi???u brandId
		Cart brandBooking;
		if (listProductBooking.containsKey(brandId)) {
			brandBooking = listProductBooking.get(brandId);
		} else { // t???o m???i n???u ko t??m th???y
			brandBooking = new Cart();
			listProductBooking.put(brandId, brandBooking);
		}

		/* Th??m s???n ph???m v??o gi??? h??ng */
		// Ki???m tra c?? t??m th???y productId c???a th????ng hi???u brandId ko
		Product product = productRepository.findOneByBrandBrandIdAndProductId(brandId, productId);
		if (product == null) {
			redirectAttributes.addFlashAttribute("notification", "Kh??ng t??m th???y s???n ph???m!");
			return "redirect:/brand/" + redirectAttributes;
		}
		if (quantity == null)
			quantity = 1;
		if (quantity < 1)
			quantity = 0;

		// Ki???m tra c?? t??m th???y product ??? trong listCartItem hay kh??ng
		CartItem cartItem = brandBooking.findCartItem(productId);
		if (cartItem == null) {// ko c?? th?? t???o m???i
			cartItem = new CartItem(product, quantity);
			brandBooking.addToCart(cartItem);
		} // c?? th?? update s??? l?????ng
		else
			cartItem.setQuantity(cartItem.getQuantity() + quantity);
		System.out.println("Cart Item" + cartItem.toString());
		session.setAttribute("myBooking", listProductBooking);
		redirectAttributes.addFlashAttribute("notification", "Th??m s???n ph???m th??nh c??ng!");
		return "redirect:/brand/" + brandId;
	}

	@RequestMapping(value = "/booking/{brandId}/remove/{productId}")
	public String removeProductBooking(@PathVariable Long brandId, @PathVariable Long productId,
			RedirectAttributes redirectAttributes, HttpSession session) {
		HashMap<Long, Cart> listProductBooking = (HashMap<Long, Cart>) session.getAttribute("myBooking");
		if (listProductBooking == null) {
			listProductBooking = new HashMap<>();
		}

		// L???y d??? li???u ?????t b??n c???a th????ng hi???u brandId
		Cart brandBooking;
		if (listProductBooking.containsKey(brandId)) {
			brandBooking = listProductBooking.get(brandId);
			boolean rs = brandBooking.removeItem(productId);
			if (rs)
				redirectAttributes.addFlashAttribute("notification", "Xo?? s???n ph???m th??nh c??ng!");
			else
				redirectAttributes.addFlashAttribute("notification", "Xo?? s???n ph???m th???t b???i!");
		}

		session.setAttribute("myBooking", listProductBooking);
		redirectAttributes.addFlashAttribute("notification", "Xo?? s???n ph???m th??nh c??ng!");
		return "redirect:/brand/" + brandId;
	}

	@GetMapping(value = "/checkout/brand/{brandId}")
	public String viewCheckout(Model model, @PathVariable Long brandId, HttpSession session,
			RedirectAttributes redirectAttributes) {
		if (brandId == null || brandRepository.findByBrandId(brandId) == null)
			return "error/404";

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// L???y username ra
		if (username == null)
			return "redirect:/login";

		Account account = accountRepository.findByUsername(username);
		if (account == null)
			return "redirect:/login";

		CheckoutForm checkoutForm = new CheckoutForm();

		// L???y th??ng tin ?????t b??n
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

		// T??nh to??n l???i d??? li???u(t???ng ti???n, ti???n ?????t c???c, ph????ng th???c thanh to??n)
		bookingForm.resetPrice(); // reset d??? li???u(gi???m gi??, t???ng ti???n, ti???n ?????t c???c, ph????ng th???c thanh to??n)
		// L???y s??? ti???n ?????t c???c
		long numberOfPeople = bookingForm.getNumberOfChildren() + bookingForm.getNumberOfAdult();
		if (numberOfPeople >= 10) {
			bookingForm.setDeposit(numberOfPeople * 20000);
			bookingForm.setPaymentMethodId(Constants.PaymentMethod.CONFIRM_BEFORE_DEPOSIT);
			bookingForm.setPaymentMethodName(Constants.PaymentMethod.S_CONFIRM_BEFORE_DEPOSIT);
		}

		// L???y th??ng tin c??c s???n ph???m ???? ch???n
		Cart brandBooking;
		if (listProductBooking.containsKey(brandId)) {
			brandBooking = listProductBooking.get(brandId);
			List<CartItem> listCartItem = brandBooking.getListItem();
			if (listCartItem != null) { // chuy???n danh s??ch l??n trang view
				bookingForm.setDeposit(Math.max(bookingForm.getDeposit(), brandBooking.getTotalPrice() * 50 / 100));
				bookingForm.setTotalPriceWithoutDiscount(brandBooking.getTotalPrice());
				bookingForm.setPaymentMethodId(Constants.PaymentMethod.CONFIRM_BEFORE_DEPOSIT);
				bookingForm.setPaymentMethodName(Constants.PaymentMethod.S_CONFIRM_BEFORE_DEPOSIT);
				bookingForm.setBookingType(Constants.BookingType.BOOKING_ORDER);
				model.addAttribute("listBookingProductDetail", listCartItem);
			}
		}

		// L???y ph????ng th???c thanh to??n ????? hi???n th??? l??n trang view
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

		// L???y username ra
		if (username == null)
			return "redirect:/login";
		Account account = accountRepository.findByUsername(username);
		if (account == null)
			return "redirect:/login";

		CheckoutForm checkoutForm = new CheckoutForm();

		// L???y th??ng tin ?????t b??n
		BookingForm bookingForm = (BookingForm) session.getAttribute("brandBooking");
		if (bookingForm == null)
			return "redirect:/service/" + serviceId;
		if (bookingForm.getBrandId() == null || !bookingForm.getBrandId().equals(brandId)) {
			// booking form hi???n t???i ko ph???i l?? c???a th????ng hi???u brand
			return "redirect:/service/" + serviceId;
		}

		checkoutForm.setCustomer(bookingForm.getCustomer());
		checkoutForm.setContactPhone(bookingForm.getContactPhone());
		checkoutForm.setNote(bookingForm.getNote());
		checkoutForm.setPaymentMethodId(bookingForm.getPaymentMethodId());

		// L???y th??ng tin d???ch v??? ???? ch???n
		HashMap<Long, Service> listServiceBooking = (HashMap<Long, Service>) session.getAttribute("myServiceBooking");
		if (listServiceBooking == null) {
			listServiceBooking = new HashMap<>();
			return "redirect:/service/" + serviceId;
		}
		Service serviceBooking;
		if (listServiceBooking.containsKey(brandId)) {
			serviceBooking = listServiceBooking.get(brandId);
			model.addAttribute("bookingServiceDetail", serviceBooking); // chuy???n l??n view ????? binding
		} else
			return "redirect:/service/" + serviceId;

		// T??nh to??n l???i d??? li???u(t???ng ti???n, ti???n ?????t c???c, ph????ng th???c thanh to??n)
		bookingForm.resetPrice(); // reset d??? li???u(gi???m gi??, t???ng ti???n, ti???n ?????t c???c, ph????ng th???c thanh to??n)
		bookingForm.setTotalPriceWithoutDiscount(
				serviceBooking.getSalePriceForAdult().longValue() * bookingForm.getNumberOfAdult()
						+ serviceBooking.getSalePriceForChildren().longValue() * bookingForm.getNumberOfChildren());
		// L???y s??? ti???n ?????t c???c
		long numberOfPeople = bookingForm.getNumberOfChildren() + bookingForm.getNumberOfAdult();
		if (numberOfPeople >= 10) {
			bookingForm.setDeposit(numberOfPeople * 20000);
			bookingForm.setPaymentMethodId(Constants.PaymentMethod.CONFIRM_BEFORE_DEPOSIT);
			bookingForm.setPaymentMethodName(Constants.PaymentMethod.S_CONFIRM_BEFORE_DEPOSIT);
		}
		bookingForm.setBookingType(Constants.BookingType.BOOKING_SERVICE);

		model.addAttribute("bookingForm", bookingForm); // l???y d??? li???u ????? hi???n th??? l??n view

		// L???y ph????ng th???c thanh to??n ph?? h???p v???i ????n ?????t b??n c???a ng?????i d??ng
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

		// L???y th??ng tin ?????t b??n
		BookingForm bookingForm = (BookingForm) session.getAttribute("brandBooking");
		if (bookingForm == null)
			return "redirect:/brand/" + brandId;
		if (bookingForm.getBrandId() == null || !bookingForm.getBrandId().equals(brandId)) {
			// booking form hi???n t???i ko ph???i l?? c???a th????ng hi???u brand
			return "redirect:/brand/" + brandId;
		}

		// doPayment y??u c???u ph???i ???????c chuy???n h?????ng t??? link /checkout/brand/...
		String referer = request.getHeader("Referer");
		if (referer == null || !referer.contains("/checkout/brand/") || !referer.contains(brandId.toString()))
			return "error/405";

		// chuy???n h?????ng t??? y??u c???u ?????t b??n d???ch v???
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
		} else { // chuy???n h?????ng t??? y??u c???u ?????t b??n th??ng th?????ng ho???c ?????t b??n g???i m??n
					// L???y th??ng tin ?????t b??n
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
			if (listCartItem != null) { // chuy???n danh s??ch l??n trang view
				model.addAttribute("listBookingProductDetail", listCartItem);
			}
			if (serviceBooking != null) {
				model.addAttribute("bookingServiceDetail", serviceBooking);
			}
			return "web/view-checkout";
		}

		if (checkoutForm.getPaymentMethodId() == Constants.PaymentMethod.DEPOSIT_NOW)
			bookingForm.setPaymentMethodId(Constants.PaymentMethod.DEPOSIT_NOW);

		/* L??u booking v??o csdl */
		Booking booking = bookingConverter.toEntity(bookingForm);
		booking = bookingRepository.saveAndFlush(booking);
		if (booking == null) {
			model.addAttribute("notification", "?????t b??n kh??ng th??nh c??ng!");
			model.addAttribute("bookingForm", bookingForm);
			model.addAttribute("checkoutForm", checkoutForm);
			if (listCartItem != null) { // chuy???n danh s??ch l??n trang view
				model.addAttribute("listBookingProductDetail", listCartItem);
			}
			if (serviceBooking != null) {
				model.addAttribute("bookingServiceDetail", serviceBooking);
			}
			return "web/view-checkout";
		}

		// L??u booking service detail v??o csdl
		if (bookingForm.getBookingType() == Constants.BookingType.BOOKING_SERVICE && serviceBooking != null) {
			BookingServiceDetail bookingServiceDetail = new BookingServiceDetail();
			bookingServiceDetail.setBooking(booking);
			bookingServiceDetail.setService(serviceBooking);
			bookingServiceDetail.setSalePriceForAdult(serviceBooking.getSalePriceForAdult());
			bookingServiceDetail.setSalePriceForChildren(serviceBooking.getSalePriceForChildren());
			bookingServiceDetailRepository.saveAndFlush(bookingServiceDetail);
		}

		// L??u danh s??ch booking product detail v??o csdl
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

		// C???p nh???t l???i session
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
		
		// X??c nh???n ng?????i s??? h???u ????n ?????t b??n
		if(booking.getAccount().getAccountId() != account.getAccountId()) {
			return null;
		}
		
		// X??c nh???n ????n ?????t b??n n??y c???n ph???i thanh to??n ?????t c???c
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
