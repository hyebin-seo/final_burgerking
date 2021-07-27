package com.burger.login.model;

import com.burger.delivery.model.OrderListDTO;

public interface LoginDAO {
	
	//회원가입
	public int join(UserDTO dto);
	
	//로그인 아이디 비밀번호 확인작업
	public UserDTO checkId_pwd(UserDTO dto);
	
	//회원가입 아이디 중복확인 메서드
	public int idcheck(String user_id);	
	
	//id 찾기 
	public UserDTO find_id(UserDTO dto);
	
	//pwd찾기 
	public UserDTO find_pwd(UserDTO dto);
	
	//pwd 변경하기
	
	public int change_pwd(UserDTO dto);
	
	//sns로 회원가입시 DB 주입
	public int snsJoin(UserDTO dto);
	//sns아이디 확인.
	public UserDTO snsidCheck(UserDTO dto);
	
	
	//비회원 주문 확인 
	
	public OrderListDTO order_check(OrderListDTO dto);
	
	
	// 혜린 추가
	// 핸드폰 번호 바꾸기
	public void change_phoneNo(UserDTO user);
	
	// 회원 탈퇴
	public void deleteUser(String user_id);

}
