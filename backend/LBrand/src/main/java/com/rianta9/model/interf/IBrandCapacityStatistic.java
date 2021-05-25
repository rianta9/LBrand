/**
 * 
 */
package com.rianta9.model.interf;


/**
 * @author rianta9
 * @datecreated 8 thg 5, 2021 17:37:19
 */
public interface IBrandCapacityStatistic {
	Long getBrandCapacityId();
	Integer getFloor();
	Integer getSlot();
	/**
	 * Lấy số lượng chỗ ngồi đã được đặt
	 * @return
	 */
	Integer getNumberOfReserved();
}
