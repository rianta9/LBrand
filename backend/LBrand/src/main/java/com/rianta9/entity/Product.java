/**
 * 
 */
package com.rianta9.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
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
 * @datecreated 15 thg 4, 2021 00:41:00
 */

@Getter
@Setter
@NoArgsConstructor
@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "bigint")
	private Long productId;
	
	@Column(nullable = false)
	private String productName;
	
	private String avatar;
	
	@ManyToOne
	@JoinColumn(name = "category_id", nullable = false)
	private ProductCategory category;
	
	@ManyToOne
	@JoinColumn(name = "product_type_id", nullable = false)
	private ProductType productType;
	
	@ManyToOne
	@JoinColumn(name = "product_unit_id")
	private ProductUnit productUnit;
	
	@Basic
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateCreated;
	
	private String description;
	
	@ManyToOne
	@JoinColumn(name = "brand_id")
	private Brand brand;
	
	@Column(nullable = false, columnDefinition = "money")
	private BigDecimal price;
	
	@Column(nullable = false, columnDefinition = "money")
	private BigDecimal salePrice;
	
	@Column(nullable = false)
	private Integer numberOfPeople;
	
	@Column(nullable = false)
	@ColumnDefault("1")
	private Integer status;
	
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	private List<ProductComment> listProductComment;
	
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	private List<ProductImage> listProductImage;
	
	public String getStringDateCreated() {
		return DateTimeUtil.toStringType(this.dateCreated);
	}
	
	public String getStringPrice() {
		return MoneyHelper.toMoneyType(price);
	}
	
	public String getStringSalePrice() {
		return MoneyHelper.toMoneyType(salePrice);
	}
	
	public long differencePricePercent() {
		double differencePrice = (price.doubleValue()-salePrice.doubleValue())/price.doubleValue()*100;
		return Math.round(differencePrice);
	}
	
	public String getAveragePoint() {
		if(this.listProductComment == null || this.listProductComment.isEmpty()) return "Chưa có đánh giá";
		Double avg = 0d;
		for (ProductComment productComment : listProductComment) {
			avg += productComment.getPoint();
		}
		return String.valueOf((double)Math.round(avg/listProductComment.size()*10)/10);
	}
	
	public long getNumberOfReview() {
		if(listProductComment == null) return 0;
		return this.listProductComment.size();
	}
	
}
