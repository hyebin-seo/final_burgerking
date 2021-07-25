package com.burger.stamp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.burger.login.model.UserDTO;
import com.burger.stamp.model.StampDAO;
import com.burger.stamp.model.StampDTO;

@Controller
public class StampController {
	
	@Autowired
	private StampDAO stampDao;
	
	// 마이페이지 => 나의 스탬프 페이지 이동하는 매핑
	@RequestMapping("myStamp.do")
	public String stamp(HttpServletRequest request, HttpSession session,
			Model model) {
		
		// 세션에 저장된 user_id 가져온다
		session = request.getSession();
		UserDTO dto = (UserDTO)session.getAttribute("memberSession");
		String user_id = dto.getUser_id();
		
		// 해당 id의 스탬프 리스트
		List<StampDTO> myStampList = this.stampDao.getMyStampList(user_id);
		
		model.addAttribute("myStampList", myStampList);
		
		return "mypage_myStamp";
	}

}
