package com.rianta9.service;

import org.springframework.stereotype.Service;

import com.rianta9.entity.Account;

@Service
public interface IAccountService {
	Account save(Account account);
}
