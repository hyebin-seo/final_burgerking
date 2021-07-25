package com.burger.cs.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	
	@Autowired
	private Qna_upload upload;
	

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
		model.addAttribute("cat", "공지사항");

		return "qna_list";
	}
	
	@RequestMapping("qna_cont.do")
	public String content(@RequestParam("no") int qna_no, @RequestParam("page") int nowPage, Model model) {

		

		// 게시글 상세내역 조회하는 메서드 호출
		QnaDTO dto = this.dao.qnaCont(qna_no);

		model.addAttribute("Cont", dto);

		model.addAttribute("page", nowPage);

		return "qna_content";

	}
	
	@RequestMapping("qna_write_ok.do")
	public void uploadOk(MultipartHttpServletRequest mRequest, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		QnaDTO dto = new QnaDTO();

		
		
		  String aa = request.getParameter("qna_name");
		  String bb = request.getParameter("qna_phone");
		  String cc = request.getParameter("qna_mail"); 
		  String dd = request.getParameter("qna_field"); 
		  String ee = request.getParameter("qna_store"); 
		  String ff = request.getParameter("qna_title"); 
		  String gg = request.getParameter("qna_cont");
		 
		 

		
		/*
		 * String aa = "길동"; String bb = "01012345678"; String cc = "asdf@naver.com";
		 * String dd = "칭찬"; String ee = "용산점"; String ff = "제목입니다"; String gg =
		 * "내용입니다.";
		 */
		
		/*
		 * System.out.println(aa); System.out.println(bb); System.out.println(cc);
		 * System.out.println(dd); System.out.println(ee); System.out.println(ff);
		 * System.out.println(gg);
		 */
		 
		String zz = upload.fileUpload(mRequest);
	//	String zz = "파일.";

		dto.setQna_name(aa);		
		dto.setQna_phone(bb);
		dto.setQna_mail(cc);
		dto.setQna_field(dd);
		dto.setQna_store(ee);		
		dto.setQna_title(ff);		
		dto.setQna_cont(gg);
		
		dto.setQna_file(zz);
		
		
		System.out.println(dto);
		
		int check = this.dao.insertQna(dto);

		response.setContentType("text/html; charset-UTF-8");

		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('Q&A 등록 완료')");
			out.println("location.href='qna_list.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('Q&A 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
		}

	}
	
	
}

