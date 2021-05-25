/**
 * 
 */
package com.rianta9.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.rianta9.entity.Product;
import com.rianta9.form.ProductForm;
import com.rianta9.repository.BrandRepository;
import com.rianta9.repository.ProductCategoryRepository;
import com.rianta9.repository.ProductRepository;
import com.rianta9.repository.ProductTypeRepository;
import com.rianta9.repository.ProductUnitRepository;

/**
 * @author rianta9
 * @datecreated 19 thg 5, 2021 09:01:48
 */

@Component
public class ProductConverter {
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private ProductCategoryRepository productCategoryRepository;
	
	@Autowired
	private ProductTypeRepository productTypeRepository;
	
	@Autowired
	private BrandRepository brandRepository;
	
	@Autowired
	private ProductUnitRepository productUnitRepository;
	
	public Product toEntity(ProductForm productForm) {
		if(productForm == null) return null;
		Product result = new Product();
		result.setProductId(productForm.getProductId());
		result.setProductName(productForm.getProductName());
		result.setBrand(brandRepository.findByBrandId(productForm.getBrandId()));
		result.setCategory(productCategoryRepository.getOne(productForm.getCategoryId()));
		result.setProductType(productTypeRepository.getOne(productForm.getProductTypeId()));
		result.setProductUnit(productUnitRepository.getOne(productForm.getProductUnitId()));
		result.setAvatar(productForm.getAvatar());
		result.setDescription(productForm.getDescription());
		result.setPrice(productForm.getPrice());
		result.setSalePrice(productForm.getSalePrice());
		result.setNumberOfPeople(productForm.getNumberOfPeople());
		result.setStatus(productForm.getStatus());
		
		return result;
	}

	/**
	 * @param product
	 * @return
	 */
	public ProductForm toProductForm(Product product) {
		ProductForm result = new ProductForm();
		result.setProductId(product.getProductId());
		result.setProductName(product.getProductName());
		result.setBrandId(product.getBrand().getBrandId());
		result.setCategoryId(product.getCategory().getCategoryId());
		result.setProductTypeId(product.getProductType().getProductTypeId());
		result.setProductUnitId(product.getProductUnit().getProductUnitId());
		result.setAvatar(product.getAvatar());
		result.setDescription(product.getDescription());
		result.setPrice(product.getPrice());
		result.setSalePrice(product.getSalePrice());
		result.setNumberOfPeople(product.getNumberOfPeople());
		result.setStatus(product.getStatus());
		return result;
	}

}
