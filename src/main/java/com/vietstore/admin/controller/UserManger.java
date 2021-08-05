package com.vietstore.admin.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vietstore.dao.UserDAO;
import com.vietstore.entity.User;


@Controller
public class UserManger {
	@Autowired
	UserDAO dao;
	

	@RequestMapping("/admin/customer/index")
	public String index(Model model) {
		User entity = new User();
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/customer/index";
	}
	
	@RequestMapping("/admin/customer/edit/{id}")
	public String edit(Model model, @PathVariable("id") String id) {
		User entity = dao.findById(id);
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/customer/index";
	}
	
	@RequestMapping("/admin/customer/create")
	public String create(RedirectAttributes model, @ModelAttribute("entity") User entity) {
		dao.create(entity);
		model.addAttribute("message", "Thêm mới thành công!");
		return "redirect:/admin/customer/index";
	}
	
	@RequestMapping("/admin/customer/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") User entity) {
		dao.update(entity);
		model.addAttribute("message", "Cập nhật thành công!");
		return "redirect:/admin/customer/edit/"+entity.getId();
	}
	
	@RequestMapping(value = {"/admin/customer/delete","/admin/customer/delete/{id}"})
	public String delete(RedirectAttributes model, 
			@RequestParam(value="id", required = false) String id1, 
			@PathVariable(value="id", required = false) String id2) {
		if(id1 != null) {
			dao.delete(id1);
		}else {
			dao.delete(id2);
		}
		
		model.addAttribute("message", "Xóa thành công!");
		return "redirect:/admin/customer/index";
	}
}
