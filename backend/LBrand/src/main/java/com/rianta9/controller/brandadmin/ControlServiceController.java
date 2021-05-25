/**
 * 
 */
package com.rianta9.controller.brandadmin;

import java.util.ArrayList;

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
import com.rianta9.repository.ProductRepository;
import com.rianta9.repository.ServiceRepository;

/**
 * @author rianta9
 * @datecreated 6 thg 5, 2021 14:42:07
 */

@Controller
public class ControlServiceController {
	@Autowired
	private ServiceRepository serviceRepository;

	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private BrandAccountRepository brandAccountRepository;

	@RequestMapping(value = "/brand-admin/service/list")
	public String viewListService(Model model) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username != null) {
			Account account = accountRepository.findByUsername(username);
			if (account != null) {
				BrandAccount brandAccount = brandAccountRepository.findByAccountAccountId(account.getAccountId());
				if (brandAccount != null) {
					model.addAttribute("listService",
							serviceRepository.findAllByBrandBrandId(brandAccount.getBrand().getBrandId()));

				}
				else return "redirect:/403";
			}
			else return "redirect:/login";
		}
		else return "redirect:/login";
		return "brand-admin/list-service";
	}
}
