/**
 * 
 */
package com.rianta9.service.impl;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rianta9.entity.Product;
import com.rianta9.repository.ProductRepository;
import com.rianta9.service.IProductService;

/**
 * @author rianta9
 * @datecreated 19 thg 5, 2021 10:45:29
 */
@Service
public class ProductServiceImpl implements IProductService{
	@Autowired
	private ProductRepository productRepository;
	
	public Product save(Product product) {
		if(product == null) return null;
		Product data = product;
		if(product.getProductId() != null) { // update to database
			data = productRepository.findByProductId(product.getProductId());
			if(data == null) return null;
			if(product.getAvatar() != null) data.setAvatar(product.getAvatar());
			if(product.getProductName() != null) data.setProductName(product.getProductName());
			if(product.getBrand() != null) data.setBrand(product.getBrand());
			if(product.getCategory() != null) data.setCategory(product.getCategory());
			if(product.getProductType() != null) data.setProductType(product.getProductType());
			if(product.getProductUnit() != null) data.setProductUnit(product.getProductUnit());
			if(product.getPrice() != null) data.setPrice(product.getPrice());
			if(product.getSalePrice() != null) data.setSalePrice(product.getSalePrice());
			if(product.getNumberOfPeople() != null) data.setNumberOfPeople(product.getNumberOfPeople());
			if(product.getStatus() != null) data.setStatus(product.getStatus());
			if(product.getDescription() != null) data.setDescription(product.getDescription());
		}
		else {
			if(product.getDateCreated() == null) data.setDateCreated(new Date());
			if(product.getSalePrice() == null) data.setSalePrice(product.getPrice());
		}
		return productRepository.saveAndFlush(data);
	}
}
