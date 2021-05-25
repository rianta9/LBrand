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
 * @datecreated 5 thg 5, 2021 17:15:59
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
public class BrandImage {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "bigint")
	private Long imageId;
	
	@Column(nullable = false)
	private String imageUrl;
	
	@ManyToOne
	@JoinColumn(name = "brand_id")
	private Brand brand;
}
