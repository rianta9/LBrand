/**
 * 
 */
package com.rianta9.controller.api;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.rianta9.model.ApplyBrandCapacity;
import com.rianta9.model.BrandCapacityStatistic;
import com.rianta9.model.interf.IBrandCapacityStatistic;
import com.rianta9.repository.BrandCapacityRepository;

/**
 * @author rianta9
 * @datecreated 8 thg 5, 2021 21:52:03
 */

@RestController
public class BrandCapacityAPI {
	@Autowired
	private BrandCapacityRepository brandCapacityRepository;
	
	@PostMapping(value = "/api/v1/brand-capacity/brand/{brandId}")
	public ResponseEntity<List<BrandCapacityStatistic>> getListBrandCapacityStatistic(@PathVariable Long brandId, @RequestBody ApplyBrandCapacity applyCapacity){
		if(brandId == null || applyCapacity == null) return null;
		System.out.println("Apply capacity:" + applyCapacity.toString());

		List<BrandCapacityStatistic> listApplyCapacity = new ArrayList<BrandCapacityStatistic>();
		List<IBrandCapacityStatistic> listData = brandCapacityRepository.findAllByBrandIdAndDateInAndTimeIn(brandId, applyCapacity.getDateIn(), applyCapacity.getTimeIn());
		
		if(listData != null) {
			for (IBrandCapacityStatistic item : listData) {
				
				BrandCapacityStatistic statistic = new BrandCapacityStatistic();
				statistic.setBrandCapacityId(item.getBrandCapacityId());
				statistic.setFloor(item.getFloor());
				statistic.setNumberOfReserved(item.getNumberOfReserved());
				statistic.setSlot(item.getSlot());
				System.out.println(statistic.toString());
				
				listApplyCapacity.add(statistic);
			}
		}
		return new ResponseEntity<List<BrandCapacityStatistic>>(listApplyCapacity, HttpStatus.OK);
	}
	
	
}
