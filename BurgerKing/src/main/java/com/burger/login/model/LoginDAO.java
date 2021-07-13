package com.burger.login.model;

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
	
	
	

}
