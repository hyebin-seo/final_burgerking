package com.burger.location.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.burger.location.model.LocationDAO;
import com.burger.location.model.LocationDTO;

@Controller
public class LotacionController {
	
	@Autowired
	private LocationDAO locationDao;
	
	// MY배달지 페이지
	@RequestMapping("/myLocation.do")
	public String locationList(String user_id, Model model) {
		
		// 아이디에 해당하는 MY배달지 리스트 반환
		List<LocationDTO> myLocList = this.locationDao.getMyLocationList(user_id);
		
		model.addAttribute("myLocList", myLocList);
		
		return "mypage_Mylocation";
	 
	}
	
	// MY배달지 등록하는 메소드
	@RequestMapping("/location_insert.do")
	public String insertLocation(LocationDTO loc, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// 로그인 되면 여기 바꾸기
		loc.setUser_id("ssial104@naver.com");
		
		System.out.println(loc.getLoc_addr1());
		System.out.println(loc.getLoc_addr2());
		System.out.println(loc.getLoc_addr3());
		System.out.println(loc.getLoc_nickname());
		System.out.println(loc.getPath());
		
		// 해당 id에 등록된 MY배달지 개수
		int size = this.locationDao.getMyLocationList(loc.getUser_id()).size();
		
		if(size > 5) {		// MY배달지가 이미 5개 등록되어 있는 경우
			out.println("<script>");
			out.println("alert('MY배달지는 5개까지 설정 가능합니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			this.locationDao.insertLocation(loc);
		}
		
		String returnPage = null;
		
		// MY배달지 페이지에서 팝업창 띄웠을 경우
		if(loc.getPath().equals("myLocation")) {
			returnPage = "mypage_Mylocation";
		// 배달지변경 페이지에서 팝업창 띄웠을 경우
		}else if(loc.getPath().equals("location")) {
			returnPage = "delivery/deliveryHome";
		}
		
		return returnPage;
		
	}
	
	
	@RequestMapping("/location_delete.do")
	@ResponseBody
	public HashMap<String, Object> deleteLocation(int loc_no, String user_id) {
		
		this.locationDao.deleteLocation(loc_no);
		
		List<LocationDTO> myLocList = this.locationDao.getMyLocationList(user_id);
		
		System.out.println(myLocList.size());
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("size", myLocList.size());
		
		return result;	
	}
	
	
	// 일단 마이페이지에서 쿠폰, 스탬프 페이지 이동하는 거 보려고 여기에 씀!
	// DB 만들면 거기 컨트롤러로 옮기기 ★★★★★★★★★★★★
	@RequestMapping("stamp_list.do")
	public String stamp(String user_id) {
		return "mypage_myStamp";
	}
	
	@RequestMapping("coupon_list.do")
	public String coupon(String user_id) {
		return "mypage_myCoupon";
	}

}
