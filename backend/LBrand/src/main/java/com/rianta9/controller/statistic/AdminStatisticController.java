/**
 * 
 */
package com.rianta9.controller.statistic;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rianta9.model.interf.ISalesStatistic;
import com.rianta9.repository.BookingRepository;
import com.rianta9.repository.BrandRepository;
import com.rianta9.util.MoneyHelper;

/**
 * @author rianta9
 * @datecreated 21 thg 4, 2021 10:02:02
 */

@Controller
public class AdminStatisticController {
	@Autowired
	private BrandRepository brandRepository;
	
	@Autowired
	private BookingRepository bookingRepository;
	
	
	@RequestMapping("/admin/statistic/brand")
	private String viewBrandStatisticForAdmin(Model model, HttpServletRequest request) {
		String mm = request.getParameter("month");
		String yyyy = request.getParameter("year");
		if(yyyy == null) yyyy = String.valueOf(new Date().getYear()+1900);
		if(mm == null) mm = String.valueOf(new Date().getMonth()+1);
		Integer month = Integer.parseInt(mm);
		Integer year = Integer.parseInt(yyyy);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("titleTop10BestSellerBrand", "Thống kê top 10 thương hiệu nổi bật nhất tháng " + mm + " năm " + yyyy);
		model.addAttribute("listTop10BestSellerBrand", brandRepository.top10BestSellerBrand(month, year));
		model.addAttribute("titleTop10BestFavouriteBrand", "Thống kê top 10 thương hiệu được yêu thích nhất tháng " + mm + " năm " + yyyy);
		model.addAttribute("listTop10BestFavouriteBrand", brandRepository.top10BestFavouriteBrand(month, year));
		model.addAttribute("titleBrandSalesByMonthAndYear", "Doanh số của các thương hiệu trong tháng " + mm + " năm " + yyyy);
		model.addAttribute("listBrandSalesByMonthAndYear", brandRepository.findAllBrandSalesByMonthAndYear(month, year));
		return "admin/statistic-brand";
	}
	
	@RequestMapping("/admin/statistic/sales")
	private String viewStatisticSalesForAdmin(Model model, HttpServletRequest request) {
//		String mm = request.getParameter("month");
		String yyyy = request.getParameter("year");
		if(yyyy == null) yyyy = String.valueOf(new Date().getYear()+1900);
//		if(mm == null) mm = String.valueOf(new Date().getMonth()+1);
//		Integer month = Integer.parseInt(mm);
		Integer year = Integer.parseInt(yyyy);
		model.addAttribute("year", year);
//		model.addAttribute("month", month);
		
		// Lấy danh sách thống kê đơn đặt bàn theo từng tháng của một năm
		List<ISalesStatistic> listSalesStatistic = bookingRepository.listBookingStatisticByMonthsOfYear(year);
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
		List<ISalesStatistic> listProductBookingSalesStatistic = bookingRepository.listProductBookingSalesStatisticByMonthsOfYear(year);
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
		List<ISalesStatistic> listServiceBookingSalesStatistic = bookingRepository.listServiceBookingSalesStatisticByMonthsOfYear(year);
		List<Long> listServiceBookingSales = new ArrayList<Long>();
		Long maxServiceBookingSales = 0l;
		
		for (ISalesStatistic item : listServiceBookingSalesStatistic) {
			listServiceBookingSales.add(item.getValue());
			maxServiceBookingSales = Math.max(maxServiceBookingSales, item.getValue());
		}
		
		model.addAttribute("titleServiceBookingSalesStatistic", "Thống kê doanh số đặt bàn dịch vụ theo từng tháng của năm " + year);
		model.addAttribute("listServiceBookingSales", listServiceBookingSales);
		model.addAttribute("maxServiceBookingSales", maxServiceBookingSales+1000000);
		
		
		return "admin/statistic-sales";
	}
	
}
