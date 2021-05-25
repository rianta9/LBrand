/**
 * 
 */
package com.rianta9.controller.brandadmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rianta9.entity.Account;
import com.rianta9.entity.Booking;
import com.rianta9.entity.BrandAccount;
import com.rianta9.repository.AccountRepository;
import com.rianta9.repository.BookingRepository;
import com.rianta9.repository.BookingStatusRepository;
import com.rianta9.repository.BrandAccountRepository;

/**
 * @author rianta9
 * @datecreated 7 thg 5, 2021 09:49:32
 */

@Controller
public class ControlBookingController {
	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private BrandAccountRepository brandAccountRepository;

	@Autowired
	private BookingRepository bookingRepository;
	
	@Autowired
	private BookingStatusRepository bookingStatusRepository;

	@RequestMapping(value = "/brand-admin/booking/list")
	public String viewListBooking(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username != null) {
			Account account = accountRepository.findByUsername(username);
			if (account != null) {
				BrandAccount brandAccount = brandAccountRepository.findByAccountAccountId(account.getAccountId());
				if (brandAccount != null) {
					model.addAttribute("listBooking",
							bookingRepository.findAllByBrandId(brandAccount.getBrand().getBrandId()));

				} else
					return "error/403";
			} else
				return "redirect:/login";
		} else
			return "redirect:/login";
		return "brand-admin/list-booking";
	}

	@GetMapping(value = "/brand-admin/booking/{bookingId}/edit")
	public String viewEditBooking(Model model, @PathVariable Long bookingId) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username == null)
			return "redirect:/login";

		Account account = accountRepository.findByUsername(username);
		if (account == null)
			return "redirect:/login";
		BrandAccount brandAccount = brandAccountRepository.findByAccountAccountId(account.getAccountId());
		if (brandAccount == null)
			return "error/403";
		
		Booking booking = bookingRepository.findAllByBrandCapacityBrandBrandIdAndBookingId(brandAccount.getBrand().getBrandId(), bookingId);
		if(booking == null) return "error/403";
		
		model.addAttribute("listBookingStatus", bookingStatusRepository.findAll());
		model.addAttribute("booking", booking);

		return "brand-admin/update-booking";
	}
	
	@PostMapping(value = "/brand-admin/booking/{bookingId}/edit")
	public String doEditBooking(Model model, @PathVariable Long bookingId, @RequestParam Integer bookingStatusId, RedirectAttributes redirect) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username == null)
			return "redirect:/login";

		Account account = accountRepository.findByUsername(username);
		if (account == null)
			return "redirect:/login";
		
		BrandAccount brandAccount = brandAccountRepository.findByAccountAccountId(account.getAccountId());
		if (brandAccount == null)
			return "error/403";
		
		if(bookingStatusId == null) {
			redirect.addFlashAttribute("notification", "Cập nhật không thành công!");
			return "redirect:/brand-admin/booking/" + bookingId + "/edit";
		}
		
		Booking booking = bookingRepository.findAllByBrandCapacityBrandBrandIdAndBookingId(brandAccount.getBrand().getBrandId(), bookingId);
		if(booking == null) return "error/403";
		
		booking.setBookingStatus(bookingStatusRepository.findByBookingStatusId(bookingStatusId));
		bookingRepository.saveAndFlush(booking);
		
		redirect.addFlashAttribute("notification", "Cập nhật thành công!");

		return  "redirect:/brand-admin/booking/" + bookingId + "/edit";
	}
}
