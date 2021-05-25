/**
 * 
 */
package com.rianta9.controller.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpRequest;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rianta9.entity.Account;
import com.rianta9.entity.Brand;
import com.rianta9.entity.BrandInteraction;
import com.rianta9.entity.ServiceInteraction;
import com.rianta9.form.BookingForm;
import com.rianta9.model.Cart;
import com.rianta9.model.CartItem;
import com.rianta9.model.interf.IBrandCapacityStatistic;
import com.rianta9.repository.AccountRepository;
import com.rianta9.repository.BrandCapacityRepository;
import com.rianta9.repository.BrandInteractionRepository;
import com.rianta9.repository.BrandRepository;
import com.rianta9.repository.BrandServiceTypeRepository;
import com.rianta9.repository.ServiceRepository;
import com.rianta9.util.Constants;
import com.rianta9.util.DateTimeUtil;

/**
 * @author rianta9
 * @datecreated 27 thg 4, 2021 09:25:16
 */
@Controller
public class BrandController {

	@Autowired
	private BrandRepository brandRepository;

	@Autowired
	private BrandServiceTypeRepository brandServiceType;

	@Autowired
	private ServiceRepository serviceRepository;

	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private BrandInteractionRepository brandInteractionRepository;

	@Autowired
	private BrandCapacityRepository brandCapacityRepository;

	@GetMapping(value = "/brand/{brandId}")
	public String viewBrand(Model model, @PathVariable Long brandId, HttpSession session) {
		if (brandId == null)
			return "error/404";
		Brand brand = brandRepository.findByBrandId(brandId);
		if (brand == null)
			return "error/404";

		model.addAttribute("brand", brand);
		model.addAttribute("listTime", Constants.BookingTime.getListTime());
		model.addAttribute("topHotBrand", brandRepository.findTopBestSellerBrandByMonth(5));
		if (model.getAttribute("bookingForm") == null) {
			BookingForm bookingForm = (BookingForm)session.getAttribute("brandBooking");
			if(bookingForm == null || bookingForm.getBrandId() == null || !bookingForm.getBrandId().equals(brandId)) bookingForm = new BookingForm();
			model.addAttribute("bookingForm", bookingForm);
		}

		/* cap nhat service_interaction */
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();

		HashMap<Long, Cart> listBrandBooking = (HashMap<Long, Cart>) session.getAttribute("myBooking");
		if (listBrandBooking == null) {
			listBrandBooking = new HashMap<>();
		} else {
			Cart cart;
			if (listBrandBooking.containsKey(brandId)) {
				cart = listBrandBooking.get(brandId);
				model.addAttribute("cart", cart);
			}
		}

		// Lấy username ra
		if (username != null) {
			Account account = accountRepository.findByUsername(username);
			if (account != null) {

				BrandInteraction interaction = brandInteractionRepository
						.findByAccountAccountIdAndBrandBrandId(account.getAccountId(), brand.getBrandId());
				if (interaction == null) {
					interaction = new BrandInteraction();
				}

				else
					model.addAttribute("isFavourite", interaction.getFavourite());
				interaction.setBrand(brand);
				interaction.setAccount(account);
				interaction.setLastViewDate(new Date());
				brandInteractionRepository.saveAndFlush(interaction);
				model.addAttribute("listViewedBrand", brandRepository.findTopViewedHistory(6, account.getAccountId()));
				model.addAttribute("listRecommendedService",
						serviceRepository.findTopRecommendedService(5, account.getAccountId()));
			}
		}
		return "web/brand-detail";
	}

	@PostMapping("/brand/{brandId}")
	public String doCheckoutBrand(@Valid @ModelAttribute BookingForm bookingForm, BindingResult result, Model model,
			@PathVariable Long brandId, HttpSession session, RedirectAttributes redirectAttributes) {
		if (brandId == null)
			return "error/404";

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username == null)
			return "redirect:/login";

		Account account = accountRepository.findByUsername(username);
		if (account == null)
			return "redirect:/login";

		Brand brand = brandRepository.findByBrandId(brandId);
		if (brand == null)
			return "error/404";
		if (bookingForm == null)
			return "redirect:/brand/" + brandId;

		// Kiểm tra ràng buộc dữ liệu
		if (result.hasErrors()) {
			model.addAttribute("brand", brand);
			model.addAttribute("listTime", Constants.BookingTime.getListTime());
			model.addAttribute("notification", "Thông tin đặt bàn không hợp lệ!");
			return "web/brand-detail";
		}

