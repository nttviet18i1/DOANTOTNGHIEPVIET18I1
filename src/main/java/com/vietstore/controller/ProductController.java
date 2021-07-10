package com.vietstore.controller;

import java.util.List;

import com.vietstore.dao.CategoryDAO;
import com.vietstore.dao.ProductDAO;
import com.vietstore.entity.Category;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vietstore.entity.Product;
import com.vietstore.service.CookieService;

@Controller
public class ProductController {
	@Autowired
	ProductDAO pdao;

	@Autowired
	CookieService cookie;

	@RequestMapping("/product/list-by-category/{cid}")
	public String listByCategory(Model model, @PathVariable("cid") Integer categoryId) {
		List<Product> list = pdao.findByCategoryId(categoryId);
		model.addAttribute("list", list);
		return "product/list";
	}

	@RequestMapping("/product/list-by-keywords")
	public String listByKeywords(Model model, @RequestParam("keywords") String keywords) {
		List<Product> list = pdao.findByKeywords(keywords);
		model.addAttribute("list", list);
		return "product/list";
	}

	@RequestMapping("/product/detail/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		Product prod = pdao.findById(id);
		model.addAttribute("prod", prod);
		// hàng cùng loại
		List<Product> list = pdao.findByCategoryId(prod.getCategory().getId());
		model.addAttribute("list", list);

		return "product/detail";
	}
	@ResponseBody
	@RequestMapping("/product/add-to-favo/{id}")
	public Boolean addToFavorite(Model model, @PathVariable("id") Integer id) {

		Cookie favo = cookie.read("favo");
		String value = id.toString();
		if (favo != null) {
			value = favo.getValue();

			if (!value.contains(id.toString())) {
				value += "," + id.toString();
			} else
			{
				return false;
			}
		}
		favo = cookie.create("favo", id.toString(), 30);

		return true;
	}
		}
			

