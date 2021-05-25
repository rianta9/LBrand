/**
 * 
 */
package com.rianta9.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;



import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author rianta9
 * @datecreated 15 thg 3, 2021 13:26:34
 */

@Data
@NoArgsConstructor
public class AccountDTO {
	private Long accountId;
	private String username;
	private String fullName;
	private String phone;
	private String address;
	private MultipartFile fileImage;
	
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	private String gender;
	private Integer roleId;
	private String roleName;
	private String email;
	private Integer status;
	private String password;
	private Date dateCreated;
	private String avatar;
	
	
}
