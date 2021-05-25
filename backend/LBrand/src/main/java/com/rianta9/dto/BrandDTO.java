package com.rianta9.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * @author rianta9
 * @datecreated 22 thg 4, 2021 22:13:07
 */

@Data
@NoArgsConstructor
public class BrandDTO {
	private Long brandId;

	private String brandName;
	private String info;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date dateCreated;
	@DateTimeFormat(pattern = "HH:mm")
	private Date openTime;
	@DateTimeFormat(pattern = "HH:mm")
	private Date closeTime;
	private MultipartFile fileImage;
	private String avatar;
	private int serviceTypeId;
	private String address;
	private Double positionLat;
	private Double positionLng;
	private String phone;
	private String tel;
	private Integer status;
}
