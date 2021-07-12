package com.burger.login.model;

public interface LoginDAO {
	
	public int join(UserDTO dto);
	
	public UserDTO checkId_pwd(String user_id, String user_pwd);
	
	public int idcheck(String user_id);
}
