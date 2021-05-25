/**
 * 
 */
package com.rianta9.config;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.metamodel.EntityType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;
import org.springframework.http.HttpMethod;

import com.rianta9.entity.Product;
import com.rianta9.entity.ProductCategory;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 20:39:55
 */

@Configuration
public class MyDataRestConfig implements RepositoryRestConfigurer{
	private EntityManager entityManager;
	
	@Autowired
	public MyDataRestConfig(EntityManager entityManager) {
		this.entityManager = entityManager;
	}
	
	
	@Override
	public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {
		HttpMethod[] theUnsupportedActions = {HttpMethod.DELETE, HttpMethod.POST, HttpMethod.PUT};
		
		// Disable HTTP methods for product: Put, Post, Delete
		config.getExposureConfiguration()
			.forDomainType(Product.class)
			.withItemExposure((metdata, httpMethods) -> httpMethods.disable(theUnsupportedActions))
			.withCollectionExposure((methdata, httpMethods) -> httpMethods.disable(theUnsupportedActions));
		
		
		// Disable HTTP methods for product category: Put, Post, Delete
		config.getExposureConfiguration()
		.forDomainType(ProductCategory.class)
		.withItemExposure((metdata, httpMethods) -> httpMethods.disable(theUnsupportedActions))
		.withCollectionExposure((methdata, httpMethods) -> httpMethods.disable(theUnsupportedActions));
			
		// call an internal helper method
		exposeIds(config);
	}


	/**
	 * @param config
	 */
	private void exposeIds(RepositoryRestConfiguration config) {
		// expose entity ids
		
		// get a list of all entity classes from the entity manager
		Set<EntityType<?>> entities = entityManager.getMetamodel().getEntities();
		
		// create an array of the entity types
		List<Class> entityClasses = new ArrayList<Class>();
		
		// get the entity types for the entities
		for (EntityType entityType : entities) {
			entityClasses.add(entityType.getJavaType());
		}
		
		// expose the entity ids for the array of entityt/domain types
		Class[] domainTypes = entityClasses.toArray(new Class[0]);
		config.exposeIdsFor(domainTypes);
	}
}
