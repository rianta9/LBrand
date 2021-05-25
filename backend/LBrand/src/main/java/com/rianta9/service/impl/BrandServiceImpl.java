/**
 * 
 */
package com.rianta9.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.rianta9.entity.Brand;
import com.rianta9.repository.BrandRepository;
import com.rianta9.service.IBrandService;

/**
 * @author rianta9
 * @datecreated 27 thg 4, 2021 09:33:05
 */

@Service
public class BrandServiceImpl implements IBrandService{

	@Autowired
	private BrandRepository brandRepository;
	
	
	@Override
	public Brand save(Brand brand) {
		Brand data;
		if(brand.getBrandId() != null) { // update
			data = brandRepository.getOne(brand.getBrandId());
			if(brand.getBrandName() != null) data.setBrandName(brand.getBrandName());
			if(brand.getAddress() != null) data.setAddress(brand.getAddress());
			if(brand.getPhone() != null) data.setPhone(brand.getPhone());
			if(brand.getTel() != null) data.setTel(brand.getTel());
			if(brand.getPositionLat() != null) data.setPositionLat(brand.getPositionLat());
			if(brand.getPositionLng() != null) data.setPositionLng(brand.getPositionLng());
			if(brand.getInfo() != null) data.setInfo(brand.getInfo());
			if(brand.getServiceType() != null) data.setServiceType(brand.getServiceType());
			if(brand.getAvatar() != null) data.setAvatar(brand.getAvatar());
			if(brand.getOpenTime() != null) data.setOpenTime(brand.getOpenTime());
			if(brand.getCloseTime() != null) data.setCloseTime(brand.getCloseTime());
			if(brand.getStatus() != null) data.setStatus(brand.getStatus());
		}
		else data = brand;
		return brandRepository.saveAndFlush(data);
	}

	@Override
	public void delete(Long brandId) {
		brandRepository.deleteById(brandId);
	}

	@Override
	public Page<Brand> findAllByStatusTrue(int page, int numberOfItem) {
		return brandRepository.findAllByStatus(1, PageRequest.of(page, numberOfItem));
	}

}
