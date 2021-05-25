/**
 * 
 */
package com.rianta9.controller.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rianta9.entity.Account;
import com.rianta9.entity.Booking;
import com.rianta9.model.ItemReview;
import com.rianta9.model.interf.IItemReview;
import com.rianta9.repository.AccountRepository;
import com.rianta9.repository.BookingRepository;
import com.rianta9.repository.BookingStatusRepository;
import com.rianta9.repository.CommentRepository;
import com.rianta9.util.Constants;

/**
 * @author rianta9
 * @datecreated 7 thg 5, 2021 16:27:12
 */

@Controller
public class MyAccountController {
	@Autowired
	private AccountRepository accountRepository;
	
	@Autowired
	private BookingRepository bookingRepository;
	
	@Autowired
	private BookingStatusRepository bookingStatusRepository;
	
	@Autowired
	private CommentRepository commentRepository;

	@RequestMapping("/my-account")
	public String viewMyAccount(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username != null) {
			Account account = accountRepository.findByUsername(username);
			if (account != null) {
				model.addAttribute("account", account);
				model.addAttribute("listGender", Constants.Gender.getListGender());
				model.addAttribute("listBooking", bookingRepository.findAllByAccountAccountId(account.getAccountId()));
			}
		}
		return "web/my-account";
	}
	
	@RequestMapping("/my-account/booking-detail/{bookingId}")
	public String viewBookingDetail(Model model, @PathVariable Long bookingId) {
		if(bookingId == null) return "error/404";
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username != null) {
			Account account = accountRepository.findByUsername(username);
			if (account != null) {
				Booking booking = bookingRepository.findByBookingIdAndAccountAccountId(bookingId, account.getAccountId());
				if(booking == null) return "error/404";
				else model.addAttribute("booking", booking);
			}
		}
		return "web/booking-detail";
	}
	
	@RequestMapping("/my-account/booking-detail/{bookingId}/cancel")
	public String doCancelBookingDetail(Model model, @PathVariable Long bookingId, RedirectAttributes redirect) {
		if(bookingId == null) return "error/404";
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username != null) {
			Account account = accountRepository.findByUsername(username);
			if (account != null) {
				Booking booking = bookingRepository.findByBookingIdAndAccountAccountId(bookingId, account.getAccountId());
				if(booking == null) return "error/404";
				else {
					booking.setBookingStatus(bookingStatusRepository.findByBookingStatusId(Constants.BookingStatus.CANCELED));
					booking = bookingRepository.saveAndFlush(booking);
					if(booking == null) redirect.addAttribute("notification", "Huỷ đặt bàn thất bại!");
					else redirect.addAttribute("notification", "Huỷ đặt bàn thành công!");
				}
			}
		}
		return "redirect:/my-account/booking-detail/" + bookingId;
	}
	
	
	@RequestMapping("/my-account/booking-history")
	public String viewBookingHistory(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username != null) {
			Account account = accountRepository.findByUsername(username);
			if (account != null) {
				model.addAttribute("listBooking", bookingRepository.findAllByAccountAccountIdOrderByDateCreatedDesc(account.getAccountId()));
			}
		}
		return "web/booking-history";
	}
	
	
	@RequestMapping("/my-account/review")
	public String viewListItemForReview(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username != null) {
			Account account = accountRepository.findByUsername(username);
			if (account != null) {
				List<IItemReview> listItemReview = commentRepository.listItemBrandReview(account.getAccountId());
				List<ItemReview> listBrandReview = new ArrayList<ItemReview>();
				for (IItemReview iItemReview : listItemReview) {
					Booking booking = bookingRepository.findByBookingId(iItemReview.getBookingId());
					ItemReview item = new ItemReview();
					item.setBookingId(iItemReview.getBookingId());
					item.setAvatar(iItemReview.getAvatar());
					item.setBrandId(iItemReview.getBrandId());
					item.setBrandName(iItemReview.getBrandName());
					item.setDateCreated(iItemReview.getDateCreated());
					item.setDateIn(iItemReview.getDateIn());
					item.setTotalPrice(booking.getStringTotalPrice());
					listBrandReview.add(item);
				}
				model.addAttribute("listBrandReview", listBrandReview);
			}
		}
		return "web/list-review";
	}
}
