/**
 * 
 */
package com.rianta9.entity;

import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import com.rianta9.util.DateTimeUtil;

import lombok.Data;

/**
 * @author rianta9
 * @datecreated 1 thg 5, 2021 21:26:15
 */

@Entity
@Data
public class Banner {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer bannerId;
	
	@ManyToOne
	@JoinColumn(name = "brand_id")
	private Brand brand;
	
	private String title;
	private String description;
	private String imageUrl;
	private String linkContent;
	
	@Basic
	@Temporal(TemporalType.DATE)
	@CreationTimestamp
    @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateCreated;
	
	@Basic
	@Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateBegin;
	
	@Basic
	@Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateEnd;
	
	public String getStringDateCreated() {
		return DateTimeUtil.toStringType(dateCreated);
	}
	
	public String getStringDateBegin() {
		return DateTimeUtil.toStringType(dateBegin);
	}
	
	
	public String getStringDateEnd() {
		return DateTimeUtil.toStringType(dateEnd);
	}
	
	public String getStatus() {
		String result = "Chưa hiển thị";
		Date currentDate = new Date();
		if(dateEnd.compareTo(currentDate) >= 0 && dateBegin.compareTo(currentDate) <= 0) result = "Đang hiển thị";
		else if(dateEnd.compareTo(currentDate) < 0) result = "Đã kết thúc";
		return result;
	}
}
