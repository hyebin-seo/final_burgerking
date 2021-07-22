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

	
	// 얘는 브랜드홈 메뉴 가는 것!
	@RequestMapping("/menu_brand.do")
	public String brand_menu(String category, Model model) {
		
		if (category == null) { 
			category = "스페셜&할인팩"; 
		}
		
		// 카테고리에 해당하는 메뉴 조회(딜리버리 메뉴)
		List<MenuDTO> menuList = this.menuDao.getMenuList(category);
		
		model.addAttribute("menuList", menuList);
		model.addAttribute("category", category);
		model.addAttribute("size", menuList.size());
		
		return "menu_brand";
	}
	
	// 브랜드홈 메뉴 가는 것! getBrandMenuList() 안에서 brand, both인 메뉴들만 뽑아옵니당~
	@RequestMapping("brandMenu_list.do")
	@ResponseBody
	public HashMap<String, Object> brandMenuList(String category) {

		if (category == null) { 
			category = "스페셜&할인팩"; 
		}
		
		// 카테고리에 해당하는 메뉴 조회(브랜드 메뉴)
		List<MenuDTO> menuList = this.menuDao.getBrandMenuList(category);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("menuList", menuList);
		result.put("category", category);
		result.put("size", menuList.size());
		
		System.out.println(menuList.size());
		
		return result;
	}
	
	
	// (브랜드 메뉴) 메뉴 클릭시 메뉴디테일 페이지로 이동
	@RequestMapping("go_menuDetail.do")
	public String goMenuDetail(int menu_no, Model model) {
		
		// 1. 클릭한 메뉴 DTO
		MenuDTO menuDTO = this.menuDao.getMenuDetail(menu_no);
		// 2. 세트 메뉴가 있으면 세트 메뉴 리스트
		List<MenuSetDTO> setList = this.setDao.getMenuSetList(menu_no);
		// 3. 같은 카테고리에 있는 메뉴들의 리스트
		List<MenuDTO> sameCatMenuList = this.menuDao.getBrandMenuList(menuDTO.getMenu_cat());
		
		//System.out.println(sameCatMenuList.size());
		
		model.addAttribute("dto", menuDTO);
		model.addAttribute("setList", setList);
		model.addAttribute("catMenuList", sameCatMenuList);
		
		return "menuDetail";
	}
	
	
	// 얘는 딜리버리 메뉴 가는 거라서 getMenuList() 안에서 delivery, both인 메뉴들만 뽑아옵니당~
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
		 
		model.addAttribute("menuList", menuList); model.addAttribute("menuNoList",
		menuNoList); model.addAttribute("cat", cat);
		 
		return "menu_delivery"; 
	 }
	

	@RequestMapping("menu_list.do")
	@ResponseBody
	public HashMap<String, Object> menuList(String category) {

		System.out.println("ajax 호출됨");
		
		if (category == null) { 
			category = "스페셜&할인팩"; 
		}
		
		System.out.println(category);
		
		 
		// 카테고리에 해당하는 메뉴 조회(딜리버리 메뉴)
		List<MenuDTO> menuList = this.menuDao.getMenuList(category);
		// 세트가 있는 메뉴들의 메뉴번호 리스트
		List<String> menuNoList = this.setDao.getMenuNoListInMenuSet();
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("menuList", menuList);
		result.put("menuNoList", menuNoList);
		result.put("category", category);
		result.put("size", menuList.size());
		
		System.out.println(menuList.size());
		
		return result;
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

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("set", set);
		result.put("up", upgrade);
		result.put("menu", menu);
		System.out.println(set.getSet_name());

		return result;
	}

	@RequestMapping("menu_option.do")
	@ResponseBody
	public HashMap<String, Object> menuOption(String op, int set_no) {

		// System.out.println("옵션 카테고리 >"+ op);
		System.out.println("세트번호" + set_no);
		// 옵션 카테고리에 속하는 옵션 리스트 반환
		List<MenuOptionDTO> optionList = this.optionDao.getMenuOptionList(op);
		MenuSetDTO set = this.setDao.getSetDetail(set_no);

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("optionList", optionList);
		result.put("op", op);
		result.put("set", set);

		// System.out.println(setDto.getSet_name());

		return result;
	}

}
