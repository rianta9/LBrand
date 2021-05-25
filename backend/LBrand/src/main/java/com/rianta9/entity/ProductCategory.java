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
 * @datecreated 15 thg 4, 2021 00:44:10
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
public class ProductCategory {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "int")
	private Integer categoryId;
	
	@Column(nullable = false, unique = true)
	private String categoryCode;
	
	@Column(nullable = false, unique = true)
	private String categoryName;
}
