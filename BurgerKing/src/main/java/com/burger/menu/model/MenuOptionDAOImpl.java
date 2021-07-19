package com.burger.menu.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MenuOptionDAOImpl implements MenuOptionDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MenuOptionDTO> getMenuOptionList(String op_cat) {
		
		//System.out.println(op_cat+"impl 클래스까지 넘어오니?ㅜ");
		
		return this.sqlSession.selectList("sideList", op_cat);
	}
	
	

}
