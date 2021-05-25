/**
 * 
 */
package com.rianta9.controller.brandadmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rianta9.entity.Account;
import com.rianta9.entity.BrandAccount;
import com.rianta9.repository.AccountRepository;
import com.rianta9.repository.BrandAccountRepository;
import com.rianta9.repository.BrandCommentRepository;
import com.rianta9.repository.ProductCommentRepository;
import com.rianta9.repository.ServiceCommentRepository;

/**
 * @author rianta9
 * @datecreated 7 thg 5, 2021 01:00:53
 */

@Controller
public class ControlCommentController {
	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private BrandAccountRepository brandAccountRepository;
	
	@Autowired
	private BrandCommentRepository brandCommentRepository;
	
	@Autowired
	private ServiceCommentRepository serviceCommentRepository;
	
	@Autowired
	private ProductCommentRepository productCommentRepository;
	
	@RequestMapping(value = "/brand-admin/brand-comment/list")
	public String viewListBrandComment(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username != null) {
			Account account = accountRepository.findByUsername(username);
			if (account != null) {
				BrandAccount brandAccount = brandAccountRepository.findByAccountAccountId(account.getAccountId());
				if (brandAccount != null) {
					model.addAttribute("listBrandComment", brandCommentRepository.findAllByBrandBrandId(brandAccount.getBrand().getBrandId()));
				}
				else return "redirect:/403";
			}
			else return "redirect:/login";
		}
		else return "redirect:/login";
		return "brand-admin/list-brand-comment";
	}
	
	@RequestMapping(value = "/brand-admin/service-comment/list")
	public String viewListServiceComment(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username != null) {
			Account account = accountRepository.findByUsername(username);
			if (account != null) {
				BrandAccount brandAccount = brandAccountRepository.findByAccountAccountId(account.getAccountId());
				if (brandAccount != null) {
					model.addAttribute("listServiceComment", serviceCommentRepository.findAllByBrandId(brandAccount.getBrand().getBrandId()));
				}
				else return "redirect:/403";
			}
			else return "redirect:/login";
		}
		else return "redirect:/login";
		return "brand-admin/list-service-comment";
	}
	
	@RequestMapping(value = "/brand-admin/product-comment/list")
	public String viewListProductComment(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username != null) {
			Account account = accountRepository.findByUsername(username);
			if (account != null) {
				BrandAccount brandAccount = brandAccountRepository.findByAccountAccountId(account.getAccountId());
				if (brandAccount != null) {
					model.addAttribute("listProductComment", productCommentRepository.findAllByBrandId(brandAccount.getBrand().getBrandId()));
				}
				else return "redirect:/403";
			}
			else return "redirect:/login";
		}
		else return "redirect:/login";
		return "brand-admin/list-product-comment";
	}
}
