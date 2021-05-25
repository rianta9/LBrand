/**
 * 
 */
package com.rianta9.controller.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rianta9.entity.Banner;
import com.rianta9.entity.Brand;
import com.rianta9.entity.Service;
import com.rianta9.repository.BannerRepository;
import com.rianta9.repository.BrandRepository;
import com.rianta9.repository.ServiceRepository;

/**
 * @author rianta9
 * @datecreated 23 thg 4, 2021 00:38:17
 */
@Controller
public class HomeController {
	@Autowired
	private BrandRepository brandRepository;
	
	@Autowired
	private ServiceRepository serviceRepository;
	
	@Autowired
	private BannerRepository bannerRepository;
	
	
	@RequestMapping(value = {"/home", "/", ""})
	public String home(Model model) {
		List<Brand> listTopBrand = brandRepository.findTopBestSellerBrandByMonth(4);
		if(listTopBrand == null) listTopBrand = new ArrayList<Brand>();
		model.addAttribute("listTopBrand", listTopBrand);
		model.addAttribute("listBanner", bannerRepository.findAllByDateActive(new Date()));
		
		List<Service> listServiceInSale = serviceRepository.findTopSaleService(10);
		model.addAttribute("listServiceInSale", listServiceInSale);
		return "web/home";
	}
}
