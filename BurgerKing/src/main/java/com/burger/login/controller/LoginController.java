package com.burger.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.burger.login.model.LoginDAO;
import com.burger.login.model.UserDTO;




@Controller
public class LoginController {
	
	@Autowired
	private LoginDAO dao;
	
	@RequestMapping("Login.do")
	public String MoveLogin() {
	
		return "Login";
	}
	
	@RequestMapping("join.do")
	public String join() {
		
	 return "user_join";	
	}
	
	@RequestMapping("join_Ok.do")
	public void joinOk(UserDTO dto, Model model) {
	
	dto.setUser_addr(dto.getZipcode()+dto.getUser_addr1()+dto.getUser_addr2());
		
   int check = this.dao.join(dto);
		
	
	}

}
