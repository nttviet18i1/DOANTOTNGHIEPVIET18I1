 package com.vietstore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vietstore.dao.ProductDAO;
import com.vietstore.entity.Product;



@Controller
public class Homecontroller {
	@Autowired
	ProductDAO pdao;
	
	@RequestMapping(value={"","home/index"})
	public String index() {
		return "home/index";
	}
	@RequestMapping("/about")
	public String about() {
		return "home/about";
	}
	@RequestMapping("/contact")
	public String contact() {
		return "home/contact";
	}
	@RequestMapping("/feedback")
	public String feedback() {
		return "home/feedback";
	}
	@RequestMapping("/faq")
	public String faq() {
		return "home/faq";
	}
	
	@ResponseBody
	@RequestMapping("/home/language")
	public void language() {

	}
}
