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

import com.burger.cs.model.FranchiseDAO;
import com.burger.cs.model.FranchiseDTO;
import com.burger.cs.model.NoticeDTO;
import com.burger.cs.model.PageDTO;
import com.burger.login.model.UserDTO;

@Controller
public class FranchiseController {
	
	@Autowired
	private FranchiseDAO dao; 
	
	private int totalRecord = 0;
	private final int rowsize = 8;
	
	@RequestMapping("Franchise.do")
	public String MoveFranchise(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		UserDTO userDto = (UserDTO) session.getAttribute("memberSession");
		
		System.out.println("userDTO>>"+userDto);
		
		model.addAttribute("cat", "가맹점모집");
		return "user_franchise";
	}
	
	
	@RequestMapping("Franchise_Ok.do")
	public void insertFranchise(FranchiseDTO dto, HttpServletResponse response) throws Exception {
		
		dto.setFran_birth(dto.getYear()+"-"+dto.getMonth()+"-"+dto.getDay());
		dto.setFran_area(dto.getArea_no()+dto.getArea());
		
			
			response.setContentType("text/html; charset-UTF-8");
			  
			PrintWriter out = response.getWriter();
			  		  
			int check = this.dao.insertFranchise(dto);
			
			if(check > 0) {
				out.println("<script>");
				out.println("alert('신청서 작성이 완료되었습니다.')");
				out.println("location.href='Franchise.do'");
				out.println("</script>");
			}else {
				 out.println("<script>");
				 out.println("alert('가맹점 문의가 실패하였습니다.')");
				 out.println("history.back()"); 
				 out.println("</script>"); 
			}
			
		} //insertFranchise end
	
	@RequestMapping("AdminFranchise.do")
	public String ListAdminFranchise(HttpServletRequest request, Model model) {
		
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
		List<FranchiseDTO> FranchiseList = this.dao.getFranchiseList(dto);
		System.out.println(FranchiseList);
		System.out.println(dto);
		
		model.addAttribute("List", FranchiseList);
		model.addAttribute("Paging", dto);
		
		return "admin_franchise";
	}
	
	
	@RequestMapping("AdminFranchiseCont.do")
	   public String AdminFranchiseCont(@RequestParam("no") int fran_no,  @RequestParam("page") int nowPage, Model model) {
	      
	      FranchiseDTO dto = this.dao.getFranchiseCont(fran_no);
	      
	      model.addAttribute("franchiseCont", dto);
	      
	      System.out.println("dto>>>"+dto);
	      
	      model.addAttribute("page", nowPage);
	      
	      return "admin_franchiseCont";
	   }
	
	@RequestMapping("FranchiseUpdate.do")
	public void FranchiseUpdate(@RequestParam("no") int fran_no, @RequestParam("page") int nowPage, HttpServletResponse response) throws IOException {
	
		int check = this.dao.updateFranchise(fran_no);
		
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('가맹 승인 완료')");
			out.println("location.href='AdminFranchiseCont.do?no=" + fran_no + "&page=" + nowPage + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('가맹 승인 실패 ')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("FranchiseDelete.do")
	public void deleteOk(@RequestParam("no") int fran_no, @RequestParam("page") int nowPage, HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		int check = 0;

		check = this.dao.deleteFranchise(fran_no);
		
		if (check > 0) {
			this.dao.reFranchiseNO(fran_no);
			out.println("<script>");
			out.println("alert('가맹 신청서 삭제 완료')");
			out.println("location.href='AdminFranchise.do?page=" + nowPage + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('가맹 신청서 삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	@RequestMapping("sitemap.do")
	public String sitemap() {
		return "siteMap";
	}
}
