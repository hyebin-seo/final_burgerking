package com.burger.cart.model;

import lombok.Data;

@Data
public class AllMenuDTO {
	private String menu_flag;
	private int menu_no;
	private String menu_name;
	private String menu_sentence;
	private String menu_cat;
	private String menu_img;
	private String menu_type;
	private String menu_member;
	private String menu_show;
	private int menu_price;
	//여기부터 세트메뉴
	private int set_no;
	//private int menu_no;
	private String set_name;
	private int set_price;
	private String set_member;
	private String set_img;
}
