/**
 * 
 */
package com.rianta9.service;



import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.rianta9.entity.Brand;

/**
 * @author rianta9
 * @datecreated 27 thg 4, 2021 09:28:46
 */
@Service
public interface IBrandService {
	Brand save(Brand brand);
	void delete(Long brandId);
	Page<Brand> findAllByStatusTrue(int page, int numberOfItem);
}
