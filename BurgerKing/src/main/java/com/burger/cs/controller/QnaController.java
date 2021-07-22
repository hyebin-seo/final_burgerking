package com.burger.cs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnaController {

	@RequestMapping("Qna.do")
	public String qna(Model model) {
		model.addAttribute("cat", "문의");
		return "Qna";
	}
	
	@RequestMapping("qna_popup.do")
	public String qna_popup() {
		return "qna_popup";
	}
	
	@RequestMapping("qna_ok.do")
	public String qna_ok() {
		return "qna_ok";
	}
	
	@RequestMapping("qna_storefind.do")
	public String qnaStorefind() {
		return "qna_storefind";
	}
}

