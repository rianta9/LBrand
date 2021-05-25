/**
 * 
 */
package com.rianta9.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.rianta9.entity.PaymentMethod;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 21:09:01
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "paymentMethod", path = "payment-method")
public interface PaymentMethodRepository extends JpaRepository<PaymentMethod, Integer>{
	PaymentMethod findOneByPaymentMethodNameContaining(String name);
}
