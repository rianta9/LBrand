/**
 * 
 */
package com.rianta9.form;

import java.util.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

/**
 * @author rianta9
 * @datecreated 22 thg 4, 2021 22:25:12
 */

@Data
public class BrandForm {
	private Long brandId;
	@NotNull(message = "Tên thương hiệu không được để trống!")
	@NotEmpty(message = "Tên thương hiệu không được để trống!")
	private String brandName;
	
	@NotNull(message = "Mô tả thương hiệu không được để trống!")
	@NotEmpty(message = "Mô tả thương hiệu không được để trống!")
	private String info;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date dateCreated;
	
	@NotNull(message = "Giờ mở cửa không được để trống!")
	@DateTimeFormat(pattern = "HH:mm")
	private Date openTime;
	
	@NotNull(message = "Giờ đóng cửa không được để trống!")
	@DateTimeFormat(pattern = "HH:mm")
	private Date closeTime;
	private MultipartFile fileImage;
	private String avatar;
	
	@NotNull(message = "Loại hình dịch vụ không được để trống!")
	private Integer serviceTypeId;
	
	private String serviceTypeName;
	
	@NotNull(message = "Địa chỉ thương hiệu không được để trống!")
	@NotEmpty(message = "Địa chỉ thương hiệu không được để trống!")
	private String address;
	
	private Double positionLat;
	private Double positionLng;
	
	@NotNull(message = "Số điện thoại không được để trống!")
	@NotEmpty(message = "Số điện thoại không được để trống!")
	private String phone;
	private String tel;
	
	private Integer status;
}
