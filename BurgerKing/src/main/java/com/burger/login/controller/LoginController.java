package com.burger.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.el.parser.AstDotSuffix;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	public void join(@RequestParam("chk") ArrayList<String> valueArr, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter script = response.getWriter();
		
		System.out.println("chk>"+valueArr);
		
		if (!valueArr.contains("1") || !valueArr.contains("2")) {
					script.println("<script>");
					script.println("alert('필수항목을 체크해주셔야합니다.')");
					script.println("history.back()");
					script.println("</script>");
					
		}else {
			script.println("<script>");
			script.println("location.href='joins.do'");
			script.println("</script>");
		}
		
	
	}
	
  @RequestMapping("joins.do")
	
	public String joins() throws IOException {
		
		
	   return "user_join";
	}

	// 회원가입 메서드
	@RequestMapping("join_Ok.do")
	public void joinOk(UserDTO dto, HttpServletResponse response) throws IOException {

		dto.setUser_addr(dto.getZipcode() + dto.getUser_addr1() + dto.getUser_addr2());

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter script = response.getWriter();

		int check = this.dao.join(dto);

		if (check > 0) {
			script.println("<script>");
			script.println("alert('회원가입을 축하 드립니다!')");
			script.println("location.href='Login.do'");
			script.println("</script>");
		} else {
			script.println("<script>");
			script.println("alert('오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}

	}

	// 로그인 메서드
	@RequestMapping("login_Ok.do")
	public void login_ok(@RequestParam("user_id") String user_id, @RequestParam("user_pwd") String user_pwd,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter script = response.getWriter();

		System.out.println("user_id>>" + user_id);

		if (!user_id.equals("") && !user_pwd.equals("")) {

			UserDTO dto = this.dao.checkId_pwd(user_id, user_pwd);
			System.out.println(dto.getUser_id());

			if (user_id.equals(dto.getUser_id())) {
				if (dto.getUser_pwd().equals(user_pwd)) {

					script.println("<script>");
					script.println("location.href=/burger/");
					script.println("</script>");

				} else {
					script.println("<script>");
					script.println("alert('비밀번호가 틀렸습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
			} else {
				script.println("<script>");
				script.println("alert('아이디가 존재하지 않습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		} else {
			script.println("<script>");
			script.println("alert('아이디 및 비밀번호를 확인해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}

	}

	@RequestMapping("idcheck.do")
	@ResponseBody
	public String idcheck(String user_id) {
		
		
		
		
	    System.out.println("user_id >>"+user_id);

		int check = this.dao.idcheck(user_id);

		if ( check != 0) {

			return "fail"; // 중복 아이디가 존재

		} else {

			return "success"; // 중복 아이디 x

		}

	}
	
//정보동의제공서  페이지 이동.
@RequestMapping("join_info_service.do") 
	public String join_info_service() {

		return "user_info_service";
	}

}
