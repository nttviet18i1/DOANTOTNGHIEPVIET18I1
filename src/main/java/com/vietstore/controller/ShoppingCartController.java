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
	@RequestMapping("/cart/view")
	public String view() {
		return "cart/view";
	}
	
	//clear
	@ResponseBody
	@RequestMapping("/cart/clear")
	public void clear() {
		cart.clear();
	}
	
	
	//remove
	@ResponseBody
	@RequestMapping("/cart/remove/{id}")
	public Object[] remove(@PathVariable("id")Integer id) {
		cart.remove(id);
		Object [] info= {cart.getCount(), cart.getAmount()};
		return info;
	}
	//update
	@ResponseBody
	@RequestMapping("/cart/update/{id}/{qty}")
	public Object[] update(@PathVariable("id")Integer id,@PathVariable("qty")Integer qty) {
		cart.update(id,qty);
		Object [] info= {cart.getCount(), cart.getAmount()};
		return info;
	}

}
