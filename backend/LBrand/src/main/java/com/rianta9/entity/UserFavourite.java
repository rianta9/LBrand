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
 * @datecreated 15 thg 4, 2021 21:05:50
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
public class UserFavourite {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "bigint")
	private Long favouriteId;
	
	@ManyToOne
	@JoinColumn(name = "category_id", nullable = false)
	private ProductCategory category;
	
	@ManyToOne
	@JoinColumn(name = "account_id", nullable = false)
	private Account account;
}
