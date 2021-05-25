/**
 * 
 */
package com.rianta9.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.rianta9.entity.ServiceCategory;

/**
 * @author rianta9
 * @datecreated 6 thg 5, 2021 14:03:28
 */

@Repository
public interface ServiceCategoryRepository extends JpaRepository<ServiceCategory, Integer>{

}
