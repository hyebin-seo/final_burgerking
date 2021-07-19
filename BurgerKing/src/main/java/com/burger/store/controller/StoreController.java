package com.burger.store.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.burger.store.model.SearchDTO;
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

		int res = dao.insertStore(dto);

		if(res > 0) {
			script.println("<script>");
			script.println("location.href='store_register.do'");
			script.println("</script>");
		} else {
			script.println("<script>");
			script.println("alert('매장등록실패')");
			script.println("history.back()");
			script.println("</script>");
		}
	}
	
	@RequestMapping("near_store.do")
	@ResponseBody
	public HashMap<String, Object> nearStoreOpen(SearchDTO dto) {

		List<StoreDTO> list = dao.StoreMapSearch(dto);
		
		HashMap<String, Object> result = new HashMap <String, Object>();
		result.put("storeCount", list.size());
		result.put("store", list);
		
		return result;
	}
	
	@RequestMapping("store_detail.do")
	@ResponseBody
	public HashMap<String, Object> storeDetailOpen(SearchDTO dto) {

		StoreDTO sdto = dao.StoreDetailOpen(dto.getStore_key());
		
		HashMap<String, Object> result = new HashMap <String, Object>();
		result.put("store", sdto);
		
		return result;
	}
	
	@RequestMapping("store_name_search.do")
	@ResponseBody
	public HashMap<String, Object> store_name_search(SearchDTO dto) {

		List<StoreDTO> list = dao.StoreNameSearch(dto);
		
		HashMap<String, Object> result = new HashMap <String, Object>();
		result.put("storeCount", list.size());
		result.put("store", list);
		
		return result;
	}
	
	@RequestMapping("city_store.do")
	@ResponseBody
	public HashMap<String, Object> cityStoreOpen(SearchDTO dto) {

		List<StoreDTO> list = dao.StoreLocSearch(dto);
		
		HashMap<String, Object> result = new HashMap <String, Object>();
		result.put("storeCount", list.size());
		result.put("store", list);
		
		return result;
	}
	
	
}
