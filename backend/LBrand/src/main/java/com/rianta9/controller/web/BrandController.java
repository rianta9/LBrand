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

		// L???y username ra
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
		// L???y username ra
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

		// Ki???m tra r??ng bu???c d??? li???u
		if (result.hasErrors()) {
			model.addAttribute("brand", brand);
			model.addAttribute("listTime", Constants.BookingTime.getListTime());
			model.addAttribute("notification", "Th??ng tin ?????t b??n kh??ng h???p l???!");
			return "web/brand-detail";
		}

		System.out.println("BookingForm first:" + bookingForm.toString());
		
		if(!DateTimeUtil.checkValidDateTimeForBooking(bookingForm.getDateIn(), bookingForm.getTimeIn())) {
			model.addAttribute("brand", brand);
			model.addAttribute("listTime", Constants.BookingTime.getListTime());
			model.addAttribute("notification", "Th??ng tin ?????t b??n kh??ng h???p l???!");
			ObjectError invalidDateTime = new ObjectError("invalidDateTime",
					"Th???i ??i???m ?????t b??n ph???i l???n h??n hi???n t???i ??t nh???t 30 ph??t!");
			result.addError(invalidDateTime);
			return "web/brand-detail";
		}

		// Ki???m tra s??? l?????ng b??n c??n tr???ng ??? th???i ??i???m ???????c ch???n
		IBrandCapacityStatistic capacity = brandCapacityRepository.findByBrandIdAndCapacityIdAndDateInAndTimeIn(brandId,
				bookingForm.getCapacityId(), bookingForm.getDateIn(), bookingForm.getTimeIn());

		if (capacity == null || capacity.getSlot() - capacity.getNumberOfReserved() - bookingForm.getNumberOfAdult()
				- bookingForm.getNumberOfChildren() < 0) {
			ObjectError invalidCapacity = new ObjectError("invalidCapacity",
					"S??? l?????ng ch??? c??n tr???ng kh??ng ????? ????p ???ng. Vui l??ng ch???n l???i s??? l?????ng ho???c thay ?????i th???i ??i???m ?????n!");
			result.addError(invalidCapacity);
			model.addAttribute("brand", brand);
			model.addAttribute("listTime", Constants.BookingTime.getListTime());
			return "web/brand-detail";
		}

		/* Set c??c d??? li???u li??n quan cho bookingForm ????? l??u v??o session */

		bookingForm.setBrandId(brandId);
		bookingForm.setBrandName(brand.getBrandName());
		bookingForm.setAvatar(brand.getAvatar()); // brandAvatar
		bookingForm.setAccountId(account.getAccountId());
		bookingForm.setCustomer(account.getFullName());
		bookingForm.setContactPhone(account.getPhone());
		bookingForm.setCapacityId(capacity.getBrandCapacityId());
		bookingForm.setFloor(capacity.getFloor()); // S??? t???ng ng?????i d??ng ???? ch???n

		// L???y s??? ti???n ?????t c???c
		long numberOfPeople = bookingForm.getNumberOfChildren() + bookingForm.getNumberOfAdult();
		if (numberOfPeople >= 10) {
			bookingForm.setDeposit(numberOfPeople * 20000);
			bookingForm.setPaymentMethodId(Constants.PaymentMethod.CONFIRM_BEFORE_DEPOSIT);
			bookingForm.setPaymentMethodName(Constants.PaymentMethod.S_CONFIRM_BEFORE_DEPOSIT);
		}

		// L???y danh s??ch s???n ph???m
		HashMap<Long, Cart> listBrandBooking = (HashMap<Long, Cart>) session.getAttribute("myBooking");
		if (listBrandBooking == null) {
			listBrandBooking = new HashMap<>();
		}

		// L???y d??? li???u ?????t b??n theo m??n ??n c???a th????ng hi???u brandId t??? session
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
		// add v??o session
		session.setAttribute("brandBooking", bookingForm);
		session.setAttribute("myBooking", listBrandBooking);

		return "redirect:/checkout/brand/" + brandId;
	}

	
}
