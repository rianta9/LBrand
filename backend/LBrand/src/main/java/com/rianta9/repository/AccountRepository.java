/**
 * 
 */
package com.rianta9.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.rianta9.entity.Account;

/**
 * @author rianta9
 * @datecreated 16 thg 4, 2021 20:40:36
 */
@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "account", path = "account")
public interface AccountRepository extends JpaRepository<Account, Long>{
	Account findByAccountId(Long id);

	/**
	 * @param userName
	 * @return
	 */
	Account findByUsername(String username);

	/**
	 * @param username
	 * @param password
	 * @return
	 */
	@Query(value="select * from account as a where a.username=?1 and a.password=?2", nativeQuery=true)
	Account findByUsernameAndPassword(String username, String password);

	/**
	 * @param email
	 * @return
	 */
	Account findByEmail(String email);
	/**
	 * @param phone
	 * @return
	 */
	Account findByPhone(String phone);

	/**
	 * Dùng để kiểm tra email đã được sử dụng cho tài khoản khác hay chưa
	 * @param email
	 * @param accountId
	 * @return
	 */
	Account findByEmailAndAccountIdNot(String email, Long accountId);

	/**
	 * Dùng để kiểm tra số điện thoại đã được sử dụng cho tài khoản khác hay chưa
	 * @param phone
	 * @param accountId
	 * @return
	 */
	Account findByPhoneAndAccountIdNot(String phone, Long accountId);
}
