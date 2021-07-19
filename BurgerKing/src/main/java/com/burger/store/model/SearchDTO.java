package com.burger.store.model;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class SearchDTO {
	private String store_key;
	private String store_name;
	private String store_addr;
	private String store_contact;
	private int delivery; 		//매장옵션-딜리버리
	private int kingorder; 		//매장옵션-킹오더
	private int allday; 		//매장옵션-24시간매장
	private int morning; 		//매장옵션-아침메뉴
	private int parking; 		//매장옵션-주차
	private int drivethru;		//매장옵션-드라이브스루
	private String[] checking;	// 매장옵션 전체 체크 여부 문자열
	private String myLocation; 	// 현 위치
	private String storeName; 	// 매장명
	private String city; 		// 특별/광역시
	private String gungu; 		// 군, 구
	private BigDecimal pi_x;	// x좌표
	private BigDecimal pi_y;	// y좌표
}
