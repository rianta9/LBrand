/**
 * 
 */
package com.rianta9.controller.admin;

import java.util.Date;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rianta9.converter.BrandConverter;
import com.rianta9.dto.AccountDTO;
import com.rianta9.dto.BrandDTO;
import com.rianta9.entity.Account;
import com.rianta9.entity.Brand;
import com.rianta9.entity.BrandAccount;
import com.rianta9.entity.BrandImage;
import com.rianta9.entity.Product;
import com.rianta9.entity.ProductImage;
import com.rianta9.form.BrandForm;
import com.rianta9.form.ProductForm;
import com.rianta9.repository.BrandImageRepository;
import com.rianta9.repository.BrandRepository;
import com.rianta9.repository.BrandServiceTypeRepository;
import com.rianta9.repository.ProductImageRepository;
import com.rianta9.service.IBrandService;
import com.rianta9.util.FileUpload;

/**
 * @author rianta9
 * @datecreated 6 thg 5, 2021 10:41:22
 */

@Controller
public class ControlBrandController {
	@Autowired
	private BrandRepository brandRepository;

	@Autowired
	private IBrandService brandService;

	@Autowired
	private BrandConverter brandConverter;

	@Autowired
	private BrandServiceTypeRepository brandSeviceTypeRespository;

	@Autowired
	private BrandImageRepository brandImageRepository;

	@RequestMapping("/admin/brand/list")
	public String listBrand(Model model) {
		model.addAttribute("listBrand", brandRepository.findAll());
		return "admin/list-brand";
	}

	@GetMapping("/admin/brand/{brandId}/edit")
	public String viewEditBrand(@PathVariable("brandId") Long brandId, Model model) {
		Brand brand = brandRepository.findByBrandId(brandId);
		if (brand == null)
			return "error/404";
		model.addAttribute("brandForm", brandConverter.toBrandForm(brand));
		model.addAttribute("listSeviceType", brandSeviceTypeRespository.findAll());
		return "admin/edit-brand";
	}

	@PostMapping("/admin/brand/{brandId}/edit")
	public String doEditBrand(@Valid @ModelAttribute("brandForm") BrandForm brandForm, BindingResult result, @PathVariable Long brandId, RedirectAttributes redirect,
			HttpServletRequest request) {
		System.out.println("BrandForm:" + brandForm.toString());
		
		if(result.hasErrors()) {
			saveFailResources(redirect, brandForm, result);
			redirect.addFlashAttribute("notification", "C???p nh???t th???t b???i!");
			return "redirect:/admin/brand/" + brandId+"/edit";
		}
		
		brandForm.setBrandId(brandId);
		Brand brand = brandConverter.toEntity(brandForm);
		try {
			MultipartFile file = brandForm.getFileImage();
			System.out.println("File name:" + file.getOriginalFilename());
			System.out.println("File size:" + file.getSize());
			System.out.println("File type:" + file.getContentType());

			// L??u h??nh ???nh v??o th?? m???c uploads/images
			if (!file.isEmpty()) {
				String imgUrl = FileUpload.uploadImage(file, request);
				System.out.println("Avatar Url:" + imgUrl);
				if (imgUrl != null)
					brand.setAvatar(imgUrl); // Set url h??nh ???nh v??o account.avatar
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("Brand:" + brand.toString());
		brand = brandService.save(brand);
		if (brand != null) {
			redirect.addFlashAttribute("notification",
					"C???p nh???t th??nh c??ng!");
		} else {
			saveFailResources(redirect, brandForm, result);
			redirect.addFlashAttribute("notification", "C???p nh???t th????ng hi???u th???t b???i!");
		}
		return "redirect:/admin/brand/" + brand.getBrandId() + "/edit";
	}
	
	

	@GetMapping("/admin/brand/{brandId}/delete}")
	public String ViewDelete(@PathVariable("brandId") Long brandId, Model model) {
		Brand brand = brandRepository.findByBrandId(brandId);
		if (brand == null)
			return "error/404";
		model.addAttribute("brand", brandConverter.toDTO(brand));
		model.addAttribute("listSeviceType", brandSeviceTypeRespository.findAll());
		return "admin/delete-brand";
	}
	
	

	@PostMapping("/admin/brand/{brandId}/delete")
	public String DeleteAccount(@PathVariable Long brandId) {
		Brand brand = brandRepository.findByBrandId(brandId);
		if (brand == null)
			return "error/404";
		brandRepository.deleteById(brandId);
		return "redirect:/admin/brand/list";
	}
	
	

	@GetMapping("/admin/brand/new")
	public String ViewNew(Model model) {
		if (model.getAttribute("brandForm") == null)
			model.addAttribute("brandForm", new BrandForm());
		model.addAttribute("listSeviceType", brandSeviceTypeRespository.findAll());
		return "admin/insert-brand";
	}
	
	

	private void saveFailResources(RedirectAttributes redirect, BrandForm brandForm, BindingResult result) {
		redirect.addFlashAttribute("org.springframework.validation.BindingResult.brandForm", result);
		redirect.addFlashAttribute("brandForm", brandForm);
	}

	
	
	@PostMapping("/admin/brand/new")
	public String insertBrand(@Valid @ModelAttribute("brandForm") BrandForm brandForm, BindingResult result,
			RedirectAttributes redirect, HttpServletRequest request) {
		if (brandForm == null)
			return "redirect:/admin/brand/new";

		System.out.println("brandForm: " + brandForm.toString());

		if (result.hasErrors()) {
			saveFailResources(redirect, brandForm, result);
			redirect.addFlashAttribute("notification", "T???o m???i th???t b???i!");
			return "redirect:/admin/brand/new";
		}

		// Luu image avatar v??o th?? m???c h??nh ???nh
		if (brandForm.getFileImage().isEmpty()) {
			result.addError(new ObjectError("fileImage", "H??nh ???nh kh??ng ???????c tr???ng!"));
			saveFailResources(redirect, brandForm, result);
			redirect.addFlashAttribute("notification", "T???o m???i th???t b???i!");
			return "redirect:/admin/brand/new";
		}

		String imageUrl = FileUpload.uploadImage(brandForm.getFileImage(), request);
		if (imageUrl == null) {
			result.addError(new ObjectError("createImageFail", "L??u ???nh ?????i di???n th????ng hi???u th???t b???i!"));
			saveFailResources(redirect, brandForm, result);
			redirect.addFlashAttribute("notification", "T???o m???i th???t b???i!");
			return "redirect:/admin/brand/new";
		}
		brandForm.setAvatar(imageUrl);

		Brand brand = brandConverter.toEntity(brandForm);
		brand.setDateCreated(new Date());

		brand = brandService.save(brand);
		if (brand != null)
			redirect.addFlashAttribute("notification", "T???o m???i th??nh c??ng!");
		else {
			saveFailResources(redirect, brandForm, result);
			redirect.addFlashAttribute("notification", "T???o m???i th???t b???i!");
			return "redirect:/admin/brand/new";
		}

		// L??u avatar v??o danh s??ch h??nh ???nh c???a th????ng hi???u
		BrandImage brandImage = new BrandImage();
		brandImage.setImageUrl(imageUrl);
		brandImage.setBrand(brand);
		brandImageRepository.saveAndFlush(brandImage);
		return "redirect:/admin/brand/edit/" + brand.getBrandId();
	}
}
