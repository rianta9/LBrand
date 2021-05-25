/**
 * 
 */
package com.rianta9.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.rianta9.entity.Role;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 21:16:18
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "role", path = "role")
public interface RoleRepository extends JpaRepository<Role, Integer>{

}
