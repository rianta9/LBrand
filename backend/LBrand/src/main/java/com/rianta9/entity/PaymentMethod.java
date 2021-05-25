/**
 * 
 */
package com.rianta9.entity;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author rianta9
 * @datecreated 15 thg 4, 2021 22:18:04
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
@ToString
public class PaymentMethod {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer paymentMethodId;
	private String paymentMethodName;
	private String info;
	private String imageUrl;
}
