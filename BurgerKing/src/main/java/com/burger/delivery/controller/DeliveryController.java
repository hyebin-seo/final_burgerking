package com.burger.delivery.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.burger.delivery.model.DeliveryDAO;
import com.burger.delivery.model.DeliveryDTO;
import com.burger.login.model.UserDTO;

@Controller
public class DeliveryController {
	@Autowired
	private DeliveryDAO dao;
	
	@RequestMapping("delivery_home.do")
	public String moveDelivery(Model model, 
								HttpServletRequest request,
								HttpServletResponse response) throws IOException {
		
		List<DeliveryDTO> orderList = this.dao.gerOrderList("hong");
		
		model.addAttribute("orderList", orderList);
		
		HttpSession session = request.getSession();
		UserDTO dto = (UserDTO) session.getAttribute("memberSession");
		PrintWriter script = response.getWriter();
		
		if(dto != null) {
			return "delivery/deliveryHome";
		} else {
			script.println("<script>");
			script.println("location.href='Login.do'");
			script.println("</script>");
		}
		
		return null;
	}
	
	@RequestMapping("location.do")
	public String location() {
		
		return "delivery/deliveryLocation";
	}
}
