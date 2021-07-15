package com.burger.cs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FranchiseController {
	
	@RequestMapping("Franchise.do")
	public String MoveFranchise() {
		return "user_franchise";
	}
	
	@RequestMapping("Franchise_popup.do")
	public String MoveFranchisepop() {
		return "franchisePopup";
	}
}
