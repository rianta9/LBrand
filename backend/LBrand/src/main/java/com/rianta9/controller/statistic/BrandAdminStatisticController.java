/**
 * 
 */
package com.rianta9.controller.statistic;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rianta9.entity.Account;
import com.rianta9.entity.BrandAccount;
import com.rianta9.model.interf.ISalesStatistic;
import com.rianta9.repository.AccountRepository;
import com.rianta9.repository.BookingRepository;
import com.rianta9.repository.BrandAccountRepository;
import com.rianta9.repository.BrandRepository;
import com.rianta9.util.MoneyHelper;

/**
 * @author rianta9
 * @datecreated 21 thg 4, 2021 10:02:02
 */

@Controller
public class BrandAdminStatisticController {
	@Autowired
	private BrandRepository brandRepository;
	
	@Autowired
	private AccountRepository accountRepository;
	
	@Autowired
	private BookingRepository bookingRepository;
	
	@Autowired
	private BrandAccountRepository brandAccountRepository;
	
	
	@RequestMapping("/brand-admin/statistic/booking")
	private String viewStatisticBookingForBrandAdmin(Model model, HttpServletRequest request) {
//		String mm = request.getParameter("month");
		String yyyy = request.getParameter("year");
		if(yyyy == null) yyyy = String.valueOf(new Date().getYear()+1900);
//		if(mm == null) mm = String.valueOf(new Date().getMonth()+1);
//		Integer month = Integer.parseInt(mm);
		Integer year = Integer.parseInt(yyyy);
		model.addAttribute("year", year);
//		model.addAttribute("month", month);
		
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
		
		// Lấy danh sách thống kê đơn đặt bàn theo từng tháng của một năm
		List<ISalesStatistic> listSalesStatistic = bookingRepository.listBookingStatisticByMonthsOfYear(brandAccount.getBrand().getBrandId(), year);
		List<Long> listNumberOfBookingByYear = new ArrayList<Long>();
		Long maxNumberOfBookings = 0l;
		
		for (ISalesStatistic item : listSalesStatistic) {
			listNumberOfBookingByYear.add(item.getValue());
			maxNumberOfBookings = Math.max(maxNumberOfBookings, item.getValue());
		}
		
		model.addAttribute("titleBookingStatistic", "Thống kê số lượng đơn đặt bàn theo từng tháng của năm " + year);
		model.addAttribute("listNumberOfBookingByYear", listNumberOfBookingByYear);
		model.addAttribute("maxNumberOfBookings", maxNumberOfBookings+20);
		
		
		// Lấy danh sách doanh số đặt bàn gọi món theo từng tháng của một năm
		List<ISalesStatistic> listProductBookingSalesStatistic = bookingRepository.listProductBookingSalesStatisticByMonthsOfYear(brandAccount.getBrand().getBrandId(),year);
		List<Long> listProductBookingSales = new ArrayList<Long>();
		Long maxProductBookingSales = 0l;
		
		for (ISalesStatistic item : listProductBookingSalesStatistic) {
			listProductBookingSales.add(item.getValue());
			maxProductBookingSales = Math.max(maxProductBookingSales, item.getValue());
		}
		
		model.addAttribute("titleProductBookingSalesStatistic", "Thống kê doanh số đặt bàn gọi món theo từng tháng của năm " + year);
		model.addAttribute("listProductBookingSales", listProductBookingSales);
		model.addAttribute("maxProductBookingSales", maxProductBookingSales+1000000);
		
		
		// Lấy danh sách doanh số đặt bàn theo dịch vụ theo từng tháng của một năm
		List<ISalesStatistic> listServiceBookingSalesStatistic = bookingRepository.listServiceBookingSalesStatisticByMonthsOfYear(brandAccount.getBrand().getBrandId(), year);
		List<Long> listServiceBookingSales = new ArrayList<Long>();
		Long maxServiceBookingSales = 0l;
		
		for (ISalesStatistic item : listServiceBookingSalesStatistic) {
			listServiceBookingSales.add(item.getValue());
			maxServiceBookingSales = Math.max(maxServiceBookingSales, item.getValue());
		}
		
		model.addAttribute("titleServiceBookingSalesStatistic", "Thống kê doanh số đặt bàn dịch vụ theo từng tháng của năm " + year);
		model.addAttribute("listServiceBookingSales", listServiceBookingSales);
		model.addAttribute("maxServiceBookingSales", maxServiceBookingSales+1000000);
		
		
		return "brand-admin/statistic-booking";
	}
	
}
