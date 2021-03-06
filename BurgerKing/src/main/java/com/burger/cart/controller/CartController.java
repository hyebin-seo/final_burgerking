package com.burger.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

import com.burger.cart.model.AllMenuDTO;
import com.burger.cart.model.CartDAO;
import com.burger.cart.model.CartDTO;
import com.burger.login.model.UserDTO;
import com.burger.store.model.SearchDTO;
import com.burger.store.model.StoreDTO;

@Controller
public class CartController {
	
	@Autowired
	private CartDAO cartDao;
	
	@RequestMapping("cart.do")
	public String goCart(CartDTO cart, Model model, 
							HttpServletRequest request, 
							HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		UserDTO dto = (UserDTO) session.getAttribute("memberSession");
		PrintWriter script = response.getWriter();
		
		if(dto == null) {
			
			script.println("<script>");
			script.println("location.href='Login.do'");
			script.println("</script>");
			
		} else {
		
			cart.setUser_id(dto.getUser_id());
			
			List<CartDTO> list = cartDao.cartOpen(cart);
			List<Object> menulist = new ArrayList<>();
			
			for(int i=0; i<list.size(); i++) {
				AllMenuDTO amenuDto;
				if(list.get(i).getMenu_flag().equals("single")) {
					amenuDto = cartDao.cartMenuOpen(list.get(i).getSet_no());
				} else {
					amenuDto = cartDao.cartSetOpen(list.get(i).getSet_no());
				}
				amenuDto.setMenu_flag(list.get(i).getMenu_flag());
				menulist.add(amenuDto);
			}
			
			model.addAttribute("cartlist", list);
			model.addAttribute("menulist", menulist);
			
			return "delivery/deliveryCartList";
		}
		
		return null;
	}
	
	@RequestMapping("cart_insert.do")
	public void insertCart(CartDTO cart, HttpServletResponse response) throws IOException {
		
		//cart.setUser_id("?????????");
		
		int res = this.cartDao.insertCart(cart);
		
		PrintWriter script = response.getWriter();

		if(res > 0) {
			script.println("<script>");
			script.println("location.href='cart.do'");
			script.println("</script>");
		} else {
			script.println("<script>");
			script.println("alert('???????????? ?????? ??????')");
			script.println("history.back()");
			script.println("</script>");
		}
	}
	
	@RequestMapping("cartDelete.do")
	@ResponseBody
	public int cartDelete(String cart_no) {

		int res = cartDao.cartDelete(cart_no);
		
		return res;
	}
	
	@RequestMapping("cartAllDelete.do")
	@ResponseBody
	public int cartAllDelete(String user_id) {

		int res = cartDao.cartAllDelete(user_id);
		
		return res;
	}
}
