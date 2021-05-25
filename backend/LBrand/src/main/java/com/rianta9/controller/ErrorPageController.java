/**
 * 
 */
package com.rianta9.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author rianta9
 * @datecreated 23 thg 4, 2021 00:34:54
 */
@Controller
public class ErrorPageController {
	
	@RequestMapping("/400")
	public String badRequest() {
		return "error/400";
	}
	
	@RequestMapping("/401")
	public String unauthorized() {
		return "error/401";
	}
	
	@RequestMapping("/403")
	public String accessDenied() {
		return "error/403";
	}
	
	@RequestMapping("/404")
	public String pageNotFound() {
		return "error/404";
	}
	
	@RequestMapping("/405")
	public String methodNotAllow() {
		return "error/405";
	}
	
	@RequestMapping("/408")
	public String requestTimeOut() {
		return "error/408";
	}
	
	@RequestMapping("/500")
	public String internalServerError() {
		return "error/500";
	}
}
