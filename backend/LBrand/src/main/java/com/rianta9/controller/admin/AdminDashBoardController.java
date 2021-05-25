/**
 * 
 */
package com.rianta9.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author rianta9
 * @datecreated 23 thg 4, 2021 10:02:10
 */
@Controller
public class AdminDashBoardController {
	@RequestMapping("/admin/dashboard")
	public String dashboard() {
		return "admin/dashboard";
	}
}
