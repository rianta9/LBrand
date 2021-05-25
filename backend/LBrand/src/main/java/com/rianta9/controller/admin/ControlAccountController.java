/**
 * 
 */
package com.rianta9.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rianta9.converter.AccountConverter;
import com.rianta9.dto.AccountDTO;
import com.rianta9.entity.Account;
import com.rianta9.repository.AccountRepository;
import com.rianta9.repository.RoleRepository;
import com.rianta9.service.impl.AccountService;
import com.rianta9.util.Constants;
import com.rianta9.util.FileUpload;

/**
 * @author rianta9
 * @datecreated 6 thg 5, 2021 09:56:37
 */

@Controller
public class ControlAccountController {

	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private RoleRepository roleRespository;

	@Autowired
	private AccountService accountService;

	@Autowired
	private AccountConverter accountConverter;

	@RequestMapping("/admin/account/list")
	public String listAccount(Model model) {
		model.addAttribute("listAccount", accountRepository.findAll());
		model.addAttribute("listStatus", Constants.StatusAccount.getListStatus());
		return "admin/list-account";
	}

	@GetMapping("/admin/account/new")
	public String addAccount(Model model) {
		if(model.getAttribute("account") == null) model.addAttribute("account", new AccountDTO());
		else System.out.println("DDMM");
		model.addAttribute("listRole", roleRespository.findAll());
		model.addAttribute("listStatus", Constants.StatusAccount.getListStatus());

		model.addAttribute("listGender", Constants.Gender.getListGender());
		return "admin/insert-account";
	}

	@PostMapping("/admin/account/new")
	public String doInsert(Model model, @ModelAttribute("account") AccountDTO accountDTO,
			RedirectAttributes redirectAttributes, HttpServletRequest servletRequest) {
		System.out.println("AccountDTO:" + accountDTO.toString());
		Account account = accountConverter.toEntity(accountDTO);

		try {
			MultipartFile file = accountDTO.getFileImage();
			System.out.println("File name:" + file.getOriginalFilename());
			System.out.println("File size:" + file.getSize());
			System.out.println("File type:" + file.getContentType());

			// Lưu hình ảnh vào thư mục uploads/images
			String imgUrl = FileUpload.uploadImage(file, servletRequest);
			System.out.println("Avatar Url:" + imgUrl);
			if (imgUrl != null)
				account.setAvatar(imgUrl); // Set url hình ảnh vào account.avatar
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("Account:" + account.toString());
		boolean check = true;
		try {
			// kiểm tra username đã tồn tại hay chưa
			if (accountRepository.findByUsername(account.getUsername()) != null) {
				redirectAttributes.addFlashAttribute("usererror", "Tên đăng nhập đã tồn tại! Vui lòng nhập tên khác!");
				check = false;
			}
			// kiểm tra email đã tồn tại hay chưa
			if (accountRepository.findByEmail(account.getEmail()) != null) {
				redirectAttributes.addFlashAttribute("emailerror", "Email đã tồn tại! Vui lòng nhập Email khác!");
				check = false;
			}
			// kiểm tra sdt đã tồn tại hay chưa
			if (accountRepository.findByPhone(account.getPhone()) != null) {
				redirectAttributes.addFlashAttribute("phoneerror",
						"Số điên thoại đã tồn tại! Vui lòng nhập Số điên thoại khác!");
				check = false;
			}
			// nếu đủ điều kiện mới thêm
			if (check == true) {
				account = accountService.save(account);
				if (account != null) {
					redirectAttributes.addFlashAttribute("notification",
							"Tạo thành công tài khoản: " + account.getUsername());
				} else {
					redirectAttributes.addFlashAttribute("account", accountDTO);
					redirectAttributes.addFlashAttribute("notification", "Tạo tài khoản thất bại!");
				}
					
			}
			else { 
				redirectAttributes.addFlashAttribute("notification", "Tạo tài khoản thất bại!");
				redirectAttributes.addFlashAttribute("account", accountDTO);
				}
		} catch (Exception e) {
			return "error/500";
		}
		return "redirect:/admin/account/new";
	}

	@GetMapping("/admin/account/{id}/edit")
	public String viewAccount(@PathVariable(name = "id") Long accountId, Model model) {
		Account account = accountRepository.findByAccountId(accountId);
		if (account == null)
			return "error/404";
		model.addAttribute("account", accountConverter.toDTO(account));
		model.addAttribute("listRole", roleRespository.findAll());
		model.addAttribute("listStatus", Constants.StatusAccount.getListStatus());
		return "admin/edit-account";
	}

	@PostMapping("/admin/account/{accountId}/edit")
	public String updateAccount(@ModelAttribute("account") AccountDTO accountDTO, @PathVariable Long accountId,
			BindingResult result) {
		System.out.println(accountDTO.toString());
		accountDTO = accountService.checkout(accountDTO);

		Account account = accountConverter.toEntity(accountDTO);
		System.out.println(account.getRole().getRoleName());
		if (account.getRole().getRoleName().equalsIgnoreCase("admin"))
			account.setAvatar("image/account/avt1.jpg");
		else
			account.setAvatar("image/account/avt2.jpg");
		account = accountService.save(account);
		return "redirect:/admin/account/" + account.getAccountId() + "/edit";
	}
	

	@GetMapping("/admin/account/{accountId}/delete")
	public String viewDeleteAccount(@PathVariable Long accountId, Model model) {
		Account account = accountRepository.findByAccountId(accountId);
		if (account == null)
			return "error/404";
		model.addAttribute("account", accountConverter.toDTO(account));
		model.addAttribute("listRole", roleRespository.findAll());
		model.addAttribute("listStatus", Constants.StatusAccount.getListStatus());
		return "admin/delete-account";

	}

	@PostMapping("/admin/account/{accountId}/delete")
	public String DeleteAccount(@PathVariable Long accountId) {
		Account account = accountRepository.findByAccountId(accountId);
		if (account == null)
			return "error/404";
		accountRepository.deleteById(accountId);
		return "redirect:/admin/account/list";
	}
}
