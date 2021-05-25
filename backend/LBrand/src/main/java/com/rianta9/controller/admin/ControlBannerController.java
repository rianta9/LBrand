/**
 * 
 */
package com.rianta9.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rianta9.repository.BannerRepository;

/**
 * @author rianta9
 * @datecreated 19 thg 5, 2021 22:01:43
 */

@Controller
public class ControlBannerController {
	@Autowired
	private BannerRepository bannerRepository;
	
	@RequestMapping(value="/admin/banner/list")
	public String viewListBanner(Model model) {
		model.addAttribute("listBanner", bannerRepository.findAll());
		return "admin/list-banner";
	}
}
