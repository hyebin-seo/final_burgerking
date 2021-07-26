package com.burger.stamp.model;

import java.util.List;

public interface StampDAO {

	// 해당 회원 아이디 앞으로 스탬프 적립하는 메소드
	public void insertStamp(String user_id);
	
	// 해당 회원의 스탬프 리스트를 반환하는 메소드
	public List<StampDTO> getMyStampList(String user_id);
	
	// 해당 회원 스탬프를 5개 차감하는 메소드
	public void minus5Stamp(String user_id);
	
	// 해당 회원 스탬프를 10개 차감하는 메소드
	public void minus10Stamp(String user_id);
	
	// 탈퇴시 스탬프 삭제
	public void deleteUserStamp(String user_id);
}
