package com.burger.cs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.burger.cs.model.NoticeDAO;
import com.burger.cs.model.NoticeDTO;
import com.burger.cs.model.PageDTO;

@Controller
public class NoticeController {

	@Autowired
	private Notice_upload upload;
		
	@Autowired
	private NoticeDAO dao;

	private int totalRecord = 0;
	private final int rowsize = 8;

	@RequestMapping("notice_list.do")
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
		List<NoticeDTO> pageList = this.dao.getNoticeList(dto);

		model.addAttribute("List", pageList);
		model.addAttribute("Paging", dto);

		return "notice_list";
	}

	@RequestMapping("notice_write.do")
	public String write() {

		return "notice_writeForm";
	}

	
	
	/*
	 * @RequestMapping("notice_write_ok.do") public void writeOk(NoticeDTO dto,
	 * HttpServletResponse response) throws IOException {
	 * 
	 * 
	 * 
	 * int check = this.dao.insertNotice(dto);
	 * 
	 * response.setContentType("text/html; charset-UTF-8");
	 * 
	 * PrintWriter out = response.getWriter();
	 * 
	 * 
	 * 
	 * if(check > 0) { out.println("<script>"); out.println("alert('공지사항 등록 완료')");
	 * out.println("location.href='notice_list.do'"); out.println("</script>");
	 * 
	 * }else { out.println("<script>"); out.println("alert('공지사항 등록 실패')");
	 * out.println("history.back()"); out.println("</script>"); } }
	 */
	  
	  @RequestMapping("notice_write_ok.do") public void writeOk(NoticeDTO dto,
			  HttpServletResponse response) throws IOException {
			  		  	  
			  int check = this.dao.insertNotice(dto);
			  
			  response.setContentType("text/html; charset-UTF-8");
			  
			  PrintWriter out = response.getWriter();
			  		  
			  if(check > 0) { out.println("<script>");
			  out.println("alert('공지사항 등록 완료')");
			  out.println("location.href='notice_list.do'");
			  out.println("</script>");
			  
			  }else { out.println("<script>");
			  out.println("alert('공지사항 등록 실패')");
			  out.println("history.back()"); 
			  out.println("</script>"); }
		
			
			 
	  }
	  
	

	
	@RequestMapping("notice_cont.do")
	public String content(@RequestParam("no") int notice_no, @RequestParam("page") int nowPage, Model model) {

		this.dao.readCount(notice_no); // 조회 수 증가시키는 메서드 호출

		// 게시글 상세내역 조회하는 메서드 호출
		NoticeDTO dto = this.dao.noticeCont(notice_no);

		model.addAttribute("Cont", dto);

		model.addAttribute("page", nowPage);

		return "notice_content";

	}

	@RequestMapping("notice_update.do")
	public String modify(@RequestParam("no") int notice_no, @RequestParam("page") int nowPage, Model model) {

		// 게시글 상세내역 조회하는 메서드 호출
		NoticeDTO dto = this.dao.noticeCont(notice_no);

		model.addAttribute("modify", dto);

		model.addAttribute("page", nowPage);

		return "notice_updateForm";

	}

	@RequestMapping("notice_update_ok.do")
	public void modifyOk(NoticeDTO dto, @RequestParam("page") int nowPage, HttpServletResponse response)
			throws IOException {
		int check = this.dao.updateNotice(dto);
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('공지사항 수정 완료')");
			out.println("location.href='notice_cont.do?no=" + dto.getNotice_no() + "&page=" + nowPage + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('공지사항 수정 실패 ')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	@RequestMapping("notice_delete.do")
	public String delete(@RequestParam("no") int notice_no, @RequestParam("page") int nowPage, Model model) {

		// 게시글 상세내역 조회하는 메서드 호출
		NoticeDTO dto = this.dao.noticeCont(notice_no);

		model.addAttribute("delete", dto);

		model.addAttribute("page", nowPage);

		return "notice_delete";

	}

	@RequestMapping("notice_delete_ok.do")
	public void deleteOk(@RequestParam("notice_no") int notice_no, @RequestParam("page") int nowPage,

			HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		int check = 0;

		check = this.dao.deleteNotice(notice_no);
		if (check > 0) {
			this.dao.reSequence(notice_no);
			out.println("<script>");
			out.println("alert('공지사항 삭제 완료')");
			out.println("location.href='notice_list.do?page=" + nowPage + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('공지사항 삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	
	
	  //@RequestMapping("notice_search.do") public String search
	  //(@RequestParam("field") String field,@RequestParam("keyword") String keyword,
	  //Model model) {
	  
	 // List<NoticeDTO> list = this.dao.searchNoticeList(field,keyword);
	  
	 // model.addAttribute("searchList", list);
	  
	  //return "notice_search"; }
	 
	 
	
	
	  @RequestMapping("notice_search.do")
	  public String search(@RequestParam("field") String field,
	  
	  @RequestParam("keyword") String keyword,
	  
	  @RequestParam("page") int nowPage, HttpServletRequest request, Model model) {
	  	  
	  // 검색분류와 검색어에 해당하는 게시글의 갯수를 DB에서 확인하는 작업 
	 totalRecord = this.dao.searchNoticeCount(field, keyword); 
	  PageDTO dto = new PageDTO(nowPage, rowsize, totalRecord, field, keyword);
	  this.dao.searchNoticeList(dto); 
	  List<NoticeDTO> pageList = this.dao.searchNoticeList(dto);
	  model.addAttribute("field",field);
	  model.addAttribute("keyword",keyword);
	  model.addAttribute("searchList", pageList);
	  model.addAttribute("Paging", dto);
	  return "notice_search"; 
	  }
	 
	 

	
}
