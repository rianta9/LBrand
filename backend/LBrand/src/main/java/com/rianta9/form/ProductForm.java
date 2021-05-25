/**
 * 
 */
package com.rianta9.form;

import java.math.BigDecimal;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

/**
 * @author rianta9
 * @datecreated 19 thg 5, 2021 08:48:49
 */

@Data
public class ProductForm {
	Long productId;
	
	@NotNull(message = "Trường này là bắt buộc!")
	@NotEmpty(message = "Trường này là bắt buộc!")
	@Size(max = 255, message = "Chỉ nhập tối đa 255 ký tự!")
	String productName;
	
	String avatar; // avatar image url
	private MultipartFile fileImage; // avatar image file
	
	@NotNull(message = "Trường này là bắt buộc!")
	private Integer categoryId;
	private String categoryName;
	
	@NotNull(message = "Trường này là bắt buộc!")
	private Integer productTypeId;
	private String productTypeName;
	
	@NotNull(message = "Trường này là bắt buộc!")
	private Integer productUnitId;
	private String productUnitName;
	
	@NotNull(message = "Thông tin mô tả sản phẩm này là bắt buộc!")
	@NotEmpty(message = "Thông tin mô tả sản phẩm là bắt buộc!")
	private String description;
	
	private Long brandId;
	
	@NotNull(message = "Trường này là bắt buộc!")
	@Min(value = 0, message="Số tiền không được âm!")
	private BigDecimal price;
	
	@Min(value = 0, message="Số tiền không được âm!")
	private BigDecimal salePrice;
	
	@Min(value = 1, message="Số người phải lớn hơn 0!")
	private Integer numberOfPeople;
	
	@NotNull(message = "Trường này là bắt buộc!")
	private Integer status;
}
