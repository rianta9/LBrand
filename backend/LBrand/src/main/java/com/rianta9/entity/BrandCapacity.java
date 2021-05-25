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
 * @datecreated 15 thg 4, 2021 22:21:51
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
public class BrandCapacity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "bigint")
	private Long brandCapacityId;
	
	@ManyToOne
	@JoinColumn(name = "brand_id", nullable = false)
	private Brand brand;
	
	@Column(nullable = false)
	private Integer floor;
	
	@Column(nullable = false)
	private Integer slot;
}
