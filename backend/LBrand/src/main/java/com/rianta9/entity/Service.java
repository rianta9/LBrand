/**
 * 
 */
package com.rianta9.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import com.rianta9.util.DateTimeUtil;
import com.rianta9.util.MoneyHelper;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @author rianta9
 * @datecreated 15 thg 4, 2021 00:50:01
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
public class Service {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "bigint")
	private Long serviceId;
	
	@Column(nullable = false)
	private String serviceName;
	
	@Basic
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateCreated;
	
	private String description;
	
	@ManyToOne
	@JoinColumn(name = "brand_id")
	private Brand brand;
	
	@ManyToOne
	@JoinColumn(name = "category_id")
	private ServiceCategory serviceCategory;
	
	@Column(nullable = false, columnDefinition = "money")
	private BigDecimal priceForAdult;
	
	@Column(nullable = false, columnDefinition = "money")
	private BigDecimal salePriceForAdult;
	
	@Column(nullable = false, columnDefinition = "money")
	private BigDecimal priceForChildren;
	
	@Column(nullable = false, columnDefinition = "money")
	private BigDecimal salePriceForChildren;
	
	private String avatar;
	
	@Column(nullable = false)
	@ColumnDefault("1")
	private Integer status;
	
	@OneToMany(mappedBy = "service")
	private List<ServiceImage> listServiceImage;
	
	@OneToMany(mappedBy = "service")
	private List<ServiceComment> listServiceComment;
	
	public String getStringDateCreated() {
		return DateTimeUtil.toStringType(this.dateCreated);
	}
	
	public String getStringPriceForAdult() {
		return MoneyHelper.toMoneyType(priceForAdult);
	}
	
	public String getStringSalePriceForAdult() {
		return MoneyHelper.toMoneyType(salePriceForAdult);
	}
	
	public String getStringPriceForChildren() {
		return MoneyHelper.toMoneyType(priceForChildren);
	}
	
	public String getStringSalePriceForChildren() {
		return MoneyHelper.toMoneyType(salePriceForChildren);
	}
	
	public long differencePriceAdult() {
		double differencePrice = (priceForAdult.doubleValue()-salePriceForAdult.doubleValue())/priceForAdult.doubleValue()*100;
		return Math.round(differencePrice);
	}
	
	public long differencePriceChildren() {
		double differencePrice = (priceForChildren.doubleValue()-salePriceForChildren.doubleValue())/priceForChildren.doubleValue()*100;
		return Math.round(differencePrice);
	}
	
	/**
	 * Lấy điểm đánh giá trung bình
	 * @return
	 */
	public String getAveragePoint() {
		if(this.listServiceComment == null || this.listServiceComment.isEmpty()) return "Chưa có đánh giá";
		Double avg = 0d;
		for (ServiceComment serviceComment : listServiceComment) {
			avg += serviceComment.getPoint();
		}
		return String.valueOf((double)Math.round(avg/listServiceComment.size()*10)/10);
	}
	
	public long getNumberOfReview() {
		if(listServiceComment == null) return 0;
		return this.listServiceComment.size();
	}
}
