/**
 * 
 */
package com.rianta9.service;

import org.springframework.stereotype.Service;

import com.rianta9.entity.Product;

/**
 * @author rianta9
 * @datecreated 19 thg 5, 2021 10:55:52
 */
@Service
public interface IProductService {
	Product save(Product product);
}
