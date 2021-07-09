package com.burger.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	
	@RequestMapping("/mypage_main.do")
	public String main() {
		
		return "mypage_main";
	}
	
	
	@RequestMapping("/mypage_searchAddr.do")
	public String searchAddr() {
		
		return "mypage_searchAddr";
	}
	
	
}
