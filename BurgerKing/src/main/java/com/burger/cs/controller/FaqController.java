package com.burger.cs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FaqController {
	@RequestMapping("faq_home.do")
	   public String moveFaq() {      
	      return "user_faq";
	   }
}
