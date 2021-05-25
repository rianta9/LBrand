/**
 * 
 */
package com.rianta9.controller.web;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.rianta9.entity.Account;
import com.rianta9.entity.Comment;
import com.rianta9.repository.AccountRepository;
import com.rianta9.repository.CommentRepository;

/**
 * @author rianta9
 * @datecreated 5 thg 5, 2021 15:47:00
 */

@Controller
public class CommentController {
	@Autowired
	private AccountRepository accountRepository;
	
	@Autowired
	private CommentRepository commentRepository;
	
	
	@PostMapping(value = "/comment/parents/{id}")
	public String postComment(@PathVariable(name = "id") Long parentsId, @ModelAttribute Comment comment,
			HttpServletRequest request) {
		String error = "";
		if (comment != null && parentsId != null && comment.getCommentContent() != null) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String username = auth.getName();
			// Lấy username ra
			if (username != null) {
				Account account = accountRepository.findByUsername(username);
				if (account != null) {
					Comment parentsComment = commentRepository.getOne(parentsId);
					if(parentsComment != null) {
						System.out.println(comment.getCommentId());
						comment.setDateCreated(new Date());
						comment.setParentsComment(parentsComment);
						comment.setAccount(account);
						commentRepository.saveAndFlush(comment);
					}
				}
			}
		}
		else error = "?error";
		String referer = request.getHeader("Referer");
		if(referer != null && !error.isEmpty()) referer += error;
		if (referer == null) referer = "/home";
		return "redirect:" + referer;
	}
}
