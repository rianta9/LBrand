/**
 * 
 */
package com.rianta9.entity;

import java.math.BigDecimal;
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

import com.rianta9.util.DateTimeUtil;
import com.rianta9.util.MoneyHelper;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @author rianta9
 * @datecreated 15 thg 4, 2021 22:00:06
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
public class DiscountCode {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "bigint")
	private Long discountCodeId;
	
	@Column(nullable = false)
	private String discountCodeName;
	
	@Column(nullable = false)
	private String code;
	
	@Column(nullable = false)
	private String info;
	
	@ManyToOne
	@JoinColumn(name = "brand_id")
	private Brand brand;
	
	@Column(columnDefinition = "money")
	private BigDecimal minPrice; // giá hoá đơn nhỏ nhất để có thể áp dụng mã này
	
	@Column(nullable = false)
	private Integer percentDiscount; // phần trăm giảm giá
	
	@Column(columnDefinition = "money")
	private BigDecimal maxDiscount; // số tiền giảm tối đa
	
	@Basic
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateCreated;
	
	@Basic
	@Column(nullable = false)
	private Date dateBegin;
	
	@Basic
	@Column(nullable = false)
	private Date dateEnd;
	
	public String getStringDateCreated() {
		return DateTimeUtil.toStringType(this.dateCreated);
	}
	
	public String getStringDateBegin() {
		return DateTimeUtil.toStringType(this.dateBegin);
	}
	
	public String getStringDateEnd() {
		return DateTimeUtil.toStringType(this.dateEnd);
	}
	
	public String getStringMinPrice() {
		return MoneyHelper.toMoneyType(minPrice);
	}
	
	public String getStringMaxDiscount() {
		return MoneyHelper.toMoneyType(maxDiscount);
	}
}
