package com.burger.brandStory.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.burger.brandStory.model.newMenuDAO;
import com.burger.brandStory.model.newMenuDTO;
import com.burger.brandStory.model.PageDTO;
import com.burger.brandStory.model.brandTvDAO;
import com.burger.brandStory.model.brandTvDTO;

@Controller
public class brandStoryController {
	
	@Autowired
	private newMenuDAO dao;
	
	@Autowired
	private brandTvDAO tvdao;
	
	private int totalRecord = 0;
	private final int rowsize = 12;
	
	@RequestMapping("brandStory.do")
	public String MoveBrand(Model model) {
		model.addAttribute("cat", "버거킹 스토리");
		return "brandStory/burgerkingStory";
	}
	
	@RequestMapping("whyBurgerking.do")
	public String MoveWhyBurgerking(Model model) {
		model.addAttribute("cat", "WHY 버거킹");
		return "brandStory/whyBurgerking";
	}
	
	@RequestMapping("burgerkingNews.do")
	public String newMenuList(HttpServletRequest request, Model model) {
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
		List<newMenuDTO> NewMenuList = this.dao.getNewMenuList(dto);

		model.addAttribute("NewMenuList", NewMenuList);
		model.addAttribute("Paging", dto);
		model.addAttribute("cat", "버거킹 NEWS");
		
		return "brandStory/burgerkingNews";
	}
	
	@RequestMapping("BurgerkingTv.do")
	public String MoveBurgerkingTv(HttpServletRequest request, Model model) {
		
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<brandTvDTO> tvList = this.tvdao.getTvList();

		model.addAttribute("tvList", tvList);
		model.addAttribute("cat", "버거킹 NEWS");
		
		return "brandStory/burgerkingTv";
	}
	
	@RequestMapping("video.do")
	@ResponseBody
	public HashMap<String, Object> video(@RequestParam("tv_no") int tv_no, Model model) {
		
		brandTvDTO dto = new brandTvDTO();
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		dto = this.tvdao.video(tv_no);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		result.put("video",dto);
		
		System.out.println(result);
		model.addAttribute("cat", "버거킹 NEWS");
		
		return result;
	}
	
	
	
}
