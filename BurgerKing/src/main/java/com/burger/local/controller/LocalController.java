package com.burger.local.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.burger.local.model.LocalDAO;
import com.burger.local.model.LocalDTO;

@Controller
public class LocalController {
	
	@Autowired
	private LocalDAO dao;
	
	@RequestMapping("gungu_open.do")
	@ResponseBody
	public HashMap<String, Object> gungu(LocalDTO dto) {

		List<LocalDTO> list = dao.GunguOpen(dto);
		
		HashMap<String, Object> result = new HashMap <String, Object>();
		result.put("gungu", list);
		
		return result;
	}
	
}
