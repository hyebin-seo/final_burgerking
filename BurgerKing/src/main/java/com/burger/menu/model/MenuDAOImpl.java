package com.burger.menu.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MenuDAOImpl implements MenuDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<MenuDTO> getMenuList(String category) {
		
		return this.sqlSession.selectList("menuList", category);
	}

}
