package com.vietstore.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.vietstore.dao.UserDAO;
import com.vietstore.entity.User;
import com.vietstore.service.CookieService;

@Controller
public class AccountController {
	@Autowired
	UserDAO dao;
	@Autowired
	HttpSession session;
	@Autowired
	CookieService cookie;

	@GetMapping("/account/login")
	public String login() {
		return "acount/login";

	}

	@PostMapping("/acount/login")

	public String login(Model model, @RequestParam("id") String id, @RequestParam("pw") String pw,
			@RequestParam(value = "rm", defaultValue = "false") boolean rm) {
		
				User user = dao.findById(id);
				if(user==null) {
					
					model.addAttribute("message", "Ivalid username!");
					
					
				}
				else if(!pw.equals(user.getPassword())){
					model.addAttribute("message", "Ivalid Password!");
					
				}
				else if(!user.getActivated()) {
					
					model.addAttribute("message", "your account Inactivated!");
				}
				else {
					model.addAttribute("message", "login success !");
					
					session.setAttribute("user", user);
					//nho tai khoan bang cookie
					if(rm==true) { 
						
						cookie.create("userid", user.getId(), 30);
						cookie.create("pass", user.getPassword(), 30);
						
					}
					else {
						
						cookie.delete("userid");
						cookie.delete("pass");
						
						
					}
				}
				
						return "acount/login";

	}

}
