package com.burger.cart.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertCart(CartDTO cart) {
		
		return this.sqlSession.insert("insertCart", cart);
	}

	@Override
	public List<CartDTO> cartOpen(CartDTO cart) {
		return this.sqlSession.selectList("cart_open", cart);
	}

	@Override
	public AllMenuDTO cartMenuOpen(String set_no) {
		return this.sqlSession.selectOne("cart_menu_open", set_no);
	}

	@Override
	public AllMenuDTO cartSetOpen(String set_no) {
		return this.sqlSession.selectOne("cart_set_open", set_no);
	}

	@Override
	public int cartDelete(String cart_no) {
		return this.sqlSession.delete("cart_delete", cart_no);
	}

	@Override
	public int cartAllDelete(String user_id) {
		return this.sqlSession.delete("cart_all_delete", user_id);
	}

}
