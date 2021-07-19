package com.burger.cart.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void insertCart(CartDTO cart) {
		
		this.sqlSession.insert("insertCart", cart);
	}

}
