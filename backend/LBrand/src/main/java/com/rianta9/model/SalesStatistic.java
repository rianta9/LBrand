/**
 * 
 */
package com.rianta9.model;

import com.rianta9.model.interf.ISalesStatistic;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author rianta9
 * @datecreated 31 thg 3, 2021 00:55:11
 */
@Data
@NoArgsConstructor
public class SalesStatistic implements ISalesStatistic{
	private Integer month;
	private Long value;
}
