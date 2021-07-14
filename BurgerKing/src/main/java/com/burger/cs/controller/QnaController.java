package com.burger.cs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnaController {

	@RequestMapping("Qna.do")
	public String MoveFranchise() {
		return "Qna";
	}
}

