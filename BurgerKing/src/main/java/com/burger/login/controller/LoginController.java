package com.burger.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.el.parser.AstDotSuffix;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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



		if (!valueArr.contains("1") || !valueArr.contains("2")) {
			script.println("<script>");
			script.println("alert('필수항목을 체크해주셔야합니다.')");
			script.println("history.back()");
			script.println("</script>");

		} else {
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
	public void login_ok(UserDTO dto, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter script = response.getWriter();

		dto = this.dao.checkId_pwd(dto);

		if (dto != null) {

			script.println("<script>");
			script.println("location.href=/burger/");
			script.println("</script>");

		} else {
			script.println("<script>");
			script.println("alert('아이디 및 비밀번호를 확인해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}

	}

	// 아이디 중복확인 메서드
	@RequestMapping("idcheck.do")
	@ResponseBody
	public String idcheck(String user_id) {

		

		int check = this.dao.idcheck(user_id);

		if (check != 0) {

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

//아이디 비밀번호 찾기 
	@RequestMapping("find_id_pwd.do")

	public String find_name_pwd() {

		return "find_id_pwd";
	}

 //아이디 찾기 
	@RequestMapping("find_id.do")
	public void find_name(UserDTO dto, HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter script = response.getWriter();

		dto = this.dao.find_id(dto);

		if (dto == null) {

			script.println("<script>");
			script.println("alert('확인된 정보가 존재하지않습니다. 확인하여 주시기 바랍니다.')");
			script.println("history.back()");
			script.println("</script>");

		} else {

			script.println("<script>");
			script.println("alert('아이디를 찾았습니다.')");
			script.println("location.href='searchResult.do?user_id="+dto.getUser_id()+"'");
			script.println("</script>");

		}

	} //메서드 끝 
	
	
	//찾은 user_id값을 컨트롤러에 넘겨서 다시 프론트 페이지로 넘겨보자.
	@RequestMapping("searchResult.do")
	public String id_resultString (Model model, @RequestParam("user_id")String user_id) {
		
		model.addAttribute("user_id", user_id);
		
		return "find_Result";
	}
	
	// 비밀번호 찾기 기능 
	

}
