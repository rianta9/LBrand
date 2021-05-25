/**
 * 
 */
package com.rianta9.controller.brandadmin;

import java.util.ArrayList;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rianta9.converter.ProductConverter;
import com.rianta9.entity.Account;
import com.rianta9.entity.BrandAccount;
import com.rianta9.entity.Product;
import com.rianta9.entity.ProductImage;
import com.rianta9.form.ProductForm;
import com.rianta9.repository.AccountRepository;
import com.rianta9.repository.BrandAccountRepository;
import com.rianta9.repository.ProductCategoryRepository;
import com.rianta9.repository.ProductImageRepository;
import com.rianta9.repository.ProductRepository;
import com.rianta9.repository.ProductTypeRepository;
import com.rianta9.repository.ProductUnitRepository;
import com.rianta9.repository.ServiceRepository;
import com.rianta9.service.IProductService;
import com.rianta9.util.Constants;
import com.rianta9.util.FileUpload;

/**
 * @author rianta9
 * @datecreated 6 thg 5, 2021 14:42:07
 */

@Controller
public class ControlProductController {
	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private BrandAccountRepository brandAccountRepository;

	@Autowired
	private ProductCategoryRepository productCategoryRepository;

	@Autowired
	private ProductTypeRepository productTypeRepository;

	@Autowired
	private ProductUnitRepository productUnitRepository;

	@Autowired
	private ProductConverter productConverter;

	@Autowired
	private IProductService productService;

	@Autowired
	private ProductImageRepository productImageRepository;

