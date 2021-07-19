package com.burger.menu.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.burger.menu.model.MenuDAO;
import com.burger.menu.model.MenuDTO;
import com.burger.menu.model.MenuSetDAO;
import com.burger.menu.model.MenuSetDTO;
import com.burger.menu.model.MenuOptionDAO;
import com.burger.menu.model.MenuOptionDTO;

@Controller
public class MenuController {

	@Autowired
	private MenuDAO menuDao;

	@Autowired
	private MenuSetDAO setDao;
	
	@Autowired
	private MenuOptionDAO optionDao;
	

	@RequestMapping("/menu_delivery.do")
	public String delivery_menu(HttpServletRequest request, Model model) {

		String cat;

		if (request.getParameter("cat") != null) {
			cat = request.getParameter("cat");
		} else {
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
		MenuDTO dto = this.menuDao.getMenuDetail(menu_no);

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("setList", setList);
		result.put("menuDetail", dto);

		return result;
	}

	
	 @RequestMapping("menu_side.do")
	 @ResponseBody
	 public HashMap<String, Object> menuSide(int set_no) {
	 
	 MenuSetDTO set = this.setDao.getSetDetail(set_no);
	 MenuDTO menu = this.menuDao.getMenuDetail(set.getMenu_no());
	 MenuSetDTO upgrade = this.setDao.getSetDetail(set_no - 1);
	 
	 HashMap<String, Object> result = new HashMap <String, Object>();
	 result.put("set", set);
	 result.put("up", upgrade);
	 result.put("menu", menu);
	 System.out.println(set.getSet_name());
	 
	 return result;
	 }
	 
	 
	 @RequestMapping("menu_option.do")
	 @ResponseBody
	 public HashMap<String, Object> menuOption(String op, int set_no) {

	 //System.out.println("옵션 카테고리 >"+ op);
	 System.out.println("세트번호"+set_no);
	 // 옵션 카테고리에 속하는 옵션 리스트 반환
	 List<MenuOptionDTO> optionList = this.optionDao.getMenuOptionList(op);
	 MenuSetDTO set = this.setDao.getSetDetail(set_no);
	 
	 
	 
	 HashMap<String, Object> result = new HashMap <String, Object>();
	 result.put("optionList", optionList);
	 result.put("op", op);
	 result.put("set", set);
	 
	 //System.out.println(setDto.getSet_name());
	 
	 return result;
	 }
	 

}
