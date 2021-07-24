package com.burger.cs.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.burger.cs.model.NoticeDTO;
import com.burger.cs.model.PageDTO;
import com.burger.cs.model.QnaDAO;
import com.burger.cs.model.QnaDTO;

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
	
	@RequestMapping("inputRemove.do")
	public String inputRemove(MultipartHttpServletRequest request ,MultipartFile qna_image) {
		
		System.out.println(qna_image);
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
	
	@Autowired
	private QnaDAO dao;

	private int totalRecord = 0;
	private final int rowsize = 8;

	@RequestMapping("qna_list.do")
	public String list(HttpServletRequest request, Model model) {

		int page = 1; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
		}

		// DB상의 전체 게시물의 수를 확인하는 작업.
		totalRecord = this.dao.getListCount();

		PageDTO dto = new PageDTO(page, rowsize, totalRecord);

		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<QnaDTO> pageList = this.dao.getQnaList(dto);

		model.addAttribute("List", pageList);
		model.addAttribute("Paging", dto);
		
		return "qna_list";
	}
	
	
}

