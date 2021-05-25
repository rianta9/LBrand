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
 * @datecreated 15 thg 4, 2021 21:18:55
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
public class ProductComment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "bigint")
	private Long productCommentId;
	
	@ManyToOne
	@JoinColumn(nullable = false, name = "product_id")
	private Product product;
	
	@ManyToOne
	@JoinColumn(name = "booking_product_id")
	private BookingProductDetail bookingProductDetail;
	
	@OneToOne
	@JoinColumn(nullable = false, name = "comment_id")
	private Comment comment;
	
	@Column(nullable = false)
	@ColumnDefault("10")
	private Double point;
	
	@ColumnDefault("0")
	private Integer status;
}
