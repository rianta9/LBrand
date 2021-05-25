/**
 * 
 */
package com.rianta9.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @author rianta9
 * @datecreated 15 thg 4, 2021 21:11:00
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
public class ProductImage {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "bigint")
	private Long imageId;
	
	@Column(nullable = false)
	private String imageUrl;
	
	@ManyToOne
	@JoinColumn(nullable = false, name = "product_id")
	private Product product;
}
