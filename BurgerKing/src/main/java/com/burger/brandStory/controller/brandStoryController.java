package com.burger.brandStory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class brandStoryController {
	
	@RequestMapping("brandStory.do")
	public String MoveBrand() {
		return "brandStory/burgerkingStory";
	}
	
	@RequestMapping("whyBurgerking.do")
	public String MoveWhyBurgerking() {
		return "brandStory/whyBurgerking";
	}
}
