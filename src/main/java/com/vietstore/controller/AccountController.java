package com.vietstore.controller;





import java.io.File;
import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.vietstore.bean.MailInfo;
import com.vietstore.dao.UserDAO;
import com.vietstore.entity.User;
import com.vietstore.service.CookieService;
import com.vietstore.service.MailService;

@Controller
public class AccountController {
	@Autowired
	UserDAO dao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	CookieService cookie;
	
	@Autowired 
	ServletContext app;

	@Autowired
	MailService mailer;

	@Autowired
	HttpServletRequest request;


	@GetMapping("/account/login")
	public String login(Model model) {
		Cookie ckid = cookie.read("userid");
		Cookie ckpw = cookie.read("pass");
		if (ckid != null) { //nếu userid khác null
			String uid = ckid.getValue();
			String pwd = ckpw.getValue();

			model.addAttribute("uid", uid);
			model.addAttribute("pwd", pwd);
		}
		return "account/login";
	}

	@PostMapping("/account/login")

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
				
				return "redirect:/home/index";

	}

	@RequestMapping("account/logout")
	public String logout(Model model) {
		
		session.removeAttribute("user");
		return "redirect:/home/index";
	}
	
	@GetMapping("account/register")
	public String register (Model model) {
		User user= new User();
		model.addAttribute("form",user);
			return "account/register";
	}
	@PostMapping("account/register")
	public String register (Model model,@ModelAttribute("form") User user,@RequestParam("photo_file")MultipartFile file) throws IllegalStateException, IOException, MessagingException {
		if(file.isEmpty()) {
			user.setPhoto("user.png");
			
		} 
		else {
			String dir= app.getRealPath("/static/images/customers");
			File f= new File(dir,file.getOriginalFilename());
			file.transferTo(f);
			user.setPhoto(f.getName());
		}
		
		
		user.setActivated(false);
		user.setAdmin(false);
		dao.create(user);
		model.addAttribute("message","register successful");
		String from="vietstoredannang@gmail.com";
		String to= user.getEmail();
		String subject ="Welcome";
		String url = request.getRequestURL().toString().replace("register", "activate/"+user.getId());
		String body="Click <a href='"+url+"'>Activate</a>";
		MailInfo mail=new MailInfo(from,to,subject,body);
		mailer.send(mail);
		return "account/register";
	}

	@GetMapping("/account/activate/{id}")
	public String activate(Model model, @PathVariable("id") String id) {
		User user = dao.findById(id);
		user.setActivated(true);
		dao.update(user);

		return "redirect:/account/login";
	}


}
