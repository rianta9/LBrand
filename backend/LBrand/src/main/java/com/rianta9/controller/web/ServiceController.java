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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rianta9.entity.Account;
import com.rianta9.entity.Brand;
import com.rianta9.entity.Comment;
import com.rianta9.entity.Service;
import com.rianta9.entity.ServiceInteraction;
import com.rianta9.form.BookingForm;
import com.rianta9.model.Cart;
import com.rianta9.model.CartItem;
import com.rianta9.model.interf.IBrandCapacityStatistic;
import com.rianta9.repository.AccountRepository;
import com.rianta9.repository.BrandCapacityRepository;
import com.rianta9.repository.BrandRepository;
import com.rianta9.repository.CommentRepository;
import com.rianta9.repository.ServiceInteractionRepository;
import com.rianta9.repository.ServiceRepository;
import com.rianta9.util.Constants;
import com.rianta9.util.DateTimeUtil;

/**
 * @author rianta9
 * @datecreated 27 thg 4, 2021 15:10:24
 */
@Controller
public class ServiceController {
	@Autowired
	private ServiceRepository serviceRepository;

	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private ServiceInteractionRepository serviceInteractionRepository;

	@Autowired
	private BrandRepository brandRepository;

	@Autowired
	private BrandCapacityRepository brandCapacityRepository;

	@RequestMapping(value = "/service/{serviceId}")
	public String viewServiceDetail(Model model, @PathVariable(required = true) Long serviceId, HttpSession session) {
		Service service = serviceRepository.findByServiceId(serviceId);
		if (service == null)
			return "error/404";
		model.addAttribute("service", service);
		model.addAttribute("listCapacity", brandCapacityRepository.findAllByBrandBrandId(service.getBrand().getBrandId()));
		model.addAttribute("listTime", Constants.BookingTime.getListTime());
		model.addAttribute("topHotService", serviceRepository.findTopBestSellerServiceByMonth(5));
		if (model.getAttribute("bookingForm") == null) {
			BookingForm bookingForm = (BookingForm)session.getAttribute("brandBooking");
			if(bookingForm == null || bookingForm.getBrandId() == null || !bookingForm.getBrandId().equals(service.getBrand().getBrandId())) bookingForm = new BookingForm();
			model.addAttribute("bookingForm", bookingForm);
		}
			
		/* cap nhat service_interaction */
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// L???y username ra
		if (username != null) {
			Account account = accountRepository.findByUsername(username);
			if (account != null) {
				ServiceInteraction interaction = serviceInteractionRepository
						.findByAccountAccountIdAndServiceServiceId(account.getAccountId(), service.getServiceId());
				if (interaction == null)
					interaction = new ServiceInteraction();
				else
					model.addAttribute("isFavourite", interaction.getFavourite());
				interaction.setService(service);
				interaction.setAccount(account);
				interaction.setLastViewDate(new Date());
				serviceInteractionRepository.saveAndFlush(interaction);
				model.addAttribute("listViewedService",
						serviceRepository.findTopViewedHistory(5, account.getAccountId()));
				model.addAttribute("listRecommendedService",
						serviceRepository.findTopRecommendedService(5, account.getAccountId()));
			}
		}

		return "web/service-detail";
	}

	
	private void recallPropertyWhenError(Model model, Service service) {
		model.addAttribute("service", service);
		model.addAttribute("listTime", Constants.BookingTime.getListTime());
		model.addAttribute("notification", "Th??ng tin ?????t b??n kh??ng h???p l???!");
	}
	
