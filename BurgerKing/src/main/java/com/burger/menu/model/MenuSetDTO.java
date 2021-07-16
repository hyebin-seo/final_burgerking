package com.burger.menu.model;

import lombok.Data;

// 세트 메뉴 테이블

@Data
public class MenuSetDTO {
	
	private int set_no;
	private int menu_no;
	private String set_name;
	private int set_price;
	private String set_member;
	private String set_img;
	
}
