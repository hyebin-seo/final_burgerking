package com.burger.stamp.model;

import lombok.Data;

@Data
public class StampDTO {
	
	private int stamp_no;		// 스탬프 번호(pk)
	private String user_id;		// 회원 아이디
	private int stamp_count;	// 회원이 소유한 스탬프 개수
	
}
