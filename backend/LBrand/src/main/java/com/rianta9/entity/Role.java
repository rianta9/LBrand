/**
 * 
 */
package com.rianta9.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @author rianta9
 * @datecreated 15 thg 4, 2021 01:31:39
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
public class Role implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "int")
	private Integer roleId;
	
	@Column(nullable = false, unique = true)
	private String roleCode;
	
	@Column(nullable = false, unique = true)
	private String roleName;
}
