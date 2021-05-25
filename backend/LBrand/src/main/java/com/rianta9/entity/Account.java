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

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import com.rianta9.util.DateTimeUtil;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


/**
 * @author rianta9
 * @datecreated 15 thg 4, 2021 01:29:03
 */

@Getter
@Setter
@NoArgsConstructor
@Entity
@ToString
public class Account {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "bigint")
	private Long accountId;
	
	@Column(unique = true, nullable = false)
	private String username;
	
	@Column(nullable = false)
	private String password;
	
	@Column(nullable = false)
	private String fullName;
	
	@Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	private String gender;
	
	@Basic
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateCreated;
	
	@Column(unique = true, nullable = false)
	private String phone;
	
	@Column(unique = true)
	private String email;
	
	private String address;
	
	private String avatar;
	
	@ManyToOne
	@JoinColumn(nullable = false, name = "role_id")
	private Role role;
	
	@Column(nullable = false)
	@ColumnDefault("1")
	private Integer status;
	
	public String getStringDateCreated() {
		return DateTimeUtil.toStringType(this.dateCreated);
	}
	
	public String getContactInfo() {
		String result = fullName;
		if(address != null) result += "; " + address;
		result += "; " + phone;
		return result;
	}
}
