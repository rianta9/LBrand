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
import javax.persistence.OneToOne;

import org.hibernate.annotations.ColumnDefault;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @author rianta9
 * @datecreated 15 thg 4, 2021 21:24:04
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
public class BrandComment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "bigint")
	private Long brandCommentId;
	
	@ManyToOne
	@JoinColumn(name = "brand_id", nullable = false)
	private Brand brand;
	
	@ManyToOne
	@JoinColumn(name = "booking_id")
	private Booking booking;
	
	@OneToOne
	@JoinColumn(name = "comment_id", nullable = false)
	private Comment comment;
	
	@Column(nullable = false)
	@ColumnDefault("10")
	private Double point;
	
	@ColumnDefault("0")
	private Integer status;
}
