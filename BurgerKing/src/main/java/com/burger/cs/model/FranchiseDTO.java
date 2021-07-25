package com.burger.cs.model;

import lombok.Data;

@Data
public class FranchiseDTO {
	private int fran_no; 
	private String fran_name; 
	private String fran_birth; 
	private String year; 
	private String month; 
	private String day; 
	private String fran_phone; 
	private String fran_email; 
	private String fran_city; 
	private String fran_gu; 
	private String fran_possession;  //임대차 목적물 보유 유무 
	private String fran_area;  // 임대차 목적물 면적
	private String area_no; // 면적 크기 
	private String area; // 면적(제곱/평)
	private String fran_job; 
	private String fran_opinion; // 추가 의견
	private String fran_regdate; // 신청일 
	private String fran_status; // 상태 (접수 완료가 기본 값)
}
