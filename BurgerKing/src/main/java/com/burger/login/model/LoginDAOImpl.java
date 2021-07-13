package com.burger.login.model;

import org.aspectj.apache.bcel.generic.ReturnaddressType;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int join(UserDTO dto) {

		return this.sqlSession.insert("join_insert", dto);
	}

	@Override
	public UserDTO checkId_pwd(UserDTO dto) {

		return this.sqlSession.selectOne("user_check", dto);
	}

	// 아이디 중복체크
	@Override
	public int idcheck(String user_id) {

		return this.sqlSession.selectOne("idcheck", user_id);
	}

	// 아이디 찾기
	@Override
	public UserDTO find_id(UserDTO dto) {

		return this.sqlSession.selectOne("find_id", dto);
	}

	// 비밀번호 찾기
	@Override
	public UserDTO find_pwd(UserDTO dto) {
		
		return this.sqlSession.selectOne("find_pwd", dto);
	}

}
