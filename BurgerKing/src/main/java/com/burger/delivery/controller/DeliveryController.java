package com.burger.delivery.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.burger.cart.model.AllMenuDTO;
import com.burger.cart.model.CartDAO;
import com.burger.cart.model.CartDTO;
import com.burger.delivery.model.DeliveryDAO;
import com.burger.delivery.model.DeliveryDTO;
import com.burger.delivery.model.OrderListDTO;
import com.burger.delivery.model.OrderMenuDTO;
import com.burger.delivery.model.OrderMenuListDTO;
import com.burger.login.model.UserDTO;
import com.burger.stamp.model.StampDAO;
import com.burger.store.model.StoreDAO;
import com.burger.store.model.StoreDTO;

@Controller
public class DeliveryController {
	@Autowired
	private DeliveryDAO dao;
	
	@Autowired
	private CartDAO cartDao;
	
	@Autowired
	private StampDAO stampDao;
	
	@Autowired
	private StoreDAO storeDao;
	
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
	
	@RequestMapping("recent_addr.do")
	public void recentAddrSetting(@RequestParam(value="store_name") String store_name,
							   @RequestParam(value="delivery_addr") String delivery_addr,
							   HttpServletRequest request,
							   HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		
		StoreDTO sdto = storeDao.recentStoreOpen(store_name);
		
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
	public String location(Model model, 
			HttpServletRequest request,
			HttpServletResponse response) throws IOException {
			
		HttpSession session = request.getSession();
		UserDTO udto = (UserDTO) session.getAttribute("memberSession");
		PrintWriter script = response.getWriter();
		
		if(udto != null) {
			List<OrderListDTO> olist = dao.gerOrderList(udto.getUser_id());
			model.addAttribute("orderList", olist);
			return "delivery/deliveryLocation";
		} else {
			script.println("<script>");
			script.println("location.href='Login.do'");
			script.println("</script>");
		}
		
		return null;
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
				dto.setCart_no(menuItems[8]);
				dto.setMenu_img(menuItems[9]);
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
	
	@RequestMapping("delivery_order_ok.do")
	public String orderOk(@ModelAttribute(value="OrderMenuListDTO") OrderMenuListDTO omdDTO,
						OrderListDTO orderDto,
						Model model, 
						HttpServletRequest request,
						HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		UserDTO udto = (UserDTO) session.getAttribute("memberSession");
		StoreDTO sdto = (StoreDTO) session.getAttribute("addrSession");
		String delivery_addr = (String) session.getAttribute("delivery_addr");
		PrintWriter script = response.getWriter();
		List<OrderMenuDTO> list = omdDTO.getMenuList();
		
		if(udto != null) {
			
			SimpleDateFormat format1 = new SimpleDateFormat ( "yyMMdd-HHmmss");
			SimpleDateFormat format2 = new SimpleDateFormat ( "yyyy.MM.dd HH:mm:ss");
			Calendar time = Calendar.getInstance();
			String format_time1 = format1.format(time.getTime());
			String order_date = format2.format(time.getTime());
			System.out.println(format_time1);
			
			int randNo = (int)(Math.random() * 10000);
			String order_no = format_time1+"-"+randNo;
			
			orderDto.setOrder_no(order_no);
			orderDto.setOrder_id(udto.getUser_id());
			orderDto.setOrder_addr(delivery_addr);
			orderDto.setOrder_phone(udto.getUser_phone());
			orderDto.setOrder_pwd(udto.getUser_pwd());
			orderDto.setStore_name(sdto.getStore_name());
			orderDto.setStore_phone(sdto.getStore_contact());
			orderDto.setOrder_date(order_date);
			
			int res = dao.orderInsert(orderDto);
			
			if(res > 0) {
				if(omdDTO != null) {
					for(int i=0; i<list.size(); i++) {
						OrderMenuDTO dto = list.get(i);
						dto.setOrder_no(order_no);
						int ires = dao.orderMenuInsert(dto);
						if(ires > 0) {
							cartDao.cartDelete(dto.getCart_no());
						}
					}
				}
			
				model.addAttribute("menulist", list);
				model.addAttribute("orderDTO", orderDto);
				
				stampDao.insertStamp(udto.getUser_id());
				script.println("<script>");
				script.println("location.href='orderDetail.do?no="+order_no+"'");
				script.println("</script>");
			}
			
		
		} else {
			script.println("<script>");
			script.println("location.href='Login.do'");
			script.println("</script>");
		}
		
		return null;
	}
	
	@RequestMapping("orderDetail.do")
	public String orderDetail(@RequestParam("no") String order_no, Model model) {
		
		OrderListDTO orderDto = dao.orderDetailOpen(order_no);
		List<OrderMenuDTO> list = dao.orderMenuOpen(order_no);
		
		model.addAttribute("menulist", list);
		model.addAttribute("orderDTO", orderDto);
		
		return "delivery/deliveryOrderDetail";
	}
	
	@RequestMapping("orderList.do")
	public String orderDetail(Model model, 
							HttpServletRequest request,
							HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		UserDTO udto = (UserDTO) session.getAttribute("memberSession");
		PrintWriter script = response.getWriter();
		
		if(udto != null) {
			List<OrderListDTO> olist = dao.gerOrderList(udto.getUser_id());
			
			for(int i=0; i<olist.size(); i++) {
				List<OrderMenuDTO> mlist = dao.orderMenuOpen(olist.get(i).getOrder_no());
				if(mlist.size() == 1) {
					olist.get(i).setOrder_name(mlist.get(0).getMenu_name());
				} else if(mlist.size() > 1){
					olist.get(i).setOrder_name(mlist.get(0).getMenu_name()+" 외 "+(mlist.size()-1)+"건");
				}
				olist.get(i).setOrder_img(mlist.get(0).getMenu_img());
			}
			
			
			model.addAttribute("orderList", olist);
			
			return "delivery/deliveryOrderList";
		} else {
			script.println("<script>");
			script.println("location.href='Login.do'");
			script.println("</script>");
		}
		
		return null;
	}
	
}
