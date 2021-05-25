/**
 * 
 */
package com.rianta9.model;

import com.rianta9.model.interf.IItemStatistic;

import lombok.Data;

/**
 * @author rianta9
 * @datecreated 21 thg 5, 2021 09:50:34
 */
@Data
public class ItemStatistic implements IItemStatistic{
	public Long brandId;
	public String brandName;
	public String avatar;
	public Long statisticValue;
}
