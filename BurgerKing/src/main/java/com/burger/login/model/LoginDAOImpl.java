package com.burger.login.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAOImpl implements LoginDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	

	@Override
	public int join(UserDTO dto) {
		
		return this.sqlSession.insert("add", dto);
	}

}
