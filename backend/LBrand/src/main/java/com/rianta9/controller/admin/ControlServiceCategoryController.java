/**
 * 
 */
package com.rianta9.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rianta9.repository.ServiceCategoryRepository;

/**
 * @author rianta9
 * @datecreated 6 thg 5, 2021 14:02:27
 */

@Controller
public class ControlServiceCategoryController {
	@Autowired
	private ServiceCategoryRepository serviceCategoryRepository;
	
	@RequestMapping("/admin/service-category/list")
	public String listCategory(Model model) {
		model.addAttribute("listServiceCategory", serviceCategoryRepository.findAll());
		return "admin/list-service-category";
	}
}
