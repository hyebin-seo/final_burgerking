package com.burger.cs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.burger.cs.model.FaqDAO;
import com.burger.cs.model.FaqDTO;
import com.burger.cs.model.PageDTO;

@Controller
public class FaqController {
	@Autowired
	private FaqDAO dao;

	private int totalRecord = 0;
	private final int rowsize = 7;

	@RequestMapping("faq_home.do")
	public String list(HttpServletRequest request,@RequestParam("faq_cate") String faq_cate,
			Model model) {
		
		System.out.println("faq_cate >>>" + faq_cate);
		
		if(faq_cate.equals("all")) {
			int page = 0; // 현재 페이지 변수

			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			} else {
				page = 1; // 처음으로"게시물 전체 목록" 태그를 클릭한 경우 }

				// DB상의 전체 게시물의 수를 확인하는 작업. 
				
				totalRecord = this.dao.getListCount();
				System.out.println("faq_cate ttt >>>" + faq_cate);

				PageDTO dto = new PageDTO(page, rowsize, totalRecord);

				// 페이지에 해당하는 게시물을 가져오는 메서드 호출
				List<FaqDTO> pageList = this.dao.getFaqList(dto);

				model.addAttribute("List", pageList);
				model.addAttribute("Paging", dto);
				System.out.println(dto);
				
			}
		}else {
			int page = 0; // 현재 페이지 변수

			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			} else {
				page = 1; // 처음으로"게시물 전체 목록" 태그를 클릭한 경우 }

				// DB상의 전체 게시물의 수를 확인하는 작업. 
				totalRecord = this.dao.getListcateCount(faq_cate);

				PageDTO dto = new PageDTO(page, rowsize, totalRecord, faq_cate);

				// 페이지에 해당하는 게시물을 가져오는 메서드 호출
				List<FaqDTO> pageList = this.dao.getFaqcateList(dto);

				model.addAttribute("List", pageList);
				model.addAttribute("Paging", dto);
				System.out.println("cateList >>> "+ dto);
			}
		}
		
		
		
		return "user_faq";
	}
	
	
}