	@RequestMapping(value = "/brand-admin/product/list")
	public String viewListProduct(Model model) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username != null) {
			Account account = accountRepository.findByUsername(username);
			if (account != null) {
				BrandAccount brandAccount = brandAccountRepository.findByAccountAccountId(account.getAccountId());
				if (brandAccount != null) {
					model.addAttribute("listProduct",
							productRepository.findAllByBrandBrandId(brandAccount.getBrand().getBrandId()));

				} else
					return "redirect:/403";
			} else
				return "redirect:/login";
		} else
			return "redirect:/login";
		return "brand-admin/list-product";
	}

	@GetMapping(value = "/brand-admin/product/create")
	public String viewCreateProduct(Model model) {
		if (model.getAttribute("productForm") == null)
			model.addAttribute("productForm", new ProductForm());
		model.addAttribute("listCategory", productCategoryRepository.findAll());
		model.addAttribute("listProductType", productTypeRepository.findAll());
		model.addAttribute("listProductUnit", productUnitRepository.findAll());
		model.addAttribute("listStatus", Constants.Status.getListWorkingStatus());
		return "brand-admin/create-product";
	}

	/**
	 * Lưu lại tài nguyên bị lỗi vào redirectAttributes để hiển thị lại.
	 * 
	 * @param redirect
	 * @param productForm
	 * @param result
	 */
	private void saveFailResources(RedirectAttributes redirect, ProductForm productForm, BindingResult result) {
		redirect.addFlashAttribute("org.springframework.validation.BindingResult.productForm", result);
		redirect.addFlashAttribute("productForm", productForm);
	}

	@PostMapping(value = "/brand-admin/product/create")
	public String doCreateProduct(Model model, @Valid @ModelAttribute ProductForm productForm, BindingResult result,
			HttpServletRequest request, RedirectAttributes redirect) {
		if (productForm == null)
			return "redirect:/brand-admin/product/create";

		System.out.println("ProductForm: " + productForm.toString());

		if (result.hasErrors()) {
			saveFailResources(redirect, productForm, result);
			redirect.addFlashAttribute("notification", "Tạo mới thất bại!");
			return "redirect:/brand-admin/product/create";
		}

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username == null)
			return "redirect:/login";

		Account account = accountRepository.findByUsername(username);
		if (account == null)
			return "redirect:/login";

		BrandAccount brandAccount = brandAccountRepository.findByAccountAccountId(account.getAccountId());
		if (brandAccount == null)
			return "error/403";

		// Kiểm tra trùng tên sản phẩm trong cùng một thương hiệu
		if (productRepository.findOneByBrandBrandIdAndProductNameIgnoreCase(brandAccount.getBrand().getBrandId(),
				productForm.getProductName()) != null) {
			result.addError(new ObjectError("productName", "Tên sản phẩm bị trùng trong cùng 1 thương hiệu!"));
			saveFailResources(redirect, productForm, result);
			redirect.addFlashAttribute("notification", "Tạo mới thất bại!");
			return "redirect:/brand-admin/product/create";
		}

		// Luu image avatar vào thư mục hình ảnh
		if (productForm.getFileImage().isEmpty()) {
			result.addError(new ObjectError("fileImage", "Hình ảnh không được trống!"));
			saveFailResources(redirect, productForm, result);
			redirect.addFlashAttribute("notification", "Tạo mới thất bại!");
			return "redirect:/brand-admin/product/create";
		}

		String imageUrl = FileUpload.uploadImage(productForm.getFileImage(), request);
		if (imageUrl == null) {
			result.addError(new ObjectError("createImageFail", "Lưu avatar thất bại!"));
			saveFailResources(redirect, productForm, result);
			redirect.addFlashAttribute("notification", "Tạo mới thất bại!");
			return "redirect:/brand-admin/product/create";
		}
		productForm.setAvatar(imageUrl);

		Product product = productConverter.toEntity(productForm);
		product.setBrand(brandAccount.getBrand());
		product.setDateCreated(new Date());

		product = productService.save(product);
		if (product != null)
			redirect.addFlashAttribute("notification", "Tạo mới thành công!");
		else {
			saveFailResources(redirect, productForm, result);
			redirect.addFlashAttribute("notification", "Tạo mới thất bại!");
			return "redirect:/brand-admin/product/create";
		}

		// Lưu avatar vào danh sách hình ảnh của sản phẩm
		ProductImage productImage = new ProductImage();
		productImage.setImageUrl(imageUrl);
		productImage.setProduct(product);
		productImageRepository.saveAndFlush(productImage);
		return "redirect:/brand-admin/product/create";
	}

	@GetMapping(value = "/brand-admin/product/{productId}/edit")
	public String viewUpdateProduct(Model model, @PathVariable(required = true) Long productId) {
		if (productId == null)
			return "error/404";

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username == null)
			return "redirect:/login";

		Account account = accountRepository.findByUsername(username);
		if (account == null)
			return "redirect:/login";

		BrandAccount brandAccount = brandAccountRepository.findByAccountAccountId(account.getAccountId());
		if (brandAccount == null)
			return "error/403";

		Product product = productRepository.findOneByBrandBrandIdAndProductId(brandAccount.getBrand().getBrandId(),
				productId);
		if (product == null)
			return "error/404";

		ProductForm productForm = productConverter.toProductForm(product);
		model.addAttribute("productForm", productForm);
		model.addAttribute("listCategory", productCategoryRepository.findAll());
		model.addAttribute("listProductType", productTypeRepository.findAll());
		model.addAttribute("listProductUnit", productUnitRepository.findAll());
		model.addAttribute("listStatus", Constants.Status.getListWorkingStatus());
		return "brand-admin/update-product";
	}

	@PostMapping(value = "/brand-admin/product/{productId}/edit")
	public String doUpdateProduct(Model model, @Valid @ModelAttribute ProductForm productForm, BindingResult result,
			@PathVariable(required = true) Long productId, HttpServletRequest request, RedirectAttributes redirect) {
		if (productForm == null)
			return "redirect:/brand-admin/product/" + productId + "/edit";

		System.out.println("ProductForm: " + productForm.toString());

		if (result.hasErrors()) {
			System.out.println("Lỗi validate!");
			saveFailResources(redirect, productForm, result);
			redirect.addFlashAttribute("notification", "Cập nhật thất bại!");
			return "redirect:/brand-admin/product/" + productId + "/edit";
		}

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username == null)
			return "redirect:/login";

		Account account = accountRepository.findByUsername(username);
		if (account == null)
			return "redirect:/login";

		BrandAccount brandAccount = brandAccountRepository.findByAccountAccountId(account.getAccountId());
		if (brandAccount == null)
			return "error/403";

		Product product = productRepository.findOneByBrandBrandIdAndProductId(brandAccount.getBrand().getBrandId(),
				productId);
		if (product == null)
			return "error/404";

		// Kiểm tra trùng tên sản phẩm trong cùng một thương hiệu
		if (productRepository.findOneByBrandBrandIdAndProductIdNotAndProductNameIgnoreCase(
				brandAccount.getBrand().getBrandId(), product.getProductId(), productForm.getProductName()) != null) {
			result.addError(new ObjectError("productName", "Tên sản phẩm đã bị trùng trong cùng 1 thương hiệu!"));
			saveFailResources(redirect, productForm, result);
			redirect.addFlashAttribute("notification", "Tạo mới thất bại!");
			return "redirect:/brand-admin/product/create";
		}

		// Luu image avatar vào thư mục hình ảnh
		String imageUrl = null;
		if (!productForm.getFileImage().isEmpty()) {
			imageUrl = FileUpload.uploadImage(productForm.getFileImage(), request);
			if (imageUrl == null) {
				System.out.println("Lưu avatar thất bại!");
				result.addError(new ObjectError("createImageFail", "Lưu avatar thất bại!"));
				saveFailResources(redirect, productForm, result);
				redirect.addFlashAttribute("notification", "Cập nhật thất bại!");
				return "redirect:/brand-admin/product/" + productId + "/edit";
			}
			productForm.setAvatar(imageUrl);
		}

		product = productConverter.toEntity(productForm);
		product.setBrand(brandAccount.getBrand());

		product = productService.save(product);
		if (product != null)
			redirect.addFlashAttribute("notification", "Cập nhật thành công!");
		else {
			System.out.println("Cập nhật vào database!");
			saveFailResources(redirect, productForm, result);
			redirect.addFlashAttribute("notification", "Cập nhật thất bại!");
			return "redirect:/brand-admin/product/" + productId + "/edit";
		}

		// Lưu avatar vào danh sách hình ảnh của sản phẩm
		if (imageUrl != null) {
			ProductImage productImage = new ProductImage();
			productImage.setImageUrl(imageUrl);
			productImage.setProduct(product);
			productImageRepository.saveAndFlush(productImage);
		}
		return "redirect:/brand-admin/product/" + productId + "/edit";
	}
	
	
	@GetMapping(value="/brand-admin/product/{productId}/delete")
	public String removeProduct(Model model, @PathVariable Long productId, RedirectAttributes redirect) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username == null)
			return "redirect:/login";

		Account account = accountRepository.findByUsername(username);
		if (account == null)
			return "redirect:/login";

		BrandAccount brandAccount = brandAccountRepository.findByAccountAccountId(account.getAccountId());
		if (brandAccount == null)
			return "error/403";
		
		if(productId == null) return "error/404";
		
		try {
			productRepository.deleteById(productId);
		} catch (Exception e) {
		}
		
		if(productRepository.findByProductId(productId) != null) {
			redirect.addFlashAttribute("notification", "Không thể xoá sản phẩm này vì dữ liệu được bảng khác truy xuất!");
		}
		else redirect.addFlashAttribute("notification", "Đã xoá thành công!");
		return "redirect:/brand-admin/product/list";
	}
}
