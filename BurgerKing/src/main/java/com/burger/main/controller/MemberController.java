package com.burger.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("/burger_mypage.do")
	public String mypage() {
		
		return "mypage";
	}
}
