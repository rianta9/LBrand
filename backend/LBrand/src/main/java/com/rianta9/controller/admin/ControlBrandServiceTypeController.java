/**
 * 
 */
package com.rianta9.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rianta9.converter.BrandServiceTypeConverter;
import com.rianta9.dto.BrandServiceTypeDTO;
import com.rianta9.entity.BrandServiceType;
import com.rianta9.repository.BrandServiceTypeRepository;

/**
 * @author rianta9
 * @datecreated 6 thg 5, 2021 11:04:04
 */
@Controller
public class ControlBrandServiceTypeController {
	@Autowired
	private BrandServiceTypeRepository brandServiceTypeRepository;

	@Autowired
	private BrandServiceTypeConverter brandServiceTypeConverter;

	@RequestMapping("/admin/brand-service-type/list")
	public String listServiceType(Model model) {
		if (model.getAttribute("brandServiceTypeDTO") == null)
			model.addAttribute("brandServiceTypeDTO", new BrandServiceTypeDTO());
		if (model.getAttribute("brandServiceTypeDTOupdate") == null)
			model.addAttribute("brandServiceTypeDTOupdate", new BrandServiceTypeDTO());
		if (model.getAttribute("brandServiceTypeDTOdelete") == null)
			model.addAttribute("brandServiceTypeDTOdelete", new BrandServiceTypeDTO());

		model.addAttribute("listBrandServiceType", brandServiceTypeRepository.findAll());
		return "admin/list-brand-service-type";
	}

	@PostMapping("/admin/brand-service-type/new")
	public String insertServiceType(@ModelAttribute("brandServiceTypeDTO") BrandServiceTypeDTO brandServiceTypeDTO,
			RedirectAttributes redirectAttributes) {
		BrandServiceType brandServiceType = brandServiceTypeConverter.toEntity(brandServiceTypeDTO);
		// th??m m???i lo???i h??nh
		String serviceTypeNamerror = brandServiceType.getServiceTypeName();
		// ki???m tra xem t??n lo???i h??nh t???n t???i hay ch??a
		if (!brandServiceTypeRepository.findAllByServiceTypeNameIgnoreCase(brandServiceType.getServiceTypeName())
				.isEmpty()) {
			redirectAttributes.addFlashAttribute("notification", "T???o lo???i h??nh th???t b???i: ");
			redirectAttributes.addFlashAttribute("serviceTypeNamerror",
					brandServiceType.getServiceTypeName() + " ???? t???n t???i. Vui l??ng nh???p l???i!");
		} else {
			brandServiceType = brandServiceTypeRepository.save(brandServiceType);
			System.out.println("lo???i hinh m???i th??m: " + brandServiceType);
			if (brandServiceType != null) {
				redirectAttributes.addFlashAttribute("notification",
						"T???o th??nh c??ng lo???i h??nh: " + brandServiceType.getServiceTypeName());
			} else {
				redirectAttributes.addFlashAttribute("notification", "T???o lo???i h??nh th???t b???i: ");
				redirectAttributes.addFlashAttribute("serviceTypeNamerror", serviceTypeNamerror);
			}
		}
		return "redirect:/admin/brand-service-type/list";
	}

	@GetMapping("/admin/brand-service-type/{serviceTypeId}/edit")
	public String viewServiceType(@PathVariable("serviceTypeId") Integer serviceTypeId,
			RedirectAttributes redirectAttributes) {
		BrandServiceType brandServiceType = brandServiceTypeRepository.getOne(serviceTypeId);
		redirectAttributes.addFlashAttribute("brandServiceTypeDTOupdate",
				brandServiceTypeConverter.toDTO(brandServiceType));
		return "redirect:/admin/brand-service-type/list";
	}

	///
	@PostMapping("/admin/brand-service-type/{serviceTypeId}/edit")
	public String UpdateServiceTypeName(
			@ModelAttribute("brandServiceTypeDTOupdate") BrandServiceTypeDTO brandServiceTypeDTO,
			@PathVariable("serviceTypeId") Integer serviceTypeId, RedirectAttributes redirectAttributes) {
		BrandServiceType brandServiceType = brandServiceTypeConverter.toEntity(brandServiceTypeDTO);
		brandServiceTypeRepository.saveAndFlush(brandServiceType);
		redirectAttributes.addFlashAttribute("notification", "S???a th??ng tin th??nh c??ng");
		return "redirect:/admin/brand-service-type/list";
	}

	//
	@GetMapping("/admin/brand-service-type/{serviceTypeId}/delete")
	public String ViewDelete(@PathVariable("serviceTypeId") Integer serviceTypeId,
			RedirectAttributes redirectAttributes) {
		BrandServiceType brandServiceType = brandServiceTypeRepository.getOne(serviceTypeId);
		if (brandServiceType == null)
			return "error/404";
		redirectAttributes.addFlashAttribute("brandServiceTypeDTOdelete",
				brandServiceTypeConverter.toDTO(brandServiceType));
		return "redirect:/admin/brand-service-type/list";
	}

	@PostMapping("/admin/brand-service-type/{serviceTypeId}/delete")
	public String Delete(@PathVariable("serviceTypeId") Integer serviceTypeId, RedirectAttributes redirectAttributes) {
		BrandServiceType brandServiceType = brandServiceTypeRepository.getOne(serviceTypeId);
		if (brandServiceType == null)
			return "error/404";
		String name = brandServiceType.getServiceTypeName();
		brandServiceTypeRepository.deleteById(serviceTypeId);
		redirectAttributes.addFlashAttribute("notification", "X??a th??ng tin " + name + " th??nh c??ng");
		return "redirect:/admin/brand-service-type/list";
	}
}
