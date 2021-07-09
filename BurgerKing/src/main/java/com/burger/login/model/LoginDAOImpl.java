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
		
<<<<<<< HEAD
<<<<<<< HEAD
		return this.sqlSession.insert("join_insert", dto);
	}



	@Override
	public UserDTO checkId_pwd(String user_id, String user_pwd) {
		
		
		
		return this.sqlSession.selectOne("user_check", user_id);
=======
		return this.sqlSession.insert("add", dto);
>>>>>>> origin/jun
=======
		return this.sqlSession.insert("add", dto);
>>>>>>> origin/jun
	}

}
