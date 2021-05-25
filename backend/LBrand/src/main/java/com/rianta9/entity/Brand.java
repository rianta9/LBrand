/**
 * 
 */
package com.rianta9.entity;

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
 * @datecreated 15 thg 4, 2021 00:35:59
 */

@Getter
@Setter
@NoArgsConstructor
@Entity
public class Brand {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "bigint")
	private Long brandId;
	
	@Column(nullable = false)
	private String brandName;
	private String info;
	
	@Basic
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateCreated;
	
	@Basic
	@Temporal(TemporalType.TIME)
	private Date openTime;
	
	@Basic
	@Temporal(TemporalType.TIME)
	private Date closeTime;
	
	@Column(nullable = false)
	private String avatar;
	
	
	@ManyToOne
	@JoinColumn(name = "service_type_id")
	private BrandServiceType serviceType;
	
	private String address;
	
	private Double positionLat;
	private Double positionLng;
	
	private String phone;
	private String tel;
	
	@ColumnDefault("1")
	private Integer status;
	
	@OneToMany(mappedBy = "brand")
	private List<Product> listProduct;
	
	@OneToMany(mappedBy = "brand")
	private List<Service> listService;
	
	@OneToMany(mappedBy = "brand")
	private List<BrandComment> listBrandComment;
	
	@OneToMany(mappedBy = "brand")
	private List<BrandImage> listBrandImage;
	
	@OneToMany(mappedBy = "brand")
	private List<BrandCapacity> listCapacity;
	
	
	public String getStringOpenTime() {
		return DateTimeUtil.toStringTimeTypeHHmm(this.openTime);
	}
	
	public String getStringCloseTime() {
		return DateTimeUtil.toStringTimeTypeHHmm(this.closeTime);
	}
	public String getStringDateCreated() {
		return DateTimeUtil.toStringTimeTypeHHmm(this.dateCreated);
	}
	/**
	 * Lấy điểm đánh giá trung bình
	 * @return
	 */
	public String getAveragePoint() {
		if(this.listBrandComment == null || this.listBrandComment.isEmpty()) return "Chưa có đánh giá";
		Double avg = 0d;
		for (BrandComment brandComment : listBrandComment) {
			avg += brandComment.getPoint();
		}
		return String.valueOf((double)Math.round(avg/listBrandComment.size()*10)/10);
	}
	
	public long getNumberOfReview() {
		if(listBrandComment == null) return 0;
		return this.listBrandComment.size();
	}
	
	public String getMinProductPrice() {
		if(listProduct == null || listProduct.isEmpty()) return MoneyHelper.toMoneyType(0l);
		Long minPrice = Long.MAX_VALUE;
		for (Product product : listProduct) {
			minPrice = Math.min(minPrice, product.getPrice().longValue());
		}
		
		for(Service service: listService) {
			minPrice = Math.min(minPrice, service.getSalePriceForAdult().longValue());
		}
		return MoneyHelper.toMoneyType(minPrice);
	}
	
	public String getMaxProductPrice() {
		if(listProduct == null || listProduct.isEmpty()) return MoneyHelper.toMoneyType(0l);
		Long maxPrice = 0l;
		for (Product product : listProduct) {
			maxPrice = Math.max(maxPrice, product.getPrice().longValue());
		}
		
		for(Service service: listService) {
			maxPrice = Math.max(maxPrice, service.getSalePriceForAdult().longValue());
		}
		return MoneyHelper.toMoneyType(maxPrice);
	}
}
