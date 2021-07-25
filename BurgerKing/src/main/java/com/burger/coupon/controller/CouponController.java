package com.burger.coupon.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.burger.coupon.model.CouponDAO;
import com.burger.coupon.model.CouponDTO;
import com.burger.login.model.UserDTO;
import com.burger.menu.model.MenuDTO;
import com.burger.menu.model.MenuSetDAO;
import com.burger.menu.model.MenuSetDTO;
import com.burger.stamp.model.StampDAO;

@Controller
public class CouponController {
	
	@Autowired
	private CouponDAO couponDao;
	
	@Autowired
	private StampDAO stampDao;
	
	@Autowired
	private MenuSetDAO setDao;
	
	@RequestMapping("myCoupon.do")
	public String coupon(HttpSession session, 
			HttpServletRequest request, Model model) {
		
		// 세션에 저장된 user_id 가져온다
		session = request.getSession();
		UserDTO dto = (UserDTO)session.getAttribute("memberSession");
		String user_id = dto.getUser_id();
		
		List<CouponDTO> couponList = this.couponDao.getMyCouponList(user_id);
		MenuSetDTO menu5 = this.setDao.getSetDetail(86);	// 주니어와퍼세트
		MenuSetDTO menu10 = this.setDao.getSetDetail(29);	// 기네스와퍼세트
		
		System.out.println(couponList.size());
		
		model.addAttribute("couponList", couponList);
		model.addAttribute("menu5", menu5);
		model.addAttribute("menu10", menu10);
		
		return "mypage_myCoupon";
	}
		
	@RequestMapping("/insert_coupon.do")
	public String insertCoupon(String coupon_type,
			HttpSession session, HttpServletRequest request) {
		
		// 세션에 저장된 user_id 가져온다
		session = request.getSession();
		UserDTO dto = (UserDTO)session.getAttribute("memberSession");
		String user_id = dto.getUser_id();
		
		CouponDTO coupon = new CouponDTO();
		coupon.setUser_id(user_id);
		coupon.setCoupon_type(coupon_type);
		
		// 쿠폰 발급
		this.couponDao.insertCoupon(coupon);
		
		// 스탬프 차감
		if(coupon_type.equals("coupon5")) {
			this.stampDao.minus5Stamp(user_id);
		}else if(coupon_type.equals("coupon10")) {
			this.stampDao.minus10Stamp(user_id);
		}
		
		// myCoupon페이지로 이동
		return "redirect:/myCoupon.do";
		
	}

}
