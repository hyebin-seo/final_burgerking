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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.burger.login.model.EmailService;
import com.burger.login.model.LoginDAO;
import com.burger.login.model.UserDTO;

@Controller
public class LoginController {

	@Autowired
	private LoginDAO dao;

	@Autowired
	private EmailService EmailService;

	@RequestMapping("Login.do")
	public String MoveLogin() {

		return "user/Login";
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

		return "user/user_join";
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

		return "user/user_info_service";
	}

//아이디 비밀번호 찾기 
	@RequestMapping("find_id_pwd.do")

	public String find_name_pwd() {

		return "user/find_id_pwd";
	}

	// 아이디 찾기
	@RequestMapping("find_id.do")
	public String find_name(UserDTO dto, HttpServletResponse response, Model model) throws IOException {

		response.setContentType("text/html; charset=UTF-8");
		// PrintWriter script = response.getWriter();

		dto = this.dao.find_id(dto);

		if (dto == null) {

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이름 및 번호를 확인해주세요.')");
			script.println("history.back()");
			script.println("</script>");

		} else {
			String msg = "아이디를 찾았습니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("user_id", dto.getUser_id());
			

		}
		return "user/find_Result";

	} // 메서드 끝


	// 비밀번호 찾아서 메일로 보내는 기능.

	@RequestMapping("find_pwd.do")
	public String sendSimpleMail(HttpServletRequest request, HttpServletResponse response, UserDTO dto, Model model)
			throws Exception {

		dto = this.dao.find_pwd(dto);

		request.setCharacterEncoding("utf-8");
		

		if (dto != null) {

			String s = "";
			String st[] = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
					"S", "T", "U", "V", "W", "X", "Y", "Z" };
			Random r = new Random();
			for (int i = 1; i <= 6; i++) {

				s += st[r.nextInt(26)];

			}

			Random r1 = new Random();
			int num = r1.nextInt(999999); // 랜덤난수설정

			String random = s + num;

			String info = "안녕하세요." + dto.getUser_name() + "회원님\n 비밀번호 재설정을 위한 경로를 다음과 같이 보내드립니다." + "\n 아이디 :"
					+ dto.getUser_id() + "" + "\n 임시비밀번호 :" + random;

			EmailService.sendMail(dto.getUser_id(), "버거킹 임시비밀번호 변경 인증안내", info);

			String msg = "임시비밀번호를 발급했습니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("db_pwd", random);
			model.addAttribute("user_id", dto.getUser_id());

		} else {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('확인된 정보가 존재하지않습니다. 확인하여 주시기 바랍니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		return "user/find_Result";

	}

	// 임시비밀번호 맞는지 확인하는 작업.
	@RequestMapping("auth_pwd.do")
	public String auth(@RequestParam("fake_pwd") String fake_pwd, @RequestParam("db_pwd") String db_pwd,
			@RequestParam("user_id") String user_id, HttpServletResponse response, Model model) throws Exception {

		

		if (!fake_pwd.equals(db_pwd)) {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter script = response.getWriter();
			
			script.println("<script>");
			script.println("alert('임시비밀번호가 틀렸습니다. 확인해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			String msg = "확인되었습니다.";
		     model.addAttribute("msg", msg);
		     model.addAttribute("user_id", user_id);
		    
					
		}
		
		return "user/change_pwd";

	}
	
	// 비밀번호를 바꾸는 작업.
	@RequestMapping("auth_pwdOk.do")
	public void chage_pwdOk(UserDTO dto, HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter script = response.getWriter();

		int check = this.dao.change_pwd(dto);
		if (check > 0) {
			script.println("<script>");
			script.println("alert('비밀번호가 변경되었습니다.')");
			script.println("location.href='/burger/'");
			script.println("</script>");
		} else {
			script.println("<script>");
			script.println("alert('오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}

	}

}
