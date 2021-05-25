/**
 * 
 */
package com.rianta9.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author rianta9
 * @datecreated 28 thg 4, 2021 17:02:50
 */

@Controller
public class TestCKEditor {
	@GetMapping(value = "/admin/test-ckeditor")
	public String testCkEditor() {
		return "admin/ckeditor";
	}
	
	@PostMapping(value = "/admin/do-test-ckeditor")
	public String doTestCkEditor(Model model, @RequestParam String content) {
		System.out.println(content);
		return "redirect:/admin/test-ckeditor";
	}
	
	
}
