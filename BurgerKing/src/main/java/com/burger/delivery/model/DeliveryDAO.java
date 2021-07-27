package com.burger.delivery.model;

import java.util.List;

public interface DeliveryDAO {
	public List<OrderListDTO> gerOrderList(String user_id);
	public int orderInsert(OrderListDTO dto);
	public int orderMenuInsert(OrderMenuDTO dto);
	public OrderListDTO orderDetailOpen(String order_no);
	public List<OrderMenuDTO> orderMenuOpen(String order_no);
	
	// 회원 탈퇴 시 주문 삭제 메소드 추가
	public void deleteUserOrder(String user_id);
}
