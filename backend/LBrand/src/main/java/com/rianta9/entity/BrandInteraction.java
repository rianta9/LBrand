/**
 * 
 */
package com.rianta9.entity;

import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.UpdateTimestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @author rianta9
 * @datecreated 15 thg 4, 2021 21:07:53
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
public class BrandInteraction {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "bigint")
	private Long interactionId;
	
	@ManyToOne
	@JoinColumn(name = "account_id", nullable = false)
	private Account account;
	
	@ManyToOne
	@JoinColumn(name = "brand_id", nullable = false)
	private Brand brand;
	
	private Boolean favourite; // yêu thích sản phẩm hay không
	
	@Basic
	@UpdateTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastViewDate;
}
