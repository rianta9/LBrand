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
import lombok.Setter;

/**
 * @author rianta9
 * @datecreated 6 thg 5, 2021 21:58:24
 */
@Entity
@Getter
@Setter
public class ProductUnit {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "int")
	private Integer productUnitId;
	
	@Column(nullable = false, unique = true)
	private String productUnitName;
}
