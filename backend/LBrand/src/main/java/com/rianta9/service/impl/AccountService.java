package com.rianta9.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rianta9.dto.AccountDTO;
import com.rianta9.entity.Account;
import com.rianta9.repository.AccountRepository;
import com.rianta9.service.IAccountService;

@Service
public class AccountService implements IAccountService {
	@Autowired
	private AccountRepository accountRepository;

	@Override
	public Account save(Account account) {
		Account data;
		if (account.getAccountId() == null) { // insert data
			if (checkIdentity(account.getUsername(), account.getEmail(), account.getPhone()) == false)
				return null;
			data = account;
		} else { // update data
			data = accountRepository.findByAccountId(account.getAccountId());
			if (account.getAddress() != null)
				data.setAddress(account.getAddress());
			if (account.getAvatar() != null)
				data.setAvatar(account.getAvatar());
			if (account.getEmail() != null
					&& accountRepository.findByEmailAndAccountIdNot(account.getEmail(), account.getAccountId()) == null)
				data.setEmail(account.getEmail());
			if (account.getFullName() != null)
				data.setFullName(account.getFullName());
			if (account.getPhone() != null
					&& accountRepository.findByPhoneAndAccountIdNot(account.getPhone(), account.getAccountId()) == null)
				data.setPhone(account.getPhone());
			if (account.getPassword() != null)
				data.setPassword(account.getPassword());
			if (account.getRole() != null)
				data.setRole(account.getRole());
			if (account.getStatus() != null)
				data.setStatus(account.getStatus());
		}
		return accountRepository.saveAndFlush(data);

	}
	public boolean checkIdentity(String username, String email, String phone) {
		if (username != null && accountRepository.findByUsername(username) != null)
			return false;
		if (email != null && accountRepository.findByEmail(email) != null)
			return false;
		if (phone != null && accountRepository.findByPhone(phone) != null)
			return false;
		return true;
	}
	
	public AccountDTO checkout(AccountDTO accountDTO) {
		AccountDTO rem = new AccountDTO();
		rem.setAccountId(accountDTO.getAccountId());
		rem.setRoleId(accountDTO.getRoleId());
		rem.setStatus(accountDTO.getStatus());
		return rem;
	}
}
