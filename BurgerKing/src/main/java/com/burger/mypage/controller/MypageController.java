package com.burger.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.burger.location.model.LocationDAO;
import com.burger.login.model.UserDTO;

@Controller
public class MypageController {

	@Autowired
	private LocationDAO locationDao;
	
	//@Autowired
	//private CouponDAO couponDao;
	
	//@Autowired
	//private stampDAO stampDao;
	
	@RequestMapping("/mypage_main.do")
	public String main(HttpServletRequest request, HttpSession session, Model model) {
		
		// 세션에 저장된 user_id 가져온다
		session = request.getSession();
		UserDTO dto = (UserDTO)session.getAttribute("memberSession");
		String user_id = dto.getUser_id();
				
		// 마이페이지 메인에서 개수 보여줘야 돼서 사이즈 반환
		int myLocSize = this.locationDao.getMyLocationList(user_id).size();
		//int myCouponSize = this.locationDao.getMyLocationList(user_id).size();
		//int myStampSize = this.locationDao.getMyLocationList(user_id).size();
		
		model.addAttribute("myLocSize", myLocSize);
		
		return "mypage_main";
	}
	
	
	@RequestMapping("/mypage_searchAddr.do")
	public String searchAddr() {
		
		return "mypage_searchAddr";
	}
	
	
}
