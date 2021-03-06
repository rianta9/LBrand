/**
 * 
 */
package com.rianta9.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rianta9.converter.AccountConverter;
import com.rianta9.dto.AccountDTO;
import com.rianta9.entity.Account;
import com.rianta9.entity.Role;
import com.rianta9.repository.AccountRepository;
import com.rianta9.repository.RoleRepository;
import com.rianta9.service.impl.AccountService;
import com.rianta9.util.Constants;

/**
 * @author rianta9
 * @datecreated 23 thg 4, 2021 00:26:12
 */
@Controller
public class LoginController {

	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private RoleRepository roleRespository;

	@Autowired
	private AccountService accountService;

	@Autowired
	private AccountConverter accountConverter;

	@RequestMapping("/login")
	public String login(Model model) {
		return "web/login";
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/home";
	}

	@GetMapping("/register")
	public String register(Model model) {
		if (model.getAttribute("account") == null)
			model.addAttribute("account", new AccountDTO());
		return "web/register";
	}

	@PostMapping("/register")
	public String registerupdate(Model model, @ModelAttribute("account") AccountDTO accountDTO,
			RedirectAttributes redirectAttributes) {
		System.out.println("AccountDTO:" + accountDTO.toString());
		accountDTO.setAvatar("image/account/avt2.jpg");
		accountDTO.setRoleId(Constants.Role.USER);
		accountDTO.setStatus(1);
		Account account = accountConverter.toEntity(accountDTO);
			
		
		System.out.println("Account:" + account.toString());
		boolean check = true;
		try {
			// ki???m tra username ???? t???n t???i hay ch??a
			if (accountRepository.findByUsername(account.getUsername()) != null) {
				redirectAttributes.addFlashAttribute("usererror", "T??n ????ng nh???p ???? t???n t???i! Vui l??ng nh???p t??n kh??c!");
				check = false;
			}
			// ki???m tra email ???? t???n t???i hay ch??a
			if (accountRepository.findByEmail(account.getEmail()) != null) {
				redirectAttributes.addFlashAttribute("emailerror", "Email ???? t???n t???i! Vui l??ng nh???p Email kh??c!");
				check = false;
			}
			// ki???m tra sdt ???? t???n t???i hay ch??a
			if (accountRepository.findByPhone(account.getPhone()) != null) {
				redirectAttributes.addFlashAttribute("phoneerror",
						"S??? ??i??n tho???i ???? t???n t???i! Vui l??ng nh???p S??? ??i??n tho???i kh??c!");
				check = false;
			}
			// n???u ????? ??i???u ki???n m???i th??m
			if (check == true) {
				account = accountService.save(account);
				if (account != null) {
					redirectAttributes.addFlashAttribute("notification",
							"T???o th??nh c??ng t??i kho???n: " + account.getUsername());
					return "redirect:/login";
				} else {
					redirectAttributes.addFlashAttribute("account", accountDTO);
					redirectAttributes.addFlashAttribute("notification", "T???o t??i kho???n th???t b???i!");
					return "redirect:/register";
				}

			} else {
				redirectAttributes.addFlashAttribute("notification", "T???o t??i kho???n th???t b???i!");
				redirectAttributes.addFlashAttribute("account", accountDTO);
				return "redirect:/register";
			}
		} catch (Exception e) {
			return "error/500";
		}
		
	}

}
