package com.burger.store.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.burger.store.model.StoreDAO;
import com.burger.store.model.StoreDTO;

@Controller
public class StoreController {
	
	@Autowired
	private StoreDAO dao;
	
	@RequestMapping("store.do")
	public String main() {
		
		return "storeHome";
	}
	
	@RequestMapping("store_register.do")
	public String register() {
		
		return "storeRegister";
	}
	
	@RequestMapping("store_register_ok.do")
	public void register_ok(@RequestParam("pi_x") String pi_x,
							@RequestParam("pi_y") String pi_y,
			StoreDTO dto, Model model, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter script = response.getWriter();
		
		System.out.println("dto-pi_x:"+dto.getPi_x());
		System.out.println("dto-pi_y:"+dto.getPi_y());
		
		System.out.println("pi_x:"+pi_x);
		System.out.println("pi_y:"+pi_y);
		
		int res = dao.insertStore(dto);

		if(res > 0) {
			script.println("<script>");
			script.println("location.href='store_register.do'");
			script.println("</script>");
		} else {
			script.println("<script>");
			script.println("alert('매장 등록 실패.')");
			script.println("history.back()");
			script.println("</script>");
		}
	}
	
	
	
}
