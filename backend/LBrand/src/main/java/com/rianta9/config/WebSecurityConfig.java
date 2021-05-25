/**
 * 
 */
package com.rianta9.config;

import javax.sql.DataSource;

/**
 * @author rianta9
 * @datecreated 22 thg 4, 2021 23:45:49
 */
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.rianta9.security.AuthenticationProviderImpl;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private UserDetailsService userDetailsService;

	@Autowired
	private AuthenticationProviderImpl authenticationProvider;

	@Autowired
	DataSource dataSource;

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());

		// Setting không xóa password sau khi xác thực
		// Nếu xóa thì password sẽ bằng null.
		auth.eraseCredentials(false); // default : true
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable(); 
		http.authorizeRequests()
		.antMatchers("/admin/dist/**").permitAll()
		.antMatchers("/ckfinder/**").permitAll()
		.antMatchers("/admin/**").hasRole("ADMIN")
		.antMatchers("/api/v1/admin/**").hasRole("ADMIN")
		.antMatchers("/brand-admin/**").hasRole("BRAND_ADMIN")
		.antMatchers("/api/v1/brand-admin/**").hasRole("BRAND_ADMIN")
		.antMatchers(HttpMethod.POST, "/service/**")
		.access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN', 'ROLE_BRAND_ADMIN')")
		.antMatchers(HttpMethod.POST, "/brand/**")
		.access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN', 'ROLE_BRAND_ADMIN')")
		.antMatchers("/comment/**")
		.access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN', 'ROLE_BRAND_ADMIN')")
		.antMatchers("/my-account/**")
		.access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN', 'ROLE_BRAND_ADMIN')")
		.antMatchers("/favourite/**")
		.access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN', 'ROLE_BRAND_ADMIN')")
		.antMatchers("/booking-detail/**")
		.access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN', 'ROLE_BRAND_ADMIN')")
		.antMatchers("/checkout/**")
		.access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN', 'ROLE_BRAND_ADMIN')").and()
		.formLogin().loginPage("/login").usernameParameter("username").passwordParameter("password")
		.failureUrl("/login?error").and().exceptionHandling().accessDeniedPage("/403");
		
		// Cấu hình cho Logout Page.
        http.authorizeRequests().and().logout().logoutUrl("/logout").logoutSuccessUrl("/home");
		
		// Cấu hình Remember Me.
        http.authorizeRequests().and() //
        .rememberMe()
        // .alwaysRemember(true) // default : false : ko remember, phải chọn remember
        .rememberMeParameter("remember-me") // default : remember-me
        .rememberMeCookieName("RememberMeApp") // default : remember-me
        .tokenRepository(this.persistentTokenRepository()) //
        .tokenValiditySeconds(1 * 24 * 60 * 60); // custom 24h // default : 2 weeks
	}

	// Token stored in Table (Persistent_Logins)
	// Table phải tự tạo, schema trong file readme.txt
	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl db = new JdbcTokenRepositoryImpl();
		db.setDataSource(dataSource);
		return db;
	}

}
