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
		// Lấy username ra
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
		model.addAttribute("notification", "Thông tin đặt bàn không hợp lệ!");
	}
	
	@PostMapping("/service/{serviceId}")
	public String doCheckoutService(@Valid @ModelAttribute BookingForm bookingForm, BindingResult result, Model model,
			@PathVariable Long serviceId, HttpSession session, RedirectAttributes redirectAttributes) {
		if (serviceId == null) return "error/404";

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
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
					"Thời điểm đặt bàn phải lớn hơn hiện tại ít nhất 30 phút!");
			result.addError(invalidDateTime);
			return "web/service-detail";
		}
		
		/* Kiểm tra có thể đặt bàn vào hiện tại không */
		// Kiểm tra số lượng bàn còn trống ở thời điểm đặt bàn
		IBrandCapacityStatistic capacity = brandCapacityRepository.findByBrandIdAndCapacityIdAndDateInAndTimeIn(
				service.getBrand().getBrandId(), bookingForm.getCapacityId(), bookingForm.getDateIn(),
				bookingForm.getTimeIn());

		if (capacity == null || capacity.getSlot() - capacity.getNumberOfReserved() - bookingForm.getNumberOfAdult()
				- bookingForm.getNumberOfChildren() < 0) {
			ObjectError invalidCapacity = new ObjectError("invalidCapacity",
					"Số lượng chỗ còn trống không đủ đáp ứng. Vui lòng chọn lại số lượng hoặc thay đổi thời điểm đến!");
			result.addError(invalidCapacity);
			recallPropertyWhenError(model, service);
			return "web/service-detail";
		}

		/* Set các dữ liệu liên quan cho bookingForm để lưu vào session */

		bookingForm.setBrandId(service.getBrand().getBrandId());
		bookingForm.setBrandName(service.getBrand().getBrandName());
		bookingForm.setAvatar(service.getBrand().getAvatar()); // brandAvatar
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
		
		bookingForm.setTotalPriceWithoutDiscount(service.getSalePriceForAdult().longValue()*bookingForm.getNumberOfAdult() + service.getSalePriceForChildren().longValue()*bookingForm.getNumberOfChildren());

		// Lấy danh sách dịch vụ
		HashMap<Long, Service> listServiceBooking = (HashMap<Long, Service>) session.getAttribute("myServiceBooking");
		if (listServiceBooking == null) {
			listServiceBooking = new HashMap<>();
		}

		// Push dịch vụ được chọn vào thương hiệu
		listServiceBooking.put(service.getBrand().getBrandId(), service);
		bookingForm.setBookingType(Constants.BookingType.BOOKING_SERVICE);
		
		System.out.println("BookingForm after:" + bookingForm.toString());
		// add vào session
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
			// Lấy username ra
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
