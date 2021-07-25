package com.burger.delivery.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DeliveryDAOImpl implements DeliveryDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<OrderListDTO> gerOrderList(String user_id) {
		return this.sqlSession.selectList("orderList_open", user_id);
	}

	@Override
	public int orderInsert(OrderListDTO dto) {
		return this.sqlSession.insert("order_insert", dto);
	}

	@Override
	public int orderMenuInsert(OrderMenuDTO dto) {
		return this.sqlSession.insert("order_menu_insert", dto);
	}

	@Override
	public OrderListDTO orderDetailOpen(String order_no) {
		return this.sqlSession.selectOne("order_detail_open", order_no);
	}

	@Override
	public List<OrderMenuDTO> orderMenuOpen(String order_no) {
		return this.sqlSession.selectList("order_menu_list", order_no);
	}
	
}
