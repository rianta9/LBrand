/**
 * 
 */
package com.rianta9.dto;

import java.io.Serializable;
import java.util.Set;

import com.rianta9.entity.Role;

import lombok.Data;

/**
 * @author rianta9
 * @datecreated 23 thg 4, 2021 00:01:13
 */

@Data
public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	private Long accountId;
	private String username;
	private String password;
	private String fullName;
	private String email;
	private String phone;
	private String roleCode;
}
