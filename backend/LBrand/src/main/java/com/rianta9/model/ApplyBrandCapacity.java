/**
 * 
 */
package com.rianta9.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

/**
 * @author rianta9
 * @datecreated 16 thg 5, 2021 01:53:44
 */

@Data
public class ApplyBrandCapacity {
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date dateIn;
	private String timeIn;
	private BrandCapacityStatistic capacityStatistic;
}
