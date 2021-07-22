package com.burger.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.el.parser.AstDotSuffix;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
import com.burger.login.model.Guest_Order;
import com.burger.login.model.LoginDAO;
import com.burger.login.model.NaverLoginApi;
import com.burger.login.model.UserDTO;

import net.nurigo.java_sdk.Coolsms;
import net.nurigo.java_sdk.api.Message;

@Controller
public class LoginController {

	@Autowired
	private LoginDAO dao;

	@Autowired
	private EmailService EmailService;

	@RequestMapping("Login.do")
	public String MoveLogin() {

		return "user/bk_login";
	}

	@RequestMapping("join.do")
	public void join(@RequestParam("chk") ArrayList<String> valueArr, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter script = response.getWriter();
	

		if (!valueArr.contains("1") || !valueArr.contains("2") || valueArr == null) {
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
	
	//정보동의제공서  페이지 이동.
			@RequestMapping("move_join.do")
			public String join() {

				return "user/join";
			}
	
	
	//정보동의제공서  페이지 이동.
		@RequestMapping("join_info_service.do")
		public String join_info_service() {

			return "user/user_info_service";
		}
	

	@RequestMapping("joins.do")

	public String joins(@RequestParam("user_id")String user_id, Model model) throws IOException {
        
		
		model.addAttribute("user_id", user_id);
		return "user/user_join";
	}

	// 회원가입 메서드
	@RequestMapping("join_Ok.do")
	public void joinOk(UserDTO dto, HttpServletResponse response) throws IOException {

		dto.setUser_addr(dto.getUser_zipcode() + dto.getUser_addr1() + dto.getUser_addr2());
		
		System.out.println(dto);

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
	public String login_ok(UserDTO dto, HttpServletResponse response, HttpSession session) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter script = response.getWriter();

		dto = this.dao.checkId_pwd(dto);

		if (dto != null) {
			
			session.setMaxInactiveInterval(60*120); // 120분간유효
			session.setAttribute("memberSession", dto);
			
			
		} else {
			script.println("<script>");
			script.println("alert('아이디 및 비밀번호를 확인해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		return "delivery/deliveryHome";

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



//아이디 비밀번호 찾기 
	@RequestMapping("find_id_pwd.do")

	public String find_name_pwd() {

		return "user/find_id_pwd2";
	}

	// 아이디 찾기
	@RequestMapping("find_id.do")
	public String find_name(UserDTO dto, HttpServletResponse response, HttpServletRequest request,Model model) throws IOException {

		System.out.println("jsp2>> "+dto);
		String seid = request.getParameter("seid");
		
		
		
		    dto = this.dao.find_id(dto);
		
		    

		if (dto != null) {
			String msg = "아이디를 찾았습니다.";
			
			model.addAttribute("seid", seid);
			model.addAttribute("user_id", dto.getUser_id());
			return "user/find_Result2";
			
		} else {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이름 및 번호를 확인해주세요.')");
			script.println("history.back()");
			script.println("</script>");

		}
		return null;
		

	} // 메서드 끝
	
	@RequestMapping("move_pwd.do")
	public String move_pwd(Model model, HttpServletRequest request) {
		
	   String sepwd = request.getParameter("sepwd");
	   System.out.println(sepwd);
	   model.addAttribute("sepwd", sepwd);	
		
		return "user/find_id_pwd2";
	}


	// 비밀번호 찾아서 메일로 보내는 기능.
	@RequestMapping("auth_mail.do")
	@ResponseBody
	public HashMap<String, Object> auth_mail(HttpServletRequest request) {
		
		String user_email = request.getParameter("user_email");
		String s = "";
		Random r1 = new Random();
		int num = r1.nextInt(999999); // 랜덤난수설정

		String random = s + num;
		
		String info = "안녕하세요. 고객님\n 보인인증을 위한 번호를 다음과 같이 보내드립니다." 
				 + "\n 보인인증번호 :"+random;
		
		EmailService.sendMail(user_email, "보인인증", info);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		result.put("random", random);
		
		System.out.println(user_email);
		System.out.println(info);
		System.out.println(result);
		
		
		return result;
}
	

	@RequestMapping("find_pwd.do")
	public String sendSimpleMail(HttpServletRequest request, HttpServletResponse response, UserDTO dto, Model model)
			throws Exception {
		
		String sepwd = request.getParameter("sepwd");

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
					+ dto.getUser_id() + "" + "\n 임시비밀번호 :" + random + 
					"비밀번호 재설정 경로 : http://localhost:8765/burger/auth_pwd.do?user_id="+dto.getUser_id();

			EmailService.sendMail(dto.getUser_id(), "버거킹 임시비밀번호 변경 인증안내", info);

			String msg = "임시비밀번호를 발급했습니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("db_pwd", random);
			
			model.addAttribute("user_id", dto.getUser_id());
			model.addAttribute(sepwd, "sepwd");

			return "user/find_Result2";


		} else {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('확인된 정보가 존재하지않습니다. 확인하여 주시기 바랍니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		return null;
		
	}

	// 임시비밀번호 맞는지 확인하는 작업.
	@RequestMapping("auth_pwd.do")
	public String auth(HttpServletResponse response, Model model, @RequestParam("user_id") String user_id) throws Exception {

		System.out.println("user_id>>"+user_id);
		
     model.addAttribute("user_id", user_id);

		
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
	
	@RequestMapping("guestLogin.do")
	public String guestLogin() {
		
		
		return"user/guest_login";
	}
	
	
	//문자를 보내주는 메서드 
	//문자를 보낼때 맵핑되는 메소드
    @RequestMapping("sendSms.do")
    @ResponseBody
      public HashMap<String, String> sendSms(HttpServletRequest request) throws Exception {
    	
    	//
    	String guest_phone = request.getParameter("guest_phone");
    	
    	//난수설정 
    	String s = "";
		Random r1 = new Random();
		int num = r1.nextInt(999999); // 랜덤난수설정
       
		String random = s + num;
		//난수설정 
		
		

        HashMap<String, String> set = new HashMap<String, String>();
       
        set.put("random", random);

    
        
        
        System.out.println("set??"+set);
        
       
       
        return set;
      }	
    
    // guest주문에대한 인적사항을 DB에저장한다.
    @RequestMapping("guest_order.do")
    
    public void guest_order(HttpServletRequest request, HttpServletResponse response,HttpSession session,UserDTO dto) throws IOException {
    	
   
    
    	System.out.println(dto);
    	
    	response.setContentType("text/html; charset=UTF-8");
		PrintWriter script = response.getWriter();
		session.setAttribute("memberSession", dto);
		script.println("<script>");
		script.println("location.href='delivery_home.do'");
		script.println("</script>");
    	
  
    
    }	


}
