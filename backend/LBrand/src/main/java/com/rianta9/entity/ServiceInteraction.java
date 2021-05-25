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

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @author rianta9
 * @datecreated 15 thg 4, 2021 21:49:32
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
public class ServiceInteraction {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "bigint")
	private Long interactionId;
	
	@ManyToOne
	@JoinColumn(name = "service_id", nullable = false)
	private Service service;
	
	@ManyToOne
	@JoinColumn(name = "account_id", nullable = false)
	private Account account;
	
	private Boolean favourite;
	
	@Basic
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastViewDate;
}
