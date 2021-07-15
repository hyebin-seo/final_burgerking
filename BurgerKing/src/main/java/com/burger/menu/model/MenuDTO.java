package com.burger.menu.model;

import lombok.Data;

// 메뉴 테이블

@Data
public class MenuDTO {
	
	private int menu_no;
	private String menu_name;
	private String menu_sentence;
	private String menu_cat;
	private String menu_img;
	private String menu_type;
	private String menu_member;
	private String menu_show;
	private int menu_price;

}
