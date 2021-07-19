package com.burger.cs.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.burger.cs.model.FranchiseDAO;
import com.burger.cs.model.FranchiseDTO;

@Controller
public class FranchiseController {
	
	@Autowired
	private FranchiseDAO dao; 
	
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
	
	
	
}
