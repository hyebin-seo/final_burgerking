package com.burger.location.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.burger.location.model.LocationDAO;
import com.burger.location.model.LocationDTO;
import com.burger.login.model.UserDTO;

@Controller
public class LotacionController {
	
	@Autowired
	private LocationDAO locationDao;
	
	// MY배달지 페이지
	@RequestMapping("/myLocation.do")
	public String locationList(HttpServletRequest request, HttpSession session, Model model) {
		
		// 세션에 저장된 user_id 가져온다
		session = request.getSession();
		
		UserDTO dto = (UserDTO)session.getAttribute("memberSession");
		
		String user_id = dto.getUser_id();
		
		System.out.println("user_id>"+user_id);
		
		// 아이디에 해당하는 MY배달지 리스트 반환
		List<LocationDTO> myLocList = this.locationDao.getMyLocationList(user_id);
		
		model.addAttribute("myLocList", myLocList);
		
		return "mypage_Mylocation";
	 
	}
	
	// MY배달지 등록하는 메소드
	@RequestMapping("/location_insert.do")
	public String insertLocation(LocationDTO loc, HttpServletResponse response, 
				HttpServletRequest request, HttpSession session) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		session = request.getSession();
		UserDTO dto = (UserDTO)session.getAttribute("memberSession");
		String user_id = dto.getUser_id();
		
		loc.setUser_id(user_id);
		
		// 해당 id에 등록된 MY배달지 개수
		int size = this.locationDao.getMyLocationList(loc.getUser_id()).size();
		
		String returnPage = null;
		
		System.out.println("size"+size);
		
		if(size >= 5) {		// MY배달지가 이미 5개 등록되어 있는 경우
			out.println("<script>");
			out.println("alert('MY배달지는 5개까지 설정 가능합니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			this.locationDao.insertLocation(loc);
			
			// MY배달지 페이지에서 팝업창 띄웠을 경우
			if(loc.getPath().equals("myLocation")) {
				returnPage = "redirect:/myLocation.do";
			// 배달지변경 페이지에서 팝업창 띄웠을 경우
			}else if(loc.getPath().equals("location")) {
				returnPage = "delivery/deliveryHome";
			}
		}
		
		return returnPage;
		
	}
	
	
	@RequestMapping("/location_delete.do")
	@ResponseBody
	public HashMap<String, Object> deleteLocation(int loc_no,
			HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		UserDTO dto = (UserDTO)session.getAttribute("memberSession");
		String user_id = dto.getUser_id();
		
		this.locationDao.deleteLocation(loc_no);
		
		List<LocationDTO> myLocList = this.locationDao.getMyLocationList(user_id);
		
		System.out.println(myLocList.size());
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("size", myLocList.size());
		
		return result;	
	}
	
	
	// 기본배달지 라디오 버튼 클릭했을 때 회원의 배달지 중
	// 클릭한 배달지만 기본배달지로 등록되게 함.
	@RequestMapping("/location_setDefault.do")
	@ResponseBody
	public void setDefalutLoc(int loc_no, HttpSession session,
			HttpServletRequest request) {
		
		System.out.println("loc_no");
		
		session = request.getSession();
		UserDTO dto = (UserDTO)session.getAttribute("memberSession");
		String user_id = dto.getUser_id();
		
		// user_id의 모든 배달지를 기본배달지 여부를 n로 바꾸기
		this.locationDao.noDefaultLoc(user_id);
		// 선택한 배달지만 기본배달지로 설정
		this.locationDao.setDefaultLoc(loc_no);
	}
	
	
	// 별칭변경
	@RequestMapping("/changeLocName.do")
	@ResponseBody
	public HashMap<String, Object> changeLocName(String new_locName, int changeLocName_locNo) {
		
		LocationDTO loc = new LocationDTO();
		
		loc.setLoc_nickname(new_locName);
		loc.setLoc_no(changeLocName_locNo);
		
		// loc_no에 해당하는 배달지의 별칭 변경
		this.locationDao.changeLocName(loc);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("new_name", new_locName);
		
		return result;
		//return "redirect:/myLocation.do";
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
