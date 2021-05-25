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
import com.rianta9.repository.DiscountCodeRepository;

/**
 * @author rianta9
 * @datecreated 7 thg 5, 2021 00:26:13
 */

@Controller
public class DiscountCodeController {
	@Autowired
	DiscountCodeRepository discountCodeRepository;
	
	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private BrandAccountRepository brandAccountRepository;
	
	
	@RequestMapping(value = "/brand-admin/discount-code/list")
	public String viewListDiscountCode(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username != null) {
			Account account = accountRepository.findByUsername(username);
			if (account != null) {
				BrandAccount brandAccount = brandAccountRepository.findByAccountAccountId(account.getAccountId());
				if (brandAccount != null) {
					model.addAttribute("listDiscountCode", discountCodeRepository.findAllByBrandBrandId(brandAccount.getBrand().getBrandId()));
				}
				else return "redirect:/403";
			}
			else return "redirect:/login";
		}
		else return "redirect:/login";
		return "brand-admin/list-discount-code";
	}
}
