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
	public List<DeliveryDTO> gerOrderList(String user_id) {
		return this.sqlSession.selectList("orderList", user_id);
	}
	
}
