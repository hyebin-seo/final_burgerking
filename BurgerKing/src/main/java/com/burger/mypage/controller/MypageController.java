package com.burger.mypage.controller;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.burger.cart.model.CartDAO;
import com.burger.coupon.model.CouponDAO;
import com.burger.cs.model.QnaDAO;
import com.burger.delivery.model.DeliveryDAO;
import com.burger.location.model.LocationDAO;
import com.burger.login.model.LoginDAO;
import com.burger.login.model.UserDTO;
import com.burger.stamp.model.StampDAO;

import net.nurigo.java_sdk.api.Message;

@Controller
public class MypageController {

	@Autowired
	private LocationDAO locationDao;
	
	@Autowired
	private CouponDAO couponDao;
	
	@Autowired
	private StampDAO stampDao;
	
	@Autowired
	private QnaDAO qnaDao;
	
	// 정보변경 때문에 일단 넣어놓음
	@Autowired
	private LoginDAO loginDao;
	
	@Autowired
	private CartDAO cartDao;
	
	@Autowired
	private DeliveryDAO deliveryDao;
	
	@RequestMapping("/mypage_main.do")
	public String main(HttpServletRequest request, HttpSession session, Model model) {
		
		// 세션에 저장된 user_id 가져온다
		session = request.getSession();
		UserDTO dto = (UserDTO)session.getAttribute("memberSession");
		String user_id = dto.getUser_id();
				
		// 마이페이지 메인에서 개수 보여줘야 돼서 사이즈 반환
		int myLocSize = this.locationDao.getMyLocationList(user_id).size();
		int myCouponSize = this.couponDao.getMyCouponList(user_id).size();
		int myStampSize = this.stampDao.getMyStampList(user_id).size();
		
		model.addAttribute("myLocSize", myLocSize);
		model.addAttribute("myStampSize", myStampSize);
		model.addAttribute("myCouponSize", myCouponSize);
		
		return "mypage_main";
	}
	
	
	@RequestMapping("/mypage_searchAddr.do")
	public String searchAddr() {
		
		return "mypage_searchAddr";
	}
	
	
	// 임시 매핑
	@RequestMapping("/change_info.do")
	public String changeInfo() {
		
		return "mypage_changeInfo";
	}
	
	// 핸드폰번호 중복확인 메서드
	@RequestMapping("/phoneNoCheck.do")
	@ResponseBody
	public String phoneNoCheck(String newPhoneNo,
			HttpServletRequest request, HttpSession session) {

		// 세션에 저장된 user_id 가져온다
		session = request.getSession();
		UserDTO dto = (UserDTO)session.getAttribute("memberSession");
		String oldPhoneNo = dto.getUser_phone();
		
		if (oldPhoneNo.equals(newPhoneNo)) {

			return "fail"; // 동일 폰번호

		} else {

			return "success"; // 동일 폰번호 x

		}

	}
	
	
	// 인증번호 발송
	   // 문자를 보낼때 맵핑되는 메소드
	   @RequestMapping("/sendSMS.do")
	    @ResponseBody
	    public HashMap<String, String> sendSms(HttpServletRequest request) throws Exception {
	       
	      //
	      String guest_phone = request.getParameter("newPhoneNo");
	      
	      //난수설정 
	      String s = "";
	      Random r1 = new Random();
	      int num = r1.nextInt(999999); // 랜덤난수설정
	      
	      String random = s + num;
	      //난수설정 
	      //문자보내는API
	       String api_key = "NCSJOUCPO2I53ISF"; //위에서 받은 api key를 추가
	       String api_secret = "6MWIMK00KRQB9A3Z6DGSJPAEDDCFHRSA";  //위에서 받은 api secret를 추가
	       Message coolsms = new Message(api_key, api_secret);
	   
	       HashMap<String, String> set = new HashMap<String, String>();
	       set.put("to", guest_phone); // 수신번호
	   
	       set.put("from", "01033610849"); // 발신번호
	       set.put("text", random); // 문자내용
	       set.put("type", "sms"); // 문자 타입
	   
	       System.out.println(set);
	   
	       JSONObject result = (JSONObject) coolsms.send(set); // 보내기&전송결과받기
	       
	       //System.out.println(result);
	       System.out.println(set);
	    
	       set.put("random", random);

	       System.out.println("set??"+set);
	       
	       return set;
	  }   
	
	
	// 핸드폰번호 바꾸는 메소드
	@RequestMapping("/phoneNoChange.do")
	@ResponseBody
	public String phoneNoChange(String new_phoneNo,
			HttpServletRequest request, HttpSession session) {

		// 세션에 저장된 user_id 가져온다
		session = request.getSession();
		UserDTO dto = (UserDTO)session.getAttribute("memberSession");
		String user_id = dto.getUser_id();
		
		UserDTO user = new UserDTO();
		user.setUser_id(user_id);
		user.setUser_phone(new_phoneNo);
		
		this.loginDao.change_phoneNo(user);
		
		session.setAttribute("memberSession", user);
		
		return "redirect:/change_info.do";

	}	
	
	// 회원 탈퇴 페이지 매핑
	@RequestMapping("/secession.do")
	public String secession() {
		
		return "mypage_secession";
	}
	
	
	// 회원 탈퇴 완료시
	@RequestMapping("/secSuccess.do")
	public String secSuccess(HttpServletRequest request, HttpSession session) {
		
		// 세션에 저장된 user_id 가져온다
		session = request.getSession();
		UserDTO dto = (UserDTO)session.getAttribute("memberSession");
		String user_id = dto.getUser_id();
		
		// 회원 테이블에서 삭제
		this.loginDao.deleteUser(user_id);
		
		// 주문 테이블에서 삭제
		this.deliveryDao.deleteUserOrder(user_id);
		
		// 카트 테이블에서 삭제
		this.cartDao.cartAllDelete(user_id);
		
		// 쿠폰 삭제
		this.couponDao.deleteUserCoupon(user_id);
		
		// 스탬프 삭제
		this.stampDao.deleteUserStamp(user_id);
		
		// 배달지 삭제
		this.locationDao.deleteUserLoc(user_id);
		
		// QNA삭제
		this.qnaDao.deleteUserQna(user_id);
		
		session.removeAttribute("access_Token");
		session.removeAttribute("userId");
		session.removeAttribute("addrSession");
		session.removeAttribute("delivery_addr");
		session.invalidate();
		
		return "secSuccess";
	}
	
	
}
