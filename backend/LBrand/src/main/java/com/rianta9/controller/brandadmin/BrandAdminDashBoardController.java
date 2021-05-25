/**
 * 
 */
package com.rianta9.controller.brandadmin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author rianta9
 * @datecreated 23 thg 4, 2021 10:02:10
 */
@Controller
public class BrandAdminDashBoardController {
	@RequestMapping("/brand-admin/dashboard")
	public String dashboard() {
		return "brand-admin/dashboard";
	}
}
