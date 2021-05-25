/**
 * 
 */
package com.rianta9.entity;

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
 * @datecreated 15 thg 4, 2021 00:38:54
 */

@Getter
@Setter
@NoArgsConstructor
@Entity
public class BrandServiceType {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "int")
	private Integer serviceTypeId;
	
	@Column(nullable = false, unique = true)
	private String serviceTypeName;
}
