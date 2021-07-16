package com.burger.menu.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.burger.menu.model.MenuDAO;
import com.burger.menu.model.MenuDTO;
import com.burger.menu.model.MenuSetDAO;
import com.burger.menu.model.MenuSetDTO;

@Controller
public class MenuController {
	
	@Autowired
	private MenuDAO menuDao;
	
	@Autowired
	private MenuSetDAO setDao;
	
	
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
		List<MenuDTO> menuList = this.menuDao.getMenuList(cat);
		// 세트가 있는 메뉴들의 메뉴번호 리스트
		List<String> menuNoList = this.setDao.getMenuNoListInMenuSet();
		
		model.addAttribute("menuList", menuList);
		model.addAttribute("menuNoList", menuNoList);
		model.addAttribute("cat", cat);
		
		return "menu_delivery";
	}
	
	
	@RequestMapping("menu_detail.do")
	@ResponseBody
	public HashMap<String, Object> menuDetail(int menu_no) {
		
		List<MenuSetDTO> setList = this.setDao.getMenuSetList(menu_no);
		
		HashMap<String, Object> result = new HashMap <String, Object>();
		result.put("setMenu", setList);
		
		return result;
	}

}
