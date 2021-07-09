package com.burger.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.burger.login.model.LoginDAO;
import com.burger.login.model.UserDTO;




@Controller
public class LoginController {
	
	@Autowired
	private LoginDAO dao;
	
	@RequestMapping("Login.do")
	public String MoveLogin() {
	
		return "Login";
	}
	
	@RequestMapping("join.do")
	public String join() {
		
	 return "user_join";	
	}
	

  //회원가입 메서드	
	@RequestMapping("join_Ok.do")
	public void joinOk(UserDTO dto, HttpServletResponse response) throws IOException {
     
	
	dto.setUser_addr(dto.getZipcode()+dto.getUser_addr1()+dto.getUser_addr2());
		
	response.setContentType("text/html; charset=UTF-8");
	PrintWriter script = response.getWriter();
	
   int check = this.dao.join(dto);
   
   if (check>0) {
	   script.println("<script>");
	   script.println("alert('회원가입을 축하 드립니다!')");
	   script.println("location.href='Login.do'");
	script.println("</script>");
}else {
	  script.println("<script>");
	   script.println("alert('오류가 발생했습니다.')");
	   script.println("history.back()");
	script.println("</script>");
}
   
   
		
	
	}
	
	// 로그인 메서드
	@RequestMapping("login_Ok.do")
	public String login_ok(@RequestParam("user_id")String user_id,@RequestParam("user_pwd")String user_pwd,
			HttpServletResponse response) throws IOException {
		
	UserDTO dto =  this.dao.checkId_pwd(user_id, user_pwd);
	response.setContentType("text/html; charset=UTF-8");
	PrintWriter script = response.getWriter();
	
	if (dto.getUser_id() == user_id) {
		if (dto.getUser_pwd() == user_pwd) {
			
			
			
		}else {
			script.println("<script>");
			   script.println("alert('비밀번호가 틀렸습니다.')");
			   script.println("history.back()");
			script.println("</script>");
		}
	}else {
		script.println("<script>");
		   script.println("alert('아이디가 존재하지 않습니다.')");
		   script.println("history.back()");
		script.println("</script>");
	}
		
		
	
	return "home";
	}

}
