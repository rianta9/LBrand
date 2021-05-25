/**
 * 
 */
package com.rianta9.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.ColumnDefault;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @author rianta9
 * @datecreated 15 thg 4, 2021 21:28:51
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
public class ServiceComment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "bigint")
	private Long serviceCommentId;
	
	@ManyToOne
	@JoinColumn(name = "service_id")
	private Service service;
	
	@ManyToOne
	@JoinColumn(name = "booking_detail_id")
	private BookingServiceDetail bookingServiceDetail;
	
	@OneToOne
	@JoinColumn(name = "comment_id")
	private Comment comment;
	
	@Column(columnDefinition = "money")
	@ColumnDefault("10")
	private Double point;
	
	@ColumnDefault("0")
	private Integer status;
}
