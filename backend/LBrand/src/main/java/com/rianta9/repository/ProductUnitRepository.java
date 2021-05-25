/**
 * 
 */
package com.rianta9.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.rianta9.entity.ProductUnit;

/**
 * @author rianta9
 * @datecreated 6 thg 5, 2021 22:01:42
 */

@Repository
public interface ProductUnitRepository extends JpaRepository<ProductUnit, Integer>{
	
}
