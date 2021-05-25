/**
 * 
 */
package com.rianta9.model;

import com.rianta9.model.interf.IBrandCapacityStatistic;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

/**
 * @author rianta9
 * @datecreated 8 thg 5, 2021 17:41:51
 */
@Data
@ToString
public class BrandCapacityStatistic implements IBrandCapacityStatistic{
	Long brandCapacityId;
	Integer floor;
	Integer slot;
	Integer numberOfReserved;
}
