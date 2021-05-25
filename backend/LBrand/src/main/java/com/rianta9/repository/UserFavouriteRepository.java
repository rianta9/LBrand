/**
 * 
 */
package com.rianta9.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestParam;

import com.rianta9.entity.UserFavourite;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 21:21:40
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "userFavourite", path = "user-favourite")
public interface UserFavouriteRepository extends JpaRepository<UserFavourite, Long>{
	List<UserFavourite> findByAccountAccountId(@RequestParam("accountId") Long accountId);
}