	@PostMapping("/service/{serviceId}")
	public String doCheckoutService(@Valid @ModelAttribute BookingForm bookingForm, BindingResult result, Model model,
			@PathVariable Long serviceId, HttpSession session, RedirectAttributes redirectAttributes) {
		if (serviceId == null) return "error/404";

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// L???y username ra
		if (username == null) return "redirect:/login";
		Account account = accountRepository.findByUsername(username);
		if (account == null) return "redirect:/login";

		Service service = serviceRepository.findByServiceId(serviceId);
		if (service == null) return "error/404";
		if (bookingForm == null) return "redirect:/service/" + serviceId;
		if (result.hasErrors()) {
			recallPropertyWhenError(model, service);
			return "web/service-detail";
		}

		System.out.println("BookingForm first:" + bookingForm.toString());
		
		if(!DateTimeUtil.checkValidDateTimeForBooking(bookingForm.getDateIn(), bookingForm.getTimeIn())) {
			recallPropertyWhenError(model, service);
			ObjectError invalidDateTime = new ObjectError("invalidDateTime",
					"Th???i ??i???m ?????t b??n ph???i l???n h??n hi???n t???i ??t nh???t 30 ph??t!");
			result.addError(invalidDateTime);
			return "web/service-detail";
		}
		
		/* Ki???m tra c?? th??? ?????t b??n v??o hi???n t???i kh??ng */
		// Ki???m tra s??? l?????ng b??n c??n tr???ng ??? th???i ??i???m ?????t b??n
		IBrandCapacityStatistic capacity = brandCapacityRepository.findByBrandIdAndCapacityIdAndDateInAndTimeIn(
				service.getBrand().getBrandId(), bookingForm.getCapacityId(), bookingForm.getDateIn(),
				bookingForm.getTimeIn());

		if (capacity == null || capacity.getSlot() - capacity.getNumberOfReserved() - bookingForm.getNumberOfAdult()
				- bookingForm.getNumberOfChildren() < 0) {
			ObjectError invalidCapacity = new ObjectError("invalidCapacity",
					"S??? l?????ng ch??? c??n tr???ng kh??ng ????? ????p ???ng. Vui l??ng ch???n l???i s??? l?????ng ho???c thay ?????i th???i ??i???m ?????n!");
			result.addError(invalidCapacity);
			recallPropertyWhenError(model, service);
			return "web/service-detail";
		}

		/* Set c??c d??? li???u li??n quan cho bookingForm ????? l??u v??o session */

		bookingForm.setBrandId(service.getBrand().getBrandId());
		bookingForm.setBrandName(service.getBrand().getBrandName());
		bookingForm.setAvatar(service.getBrand().getAvatar()); // brandAvatar
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
		
		bookingForm.setTotalPriceWithoutDiscount(service.getSalePriceForAdult().longValue()*bookingForm.getNumberOfAdult() + service.getSalePriceForChildren().longValue()*bookingForm.getNumberOfChildren());

		// L???y danh s??ch d???ch v???
		HashMap<Long, Service> listServiceBooking = (HashMap<Long, Service>) session.getAttribute("myServiceBooking");
		if (listServiceBooking == null) {
			listServiceBooking = new HashMap<>();
		}

		// Push d???ch v??? ???????c ch???n v??o th????ng hi???u
		listServiceBooking.put(service.getBrand().getBrandId(), service);
		bookingForm.setBookingType(Constants.BookingType.BOOKING_SERVICE);
		
		System.out.println("BookingForm after:" + bookingForm.toString());
		// add v??o session
		session.setAttribute("brandBooking", bookingForm);
		session.setAttribute("myServiceBooking", listServiceBooking);
		return "redirect:/checkout/brand/" + service.getBrand().getBrandId() + "/service/" + service.getServiceId();

	}

	@RequestMapping(value = "/service/{serviceId}/favourite/{isLike}")
	public String likeService(@PathVariable(required = true) Long serviceId,
			@PathVariable(required = true) Boolean isLike, HttpServletRequest request) {
		if (serviceId == null || isLike == null)
			return "error/404";
		Service service = serviceRepository.findByServiceId(serviceId);
		if (service != null) {
			/* cap nhat service_interaction */
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String username = auth.getName();
			// L???y username ra
			if (username != null) {
				Account account = accountRepository.findByUsername(username);
				if (account != null) {
					ServiceInteraction interaction = serviceInteractionRepository
							.findByAccountAccountIdAndServiceServiceId(account.getAccountId(), service.getServiceId());
					if (interaction == null)
						interaction = new ServiceInteraction();
					else
						System.out.println(interaction.getInteractionId());
					interaction.setService(service);
					interaction.setAccount(account);
					System.out.println(isLike);
					interaction.setFavourite(isLike);
					serviceInteractionRepository.saveAndFlush(interaction);
				}
			} else
				return "redirect:/login";
		} else
			return "error/404";
		String referer = request.getHeader("Referer");
		if (referer == null)
			referer = "/home";
		return "redirect:" + referer;
	}
}
