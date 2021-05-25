/**
 * 
 */
package com.rianta9.controller.brandadmin;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rianta9.converter.BrandConverter;
import com.rianta9.entity.Account;
import com.rianta9.entity.Brand;
import com.rianta9.entity.BrandAccount;
import com.rianta9.entity.BrandImage;
import com.rianta9.form.BrandForm;
import com.rianta9.repository.AccountRepository;
import com.rianta9.repository.BrandAccountRepository;
import com.rianta9.repository.BrandCapacityRepository;
import com.rianta9.repository.BrandImageRepository;
import com.rianta9.repository.BrandRepository;
import com.rianta9.repository.BrandServiceTypeRepository;
import com.rianta9.service.IBrandService;
import com.rianta9.util.FileUpload;

/**
 * @author rianta9
 * @datecreated 24 thg 5, 2021 16:44:02
 */

@Controller
public class ControlMyBrandController {
	@Autowired
	private BrandRepository brandRepository;

	@Autowired
	private IBrandService brandService;

	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private BrandAccountRepository brandAccountRepository;

	@Autowired
	private BrandImageRepository brandImageRepository;

	@Autowired
	private BrandCapacityRepository brandCapacityRepository;

	@Autowired
	private BrandServiceTypeRepository brandServiceTypeRepository;

	@Autowired
	private BrandConverter brandConverter;

	private void saveFailResources(RedirectAttributes redirect, BrandForm brandForm, BindingResult result) {
		redirect.addFlashAttribute("org.springframework.validation.BindingResult.brandForm", result);
		redirect.addFlashAttribute("brandForm", brandForm);
	}

	/**
	 * Kiểm tra tài khoản đăng nhập có quản lý thương hiệu brandId không
	 * 
	 * @param brandId
	 * @return
	 */
	private Brand getMyBrand() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		if (username == null)
			return null;
		Account account = accountRepository.findByUsername(username);
		if (account == null)
			return null;

		BrandAccount brandAccount = brandAccountRepository.findByAccountAccountId(account.getAccountId());
		if (brandAccount == null)
			return null;

		return brandAccount.getBrand();
	}

	@GetMapping("/brand-admin/brand/edit")
	public String viewEditBrand(Model model) {
		Brand myBrand = getMyBrand();
		if (myBrand == null)
			return "error/403";

		model.addAttribute("brandForm", brandConverter.toBrandForm(myBrand));
		model.addAttribute("listSeviceType", brandServiceTypeRepository.findAll());
		return "brand-admin/update-brand";
	}

	private String saveAvatar(MultipartFile file, HttpServletRequest request) {
		// Lưu hình ảnh vào thư mục uploads/images
		if (!file.isEmpty()) {
			System.out.println("File name:" + file.getOriginalFilename());
			System.out.println("File size:" + file.getSize());
			System.out.println("File type:" + file.getContentType());

			String imgUrl = FileUpload.uploadImage(file, request);
			System.out.println("Avatar Url:" + imgUrl);
			if (imgUrl != null)
				return imgUrl;
		}
		return null;
	}

	@PostMapping("/brand-admin/brand/edit")
	public String doEditBrand(@Valid @ModelAttribute("brandForm") BrandForm brandForm, BindingResult result, RedirectAttributes redirect,
			HttpServletRequest request) {
		System.out.println("BrandForm:" + brandForm.toString());
		
		Brand myBrand = getMyBrand();
		if(myBrand == null) return "error/403";
		
		if(result.hasErrors()) {
			saveFailResources(redirect, brandForm, result);
			redirect.addFlashAttribute("notification", "Cập nhật thất bại!");
			return "redirect:/brand-admin/brand/edit";
		}
		
		brandForm.setBrandId(myBrand.getBrandId());
		Brand brand = brandConverter.toEntity(brandForm);
		
		String imgUrl = null;
		if(!brandForm.getFileImage().isEmpty()) {
			imgUrl = saveAvatar(brandForm.getFileImage(), request);
			if(imgUrl == null) {
				result.addError(new ObjectError("saveImageFail", "Không thể lưu hình ảnh này!"));
				saveFailResources(redirect, brandForm, result);
				redirect.addFlashAttribute("notification", "Cập nhật thất bại!");
				return "redirect:/brand-admin/brand/edit";
			}
			brand.setAvatar(imgUrl);
		}
		

		System.out.println("Brand:" + brand.toString());
		brand = brandService.save(brand);
		if (brand != null) {
			redirect.addFlashAttribute("notification",
					"Cập nhật thành công!");
			// Lưu avatar vào danh sách hình ảnh của sản phẩm
			if (imgUrl != null) {
				BrandImage brandImage = new BrandImage();
				brandImage.setImageUrl(imgUrl);
				brandImage.setBrand(brand);
				brandImageRepository.saveAndFlush(brandImage);
			}
		} else {
			saveFailResources(redirect, brandForm, result);
			redirect.addFlashAttribute("notification", "Cập nhật thương hiệu thất bại!");
		}
		
		
		return "redirect:/brand-admin/brand/edit";
	}
}
