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
import lombok.ToString;

/**
 * @author rianta9
 * @datecreated 15 thg 4, 2021 22:20:10
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
@ToString
public class BookingStatus {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "int")
	private Integer bookingStatusId;
	
	@Column(nullable = false)
	private String bookingStatusName;
}
