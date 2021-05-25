package com.rianta9.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.rianta9.dto.BrandDTO;
import com.rianta9.entity.Brand;
import com.rianta9.form.BrandForm;
import com.rianta9.repository.BrandServiceTypeRepository;

/**
 * @author rianta9
 * @datecreated 22 thg 4, 2021 22:30:40
 */
@Component
public class BrandConverter {
	@Autowired
	private BrandServiceTypeRepository brandServiceTypeRepository;

	public BrandDTO toDTO(Brand brand) {
		if (brand == null)
			return null;
		BrandDTO result = new BrandDTO();
		result.setBrandId(brand.getBrandId());
		result.setBrandName(brand.getBrandName());
		result.setAvatar(brand.getAvatar());
		result.setOpenTime(brand.getOpenTime());
		result.setCloseTime(brand.getCloseTime());
		result.setDateCreated(brand.getDateCreated());
		result.setPhone(brand.getPhone());
		result.setInfo(brand.getInfo());
		result.setPositionLat(brand.getPositionLat());
		result.setPositionLng(brand.getPositionLng());
		result.setServiceTypeId(brand.getServiceType().getServiceTypeId());
		result.setStatus(brand.getStatus());
		result.setTel(brand.getTel());
		result.setAddress(brand.getAddress());
		return result;
	}

	public Brand toEntity(BrandDTO brandDTO) {
		if (brandDTO == null)
			return null;

		Brand result = new Brand();
		result.setBrandId(brandDTO.getBrandId());
		result.setBrandName(brandDTO.getBrandName());
		result.setAvatar(brandDTO.getAvatar());
		result.setOpenTime(brandDTO.getOpenTime());
		result.setCloseTime(brandDTO.getCloseTime());
		result.setDateCreated(brandDTO.getDateCreated());
		result.setPhone(brandDTO.getPhone());
		result.setInfo(brandDTO.getInfo());
		result.setPositionLat(brandDTO.getPositionLat());
		result.setPositionLng(brandDTO.getPositionLng());
		result.setServiceType(brandServiceTypeRepository.getOne(brandDTO.getServiceTypeId()));
		result.setStatus(brandDTO.getStatus());
		result.setTel(brandDTO.getTel());
		result.setAddress(brandDTO.getAddress());
		return result;
	}

	public Brand toEntity(BrandForm brandForm) {
		if (brandForm == null)
			return null;

		Brand result = new Brand();
		result.setBrandId(brandForm.getBrandId());
		result.setBrandName(brandForm.getBrandName());
		result.setAvatar(brandForm.getAvatar());
		result.setOpenTime(brandForm.getOpenTime());
		result.setCloseTime(brandForm.getCloseTime());
		result.setDateCreated(brandForm.getDateCreated());
		result.setPhone(brandForm.getPhone());
		result.setInfo(brandForm.getInfo());
		result.setPositionLat(brandForm.getPositionLat());
		result.setPositionLng(brandForm.getPositionLng());
		result.setServiceType(brandServiceTypeRepository.getOne(brandForm.getServiceTypeId()));
		result.setStatus(brandForm.getStatus());
		result.setTel(brandForm.getTel());
		result.setAddress(brandForm.getAddress());
		
		return result;
	}
	
	public BrandForm toBrandForm(Brand brand) {
		if (brand == null)
			return null;

		BrandForm result = new BrandForm();
		result.setBrandId(brand.getBrandId());
		result.setBrandName(brand.getBrandName());
		result.setAvatar(brand.getAvatar());
		result.setOpenTime(brand.getOpenTime());
		result.setCloseTime(brand.getCloseTime());
		result.setDateCreated(brand.getDateCreated());
		result.setPhone(brand.getPhone());
		result.setInfo(brand.getInfo());
		result.setPositionLat(brand.getPositionLat());
		result.setPositionLng(brand.getPositionLng());
		result.setServiceTypeId(brand.getServiceType().getServiceTypeId());
		result.setServiceTypeName(brand.getServiceType().getServiceTypeName());
		result.setTel(brand.getTel());
		result.setAddress(brand.getAddress());
		result.setStatus(brand.getStatus());
		
		return result;
	}
}
