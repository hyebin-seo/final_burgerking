package com.burger.location.controller;

import java.util.HashMap;
import java.util.List;

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
	
	
	@RequestMapping("/location_list.do")
	public String locationList(String user_id, Model model) {
		
		System.out.println(user_id);
		
		List<LocationDTO> myLocList = this.locationDao.getMyLocationList(user_id);
		
		System.out.println(myLocList);
		
		model.addAttribute("myLocList", myLocList);
		
		return "mypage_Mylocation";
	 
	}
	
	
	@RequestMapping("/location_insert.do")
	public void insertLocation(LocationDTO loc) {
		
		// 이 부분 다시 확인해보기
		//loc.setUser_id("홍길동");
		
		this.locationDao.insertLocation(loc);
		
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
