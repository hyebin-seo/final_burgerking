package com.burger.cs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.burger.cs.model.FaqDAO;
import com.burger.cs.model.FaqDTO;
import com.burger.cs.model.PageDTO;
import com.burger.login.model.UserDTO;

@Controller
public class FaqController {
	@Autowired
	private FaqDAO dao;

	private int totalRecord = 0;
	private final int rowsize = 7;

	@RequestMapping("faq_home.do")
	public String list(HttpServletRequest request,@RequestParam("faq_cate") String faq_cate,
			Model model) {
		HttpSession session = request.getSession();
		
		UserDTO userDto = (UserDTO) session.getAttribute("memberSession");
		
		
		
		System.out.println("123>>"+userDto);
		
		
		
		System.out.println("faq_cate >>>" + faq_cate);
		
		if(faq_cate.equals("all")) {
			int page = 0; // 현재 페이지 변수

			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			} else {
				page = 1; // 처음으로"게시물 전체 목록" 태그를 클릭한 경우 }
			}
				// DB상의 전체 게시물의 수를 확인하는 작업. 
				
				totalRecord = this.dao.getListCount();
				System.out.println("faq_cate ttt >>>" + faq_cate);

				PageDTO dto = new PageDTO(page, rowsize, totalRecord);

				// 페이지에 해당하는 게시물을 가져오는 메서드 호출
				List<FaqDTO> pageList = this.dao.getFaqList(dto);

				model.addAttribute("List", pageList);
				model.addAttribute("Paging", dto);
				model.addAttribute("cate", faq_cate);
				model.addAttribute("cat", "FAQ");
				
				System.out.println(dto);
				
		}else {
			int page = 0; // 현재 페이지 변수

			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			} else {
				page = 1; // 처음으로"게시물 전체 목록" 태그를 클릭한 경우 }
			}
				// DB상의 전체 게시물의 수를 확인하는 작업. 
				totalRecord = this.dao.getListcateCount(faq_cate);

				PageDTO dto = new PageDTO(page, rowsize, totalRecord, faq_cate);

				// 페이지에 해당하는 게시물을 가져오는 메서드 호출
				List<FaqDTO> pageList = this.dao.getFaqcateList(dto);

				model.addAttribute("List", pageList);
				model.addAttribute("Paging", dto);
				model.addAttribute("cate", faq_cate);
				model.addAttribute("cat", "FAQ");
				
				System.out.println("cateList >>> "+ dto);
			
		}
		
		
		
		return "user_faq";
	}
	
	@RequestMapping("faqWrite.do")
	public void insertFaq(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		FaqDTO dto = new FaqDTO(); 
		
		String faq_title = request.getParameter("faq_title"); 
		String faq_cont = request.getParameter("faq_cont");
		String faq_split = request.getParameter("faq_kind"); 
		
		String faq_kind = faq_split.split(",")[0];
		String faq_cate = faq_split.split(",")[1];
		
		System.out.println(faq_title);
		System.out.println(faq_cont);
		System.out.println(faq_kind);
		System.out.println(faq_cate);
		
		dto.setFaq_title(faq_title); 
		dto.setFaq_cont(faq_cont);
		dto.setFaq_kind(faq_kind);
		dto.setFaq_cate(faq_cate);
		
		int check = this.dao.insertFaq(dto); 
		
		response.setContentType("text/html; charset-UTF-8");

		PrintWriter out = response.getWriter();
		
		if (check > 0) {
			out.println("<script>");
			out.println("alert('FAQ 등록 완료')");
			out.println("location.href='faq_home.do?faq_cate=all'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('FAQ 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
	}
	
	@RequestMapping("faq_update.do")
	public String updateFaq(@RequestParam("no") int faq_no, @RequestParam("page") int nowPage, @RequestParam("category") String category, Model model) {

	
		// 게시글 상세내역 조회하는 메서드 호출
		FaqDTO dto = this.dao.getFaqCont(faq_no);

		model.addAttribute("faqUpdate", dto);
		model.addAttribute("page", nowPage);
		model.addAttribute("category", category);

		return "faq_updateForm";

	}
	
	
	@RequestMapping("faq_updateOk.do")
	public void updateOkFaq(FaqDTO dto, @RequestParam("page") int nowPage, @RequestParam("category") String category, HttpServletResponse response)
			throws IOException {
		
		int check = this.dao.updateFaq(dto);
		
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('FAQ 수정 완료')");
			out.println("location.href='faq_home.do?faq_cate="+category+"&page="+nowPage+"'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('FAQ 수정 실패 ')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("faq_delete.do")
	public String deleteFaq(@RequestParam("no") int faq_no, @RequestParam("page") int nowPage, @RequestParam("category") String category, Model model) {

		// 게시글 상세내역 조회하는 메서드 호출
		FaqDTO dto = this.dao.getFaqCont(faq_no);

		model.addAttribute("faqDelete", dto);
		model.addAttribute("page", nowPage);
		model.addAttribute("category", category);

		return "faq_deleteForm";

	}
	
	@RequestMapping("faq_deleteOk.do")
	public void deleteOkFaq(@RequestParam("faq_no") int faq_no, @RequestParam("page") int nowPage, @RequestParam("category") String category, HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		int check = 0;

		check = this.dao.deleteFaq(faq_no);
		
		if (check > 0) {
			this.dao.reFaqNo(faq_no);
			out.println("<script>");
			out.println("alert('FAQ 삭제 완료')");
			out.println("location.href='faq_home.do?faq_cate="+category+"&page="+nowPage+"'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('FAQ 삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	
}
