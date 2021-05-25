package com.rianta9.converter;

import org.springframework.stereotype.Component;

import com.rianta9.dto.BrandServiceTypeDTO;
import com.rianta9.entity.BrandServiceType;

@Component
public class BrandServiceTypeConverter {

	public BrandServiceType toEntity(BrandServiceTypeDTO brandServiceTypeDTO) {
		if(brandServiceTypeDTO == null) 
			return null;
		BrandServiceType brandServiceType = new BrandServiceType();
		brandServiceType.setServiceTypeId(brandServiceTypeDTO.getServiceTypeId());
		brandServiceType.setServiceTypeName(brandServiceTypeDTO.getServiceTypeName());
		return brandServiceType;
	}
	
	public BrandServiceTypeDTO toDTO(BrandServiceType brandServiceType) {
		if(brandServiceType == null) return null;
		BrandServiceTypeDTO brandServiceTypeDTO = new BrandServiceTypeDTO();
		brandServiceTypeDTO.setServiceTypeId(brandServiceType.getServiceTypeId());
		brandServiceTypeDTO.setServiceTypeName(brandServiceType.getServiceTypeName());
		return brandServiceTypeDTO;
	}
}
