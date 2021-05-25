package com.rianta9.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.rianta9.entity.Account;
import com.rianta9.repository.AccountRepository;

@Service
public class AuthenticationProviderImpl implements AuthenticationProvider {

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
    private AccountRepository accountRepository;

	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String userName = authentication.getName();
		System.out.println("AuthenticationProviderImpl - authenticate - userName : " + userName);

		Account account = accountRepository.findByUsername(userName);
		if (account != null) {
			List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
			GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + account.getRole().getRoleCode().toUpperCase());
			grantList.add(authority);

			String password = bCryptPasswordEncoder.encode(account.getPassword());
			UserDetails userDetails = (UserDetails) new User(userName, password, grantList);

			UsernamePasswordAuthenticationToken obj = new UsernamePasswordAuthenticationToken(userDetails, null,
					grantList);
			return obj;
		} else
			throw new UsernameNotFoundException("User not found!");
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// Config các loại AuthencationToken sẽ được support.
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
