package com.burger.delivery.model;

import java.util.List;

public interface DeliveryDAO {
	public List<DeliveryDTO> gerOrderList(String user_id);
	public int orderInsert(OrderListDTO dto);
	public int orderMenuInsert(OrderMenuDTO dto);
	public OrderListDTO orderDetailOpen(String order_no);
	public List<OrderMenuDTO> orderMenuOpen(String order_no);
}
