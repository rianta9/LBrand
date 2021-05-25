/**
 * 
 */
package com.rianta9.controller.admin;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rianta9.entity.Account;
import com.rianta9.entity.Brand;
import com.rianta9.entity.BrandAccount;
import com.rianta9.repository.AccountRepository;
import com.rianta9.repository.BrandAccountRepository;
import com.rianta9.repository.BrandRepository;

/**
 * @author rianta9
 * @datecreated 24 thg 4, 2021 23:07:23
 */

@Controller
public class ControlBrandAccountController {
	@Autowired
	private BrandAccountRepository brandAccountRepository;
	
	@Autowired
	private BrandRepository brandRepository;
	
	@Autowired
	private AccountRepository accountRepository;

	@RequestMapping(value = "/admin/brand-admin/list")
	public String viewListBrandAccount(Model model) {
		model.addAttribute("listBrandAccount", brandAccountRepository.findAll());
		return "admin/list-brand-admin";
	}

	
	
	@PostMapping("/admin/brand-admin/new")
	public String doCreateBrandAccount(Long brandId, String username, Model model, RedirectAttributes redirect) {
		if(brandId == null || username == null) {
			redirect.addFlashAttribute("notification", "Yêu cầu tạo mới quản trị viên thương hiệu không hợp lệ!");
			return "redirect:/admin/brand-admin/list";
		}
		
		boolean check = true;
		
		Brand brand = brandRepository.findByBrandId(brandId);
		if(brand == null) {
			redirect.addFlashAttribute("notExistBrand", "Không tồn tại thương hiệu có id:" + brandId);
			check = false;
		}
		
		
		Account account = accountRepository.findByUsername(username);
		if(account == null) {
			redirect.addFlashAttribute("notExistAccount", "Không tồn tại username:" + username);
			check = false;
		}
		
		if(brandAccountRepository.findByBrandBrandIdAndAccountUsername(brandId, username) != null) {
			redirect.addFlashAttribute("existedBrandAccount", "Đã tồn tại quản trị viên thương hiệu này!");
			check = false;
		}
		
		if(check == false) {
			redirect.addFlashAttribute("brandId", brandId);
			redirect.addFlashAttribute("username", username);
			return "redirect:/admin/brand-admin/list";
		}
		
		BrandAccount brandAccount = new BrandAccount(brand, account);
		brandAccount = brandAccountRepository.saveAndFlush(brandAccount);
		if(brandAccount == null) {
			redirect.addFlashAttribute("notification", "Tạo quản trị viên thương hiệu thành công!");
		}
		else redirect.addFlashAttribute("notification", "Tạo quản trị viên thương hiệu thất bại!");
		return "redirect:/admin/brand-admin/list";
	}
	
	@RequestMapping(value = "/admin/brand-admin/{brandAccountId}/delete")
	public String deleteBrandAccount(Model model, Long brandAccountId, RedirectAttributes redirect) {
		BrandAccount brandAccount = brandAccountRepository.findByBrandAccountId(brandAccountId);
		if(brandAccount == null) redirect.addFlashAttribute("notification", "Không tìm thấy quản trị viên thương hiệu này!");
		else {
			brandAccountRepository.delete(brandAccount);
			if(brandAccountRepository.findByBrandAccountId(brandAccountId) != null) {
				redirect.addFlashAttribute("notification", "Không thể xoá quản trị viên thương hiệu này!");
			}
			else redirect.addFlashAttribute("notification", "Xoá quản trị viên thương hiệu thành công!");
		}
		return "redirect:/admin/brand-admin/list";
	}
}
