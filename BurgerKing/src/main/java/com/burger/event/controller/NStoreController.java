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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.burger.cs.model.PageDTO;
import com.burger.event.model.NStoreDAO;
import com.burger.event.model.NStoreDTO;


@Controller
public class NStoreController {

	@Autowired
	private Store_upload upload;
	
	@Autowired
	private NStoreDAO dao;

	private int totalRecord = 0;
	private final int rowsize = 8;

	@RequestMapping("store_list.do")
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
		List<NStoreDTO> pageList = this.dao.getStoreList(dto);

		model.addAttribute("List", pageList);
		model.addAttribute("Paging", dto);

		return "store_list";
	}
	
	@RequestMapping("store_write.do")
	public String write() {

		return "store_writeForm";
	}

	  
	/*
	 * @RequestMapping("store_write_ok.do") public void writeOk(NStoreDTO dto,
	 * HttpServletResponse response) throws IOException {
	 * 
	 * int check = this.dao.insertStore(dto);
	 * 
	 * response.setContentType("text/html; charset-UTF-8");
	 * 
	 * PrintWriter out = response.getWriter();
	 * 
	 * if(check > 0) { out.println("<script>"); out.println("alert('공지사항 등록 완료')");
	 * out.println("location.href='store_list.do'"); out.println("</script>");
	 * 
	 * }else { out.println("<script>"); out.println("alert('공지사항 등록 실패')");
	 * out.println("history.back()"); out.println("</script>"); }
	 * 
	 *} 
	 */
	  

@RequestMapping("store_write_ok.do")
public void uploadOk(MultipartHttpServletRequest mRequest, HttpServletRequest request, HttpServletResponse response, MultipartFile store_image, MultipartFile store_thum)
		throws Exception {

	NStoreDTO dto = new NStoreDTO();

	String aa = request.getParameter("store_title");
	String bb = request.getParameter("store_cont");

	String ff = store_image.getOriginalFilename();
	System.out.println(ff);
	String ee = store_thum.getOriginalFilename();
	System.out.println(ee);

	String zz = upload.fileUpload(mRequest); 
	
	dto.setStore_title(aa);
	dto.setStore_cont(bb);
	dto.setStore_image(ff);
	dto.setStore_thum(ee);
	
	
	
	
	int check = this.dao.insertStore(dto);

	response.setContentType("text/html; charset-UTF-8");

	PrintWriter out = response.getWriter();

	if (check > 0) {
		out.println("<script>");
		out.println("alert('상점 등록 완료')");
		out.println("location.href='store_list.do'");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('이벤트 등록 실패')");
		out.println("history.back()");
		out.println("</script>");
	}

}
	  
	

	
	@RequestMapping("store_cont.do")
	public String content(@RequestParam("no") int store_no, @RequestParam("page") int nowPage, Model model) {

		

		// 게시글 상세내역 조회하는 메서드 호출
		NStoreDTO dto = this.dao.storeCont(store_no);

		model.addAttribute("Cont", dto);

		model.addAttribute("page", nowPage);

		return "store_content";

	}

	@RequestMapping("store_update.do")
	public String modify(@RequestParam("no") int store_no, @RequestParam("page") int nowPage, Model model) {

		// 게시글 상세내역 조회하는 메서드 호출
		NStoreDTO dto = this.dao.storeCont(store_no);

		model.addAttribute("modify", dto);

		model.addAttribute("page", nowPage);

		return "store_updateForm";

	}

	@RequestMapping("store_update_ok.do")
	public void modifyOk(NStoreDTO dto, @RequestParam("page") int nowPage, HttpServletResponse response)
			throws IOException {
		int check = this.dao.updateStore(dto);
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('스토어 수정 완료')");
			out.println("location.href='store_cont.do?no=" + dto.getStore_no() + "&page=" + nowPage + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('스토어 수정 실패 ')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	@RequestMapping("store_delete.do")
	public String delete(@RequestParam("no") int store_no, @RequestParam("page") int nowPage, Model model) {

		// 게시글 상세내역 조회하는 메서드 호출
		NStoreDTO dto = this.dao.storeCont(store_no);

		model.addAttribute("delete", dto);

		model.addAttribute("page", nowPage);

		return "store_delete";

	}

	@RequestMapping("store_delete_ok.do")
	public void deleteOk(@RequestParam("store_no") int store_no, @RequestParam("page") int nowPage,

			HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		int check = 0;

		check = this.dao.deleteStore(store_no);
		if (check > 0) {
			this.dao.reSequence(store_no);
			out.println("<script>");
			out.println("alert('공지사항 삭제 완료')");
			out.println("location.href='store_list.do?page=" + nowPage + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('공지사항 삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	
	
	 
	
	
	 
	 
}
