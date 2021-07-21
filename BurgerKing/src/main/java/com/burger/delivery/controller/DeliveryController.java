package com.burger.delivery.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.burger.delivery.model.DeliveryDAO;
import com.burger.delivery.model.DeliveryDTO;

@Controller
public class DeliveryController {
	@Autowired
	private DeliveryDAO dao;
	
	@RequestMapping("delivery_home.do")
	public String moveDelivery(Model model) {
		
		List<DeliveryDTO> orderList = this.dao.gerOrderList("hong");
		
		model.addAttribute("orderList", orderList);
		
		return "delivery/deliveryHome";
	}
	
	@RequestMapping("location.do")
	public String location() {
		
		return "delivery/deliveryLocation";
	}
}
