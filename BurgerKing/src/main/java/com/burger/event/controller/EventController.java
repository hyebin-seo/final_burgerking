package com.burger.event.controller;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.burger.cs.model.PageDTO;
import com.burger.event.model.EventDAO;
import com.burger.event.model.EventDTO;




@Controller
public class EventController {

	
	@Autowired
	private Event_upload upload;
	
	@Autowired
	private EventDAO dao;

	private int totalRecord = 0;
	private final int rowsize = 8;

	@RequestMapping("event_list.do")
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
		List<EventDTO> pageList = this.dao.getEventList(dto);

		model.addAttribute("List", pageList);
		model.addAttribute("Paging", dto);

		return "event_list";
	}
	
	@RequestMapping("event_write.do")
	public String write() {

		return "event_writeForm";
	}

	  
	/*
	 * @RequestMapping("event_write_ok.do") public void writeOk(EventDTO dto,
	 * HttpServletResponse response) throws IOException {
	 * 
	 * int check = this.dao.insertEvent(dto);
	 * 
	 * response.setContentType("text/html; charset-UTF-8");
	 * 
	 * PrintWriter out = response.getWriter();
	 * 
	 * if(check > 0) { out.println("<script>"); out.println("alert('이벤트 등록 완료')");
	 * out.println("location.href='event_list.do'"); out.println("</script>");
	 * 
	 * }else { out.println("<script>"); out.println("alert('이벤트 등록 실패')");
	 * out.println("history.back()"); out.println("</script>"); }
	 * 
	 * 
	 * 
	 * }
	 */
	  
	@RequestMapping("event_write_ok.do")
	public void uploadOk(MultipartHttpServletRequest mRequest, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		EventDTO dto = new EventDTO();

		String aa = request.getParameter("event_title");
		String bb = request.getParameter("event_cont");

		String ff = upload.fileUpload(mRequest);

		dto.setEvent_title(aa);
		dto.setEvent_cont(bb);
		dto.setEvent_image(ff);
		
		
		
		
		int check = this.dao.insertEvent(dto);

		response.setContentType("text/html; charset-UTF-8");

		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('이벤트 등록 완료')");
			out.println("location.href='event_list.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('이벤트 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
		}

	}
	  
	

	
	@RequestMapping("event_cont.do")
	public String content(@RequestParam("no") int event_no, @RequestParam("page") int nowPage, Model model) {

		

		// 게시글 상세내역 조회하는 메서드 호출
		EventDTO dto = this.dao.eventCont(event_no);

		model.addAttribute("Cont", dto);

		model.addAttribute("page", nowPage);

		return "event_content";

	}

	@RequestMapping("event_update.do")
	public String modify(@RequestParam("no") int event_no, @RequestParam("page") int nowPage, Model model) {

		// 게시글 상세내역 조회하는 메서드 호출
		EventDTO dto = this.dao.eventCont(event_no);

		model.addAttribute("modify", dto);

		model.addAttribute("page", nowPage);

		return "event_updateForm";

	}

	@RequestMapping("event_update_ok.do")
	public void modifyOk(EventDTO dto, @RequestParam("page") int nowPage, HttpServletResponse response)
			throws IOException {
		int check = this.dao.updateEvent(dto);
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('이벤트 수정 완료')");
			out.println("location.href='event_cont.do?no=" + dto.getEvent_no() + "&page=" + nowPage + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('이벤트 수정 실패 ')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	@RequestMapping("event_delete.do")
	public String delete(@RequestParam("no") int event_no, @RequestParam("page") int nowPage, Model model) {

		// 게시글 상세내역 조회하는 메서드 호출
		EventDTO dto = this.dao.eventCont(event_no);

		model.addAttribute("delete", dto);

		model.addAttribute("page", nowPage);

		return "event_delete";

	}

	@RequestMapping("event_delete_ok.do")
	public void deleteOk(@RequestParam("event_no") int event_no, @RequestParam("page") int nowPage,

			HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		int check = 0;

		check = this.dao.deleteEvent(event_no);
		if (check > 0) {
			this.dao.reSequence(event_no);
			out.println("<script>");
			out.println("alert('이벤트 삭제 완료')");
			out.println("location.href='event_list.do?page=" + nowPage + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('이벤트 삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	
	
	 
	
	
	 
	 
}