		System.out.println("BookingForm first:" + bookingForm.toString());
		
		if(!DateTimeUtil.checkValidDateTimeForBooking(bookingForm.getDateIn(), bookingForm.getTimeIn())) {
			model.addAttribute("brand", brand);
			model.addAttribute("listTime", Constants.BookingTime.getListTime());
			model.addAttribute("notification", "Thông tin đặt bàn không hợp lệ!");
			ObjectError invalidDateTime = new ObjectError("invalidDateTime",
					"Thời điểm đặt bàn phải lớn hơn hiện tại ít nhất 30 phút!");
			result.addError(invalidDateTime);
			return "web/brand-detail";
		}

		// Kiểm tra số lượng bàn còn trống ở thời điểm được chọn
		IBrandCapacityStatistic capacity = brandCapacityRepository.findByBrandIdAndCapacityIdAndDateInAndTimeIn(brandId,
				bookingForm.getCapacityId(), bookingForm.getDateIn(), bookingForm.getTimeIn());

		if (capacity == null || capacity.getSlot() - capacity.getNumberOfReserved() - bookingForm.getNumberOfAdult()
				- bookingForm.getNumberOfChildren() < 0) {
			ObjectError invalidCapacity = new ObjectError("invalidCapacity",
					"Số lượng chỗ còn trống không đủ đáp ứng. Vui lòng chọn lại số lượng hoặc thay đổi thời điểm đến!");
			result.addError(invalidCapacity);
			model.addAttribute("brand", brand);
			model.addAttribute("listTime", Constants.BookingTime.getListTime());
			return "web/brand-detail";
		}

		/* Set các dữ liệu liên quan cho bookingForm để lưu vào session */

		bookingForm.setBrandId(brandId);
		bookingForm.setBrandName(brand.getBrandName());
		bookingForm.setAvatar(brand.getAvatar()); // brandAvatar
		bookingForm.setAccountId(account.getAccountId());
		bookingForm.setCustomer(account.getFullName());
		bookingForm.setContactPhone(account.getPhone());
		bookingForm.setCapacityId(capacity.getBrandCapacityId());
		bookingForm.setFloor(capacity.getFloor()); // Số tầng người dùng đã chọn

		// Lấy số tiền đặt cọc
		long numberOfPeople = bookingForm.getNumberOfChildren() + bookingForm.getNumberOfAdult();
		if (numberOfPeople >= 10) {
			bookingForm.setDeposit(numberOfPeople * 20000);
			bookingForm.setPaymentMethodId(Constants.PaymentMethod.CONFIRM_BEFORE_DEPOSIT);
			bookingForm.setPaymentMethodName(Constants.PaymentMethod.S_CONFIRM_BEFORE_DEPOSIT);
		}

		// Lấy danh sách sản phẩm
		HashMap<Long, Cart> listBrandBooking = (HashMap<Long, Cart>) session.getAttribute("myBooking");
		if (listBrandBooking == null) {
			listBrandBooking = new HashMap<>();
		}

		// Lấy dữ liệu đặt bàn theo món ăn của thương hiệu brandId từ session
		Cart brandBooking;

		if (listBrandBooking.containsKey(brandId)) {
			brandBooking = listBrandBooking.get(brandId);
			List<CartItem> listCartItem = brandBooking.getListItem();
			if (listCartItem != null) {
				bookingForm.setDeposit(Math.max(bookingForm.getDeposit(), brandBooking.getTotalPrice() * 50 / 100));
				bookingForm.setTotalPriceWithoutDiscount(brandBooking.getTotalPrice());
				bookingForm.setPaymentMethodId(Constants.PaymentMethod.CONFIRM_BEFORE_DEPOSIT);
				bookingForm.setPaymentMethodName(Constants.PaymentMethod.S_CONFIRM_BEFORE_DEPOSIT);
				bookingForm.setBookingType(Constants.BookingType.BOOKING_ORDER);
			}
		}
		
		System.out.println("BookingForm after:" + bookingForm.toString());
		// add vào session
		session.setAttribute("brandBooking", bookingForm);
		session.setAttribute("myBooking", listBrandBooking);

		return "redirect:/checkout/brand/" + brandId;
	}

	
}
