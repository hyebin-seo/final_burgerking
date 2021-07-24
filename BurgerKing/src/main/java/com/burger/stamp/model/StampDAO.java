package com.burger.stamp.model;

public interface StampDAO {

	// 해당 회원 아이디 앞으로 스탬프 적립하는 메소드
	public void insertStamp(String user_id);
	
}
