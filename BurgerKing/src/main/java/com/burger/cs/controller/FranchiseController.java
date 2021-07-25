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

import com.burger.cs.model.FranchiseDAO;
import com.burger.cs.model.FranchiseDTO;
import com.burger.cs.model.PageDTO;

@Controller
public class FranchiseController {
	
	@Autowired
	private FranchiseDAO dao; 
	
	private int totalRecord = 0;
	private final int rowsize = 8;
	
	@RequestMapping("Franchise.do")
	public String MoveFranchise(Model model) {
		
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
		
		model.addAttribute("List", FranchiseList);
		model.addAttribute("Paging", dto);
		
		return "admin_franchise";
	}
	
	@RequestMapping("AdminFranchiseCont.do")
	public String AdminFranchiseCont(Model model) {
		
		return "admin_franchiseCont";
	}
	
}
