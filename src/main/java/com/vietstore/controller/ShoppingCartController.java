package com.vietstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vietstore.service.CartService;

@Controller
public class ShoppingCartController {
	@Autowired
	CartService cart;
	@ResponseBody
	@RequestMapping("/cart/add/{id}")
	public Object[] add(@PathVariable("id")Integer id) {
		cart.add(id);
		Object [] info= {cart.getCount(), cart.getAmount()};
		return info;
	}

}
