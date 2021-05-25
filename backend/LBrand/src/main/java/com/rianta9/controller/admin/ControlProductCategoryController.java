/**
 * 
 */
package com.rianta9.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rianta9.repository.ProductCategoryRepository;

/**
 * @author rianta9
 * @datecreated 6 thg 5, 2021 14:02:27
 */

@Controller
public class ControlProductCategoryController {
	@Autowired
	private ProductCategoryRepository productCategoryRepository;
	
	@RequestMapping("/admin/product-category/list")
	public String listCategory(Model model) {
		model.addAttribute("listProductCategory", productCategoryRepository.findAll());
		return "admin/list-product-category";
	}
}
