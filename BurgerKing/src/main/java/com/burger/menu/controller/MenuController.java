package com.burger.menu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.burger.menu.model.MenuDAO;
import com.burger.menu.model.MenuDTO;

@Controller
public class MenuController {
	
	@Autowired
	private MenuDAO dao;
	
	@RequestMapping("/menu_delivery.do")
	public String delivery_menu(HttpServletRequest request,
			Model model) {
		
		String cat;
		
		if(request.getParameter("cat") != null) {
			cat = request.getParameter("cat");
		}else {
			cat = "스페셜&할인팩";
		}
		
		System.out.println(cat);
		
		// 카테고리에 해당하는 메뉴 조회(딜리버리 메뉴)
		List<MenuDTO> menuList = this.dao.getMenuList(cat);
		
		model.addAttribute("menuList", menuList);
		
		return "menu_delivery";
	}

}
