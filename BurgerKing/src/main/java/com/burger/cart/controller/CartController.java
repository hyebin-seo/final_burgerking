package com.burger.cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.burger.cart.model.CartDAO;
import com.burger.cart.model.CartDTO;

@Controller
public class CartController {
	
	@Autowired
	private CartDAO cartDao;
	
	
	@RequestMapping("cart_insert.do")
	public void insertCart(CartDTO cart) {
		
		cart.setUser_id("홍길동");
		
		this.cartDao.insertCart(cart);
		
	}

}
