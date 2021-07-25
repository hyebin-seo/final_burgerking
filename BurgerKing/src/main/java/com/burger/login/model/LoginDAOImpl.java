package com.burger.login.model;

import org.aspectj.apache.bcel.generic.ReturnaddressType;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.burger.delivery.model.OrderListDTO;

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
     //임시 비밀번호 인증후 비밀번호 바꾸기
	@Override
	public int change_pwd(UserDTO dto) {
		
		return this.sqlSession.update("auth_pwd", dto);
	}

	@Override
	public int snsJoin(UserDTO dto) {
		
		return this.sqlSession.insert("snsJoin",dto);
	}
    //카카오 아이디 중복체크
	@Override
	public UserDTO snsidCheck(UserDTO dto) {
		
		return this.sqlSession.selectOne("snsidCheck", dto);
	}

	@Override
	public OrderListDTO order_check(OrderListDTO dto) {
		
		return this.sqlSession.selectOne("order_check", dto);
				
				
	}

}
