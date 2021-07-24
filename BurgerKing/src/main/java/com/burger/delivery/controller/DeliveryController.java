package com.burger.delivery.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.burger.cart.model.AllMenuDTO;
import com.burger.cart.model.CartDAO;
import com.burger.cart.model.CartDTO;
import com.burger.delivery.model.DeliveryDAO;
import com.burger.delivery.model.DeliveryDTO;
import com.burger.delivery.model.OrderMenuDTO;
import com.burger.login.model.UserDTO;
import com.burger.store.model.StoreDTO;

@Controller
public class DeliveryController {
	@Autowired
	private DeliveryDAO dao;
	
	@Autowired
	private CartDAO cartDao;
	
	@RequestMapping("delivery_home.do")
	public String moveDelivery(Model model, 
							   HttpServletRequest request,
							   HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		UserDTO dto = (UserDTO) session.getAttribute("memberSession");
		PrintWriter script = response.getWriter();
		
		if(dto != null) {
			
			CartDTO cart = new CartDTO();
			cart.setUser_id(dto.getUser_id());
			
			List<CartDTO> list = cartDao.cartOpen(cart);
		
			model.addAttribute("cartlist", list);
			
			return "delivery/deliveryHome";

		} else {
			script.println("<script>");
			script.println("location.href='Login.do'");
			script.println("</script>");
		}
		
		return null;
	}
	
	@RequestMapping("delivery_addr.do")
	public void deliveryAddrSetting(StoreDTO sdto,
							   @RequestParam(value="delivery_addr", required=false) String delivery_addr,
							   HttpServletRequest request,
							   HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		
		session.setAttribute("addrSession", sdto);
		session.setAttribute("delivery_addr", delivery_addr);
		
		PrintWriter script = response.getWriter();
		
		if(sdto != null) {
			script.println("<script>");
			script.println("location.href='delivery_home.do'");
			script.println("</script>");
		} else {
			System.out.println("배달지 저장 오류");
		}
	}
	
	@RequestMapping("location.do")
	public String location() {
		
		return "delivery/deliveryLocation";
	}
	
	@RequestMapping("delivery_order.do")
	public String order(@RequestParam("menuArr") String[] menuArr,
						Model model, 
						HttpServletRequest request,
						HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession();
		List<OrderMenuDTO> list = new ArrayList<>();
		
		if(menuArr != null) {
			for(String menu : menuArr) {
				String[] menuItems = menu.split("\\^");
				OrderMenuDTO dto = new OrderMenuDTO();
				dto.setMenu_no(menuItems[0]);
				dto.setMenu_name(menuItems[1]);
				dto.setMenu_info(menuItems[2]);
				dto.setDetailStr(menuItems[3]);
				dto.setSide(menuItems[4]);
				dto.setDrink(menuItems[5]);
				dto.setMenu_mount(Integer.parseInt(menuItems[6]));
				dto.setMenu_price(Integer.parseInt(menuItems[7]));
				list.add(dto);
			}
		}
		
		UserDTO dto = (UserDTO) session.getAttribute("memberSession");
		PrintWriter script = response.getWriter();
		
		if(dto != null) {
			model.addAttribute("menulist", list);
			return "delivery/deliveryOrder";
		} else {
			script.println("<script>");
			script.println("location.href='Login.do'");
			script.println("</script>");
		}
		
		return null;
	}
}
