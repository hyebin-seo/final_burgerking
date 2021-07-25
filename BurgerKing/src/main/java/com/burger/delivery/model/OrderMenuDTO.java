package com.burger.delivery.model;

import lombok.Data;

@Data
public class OrderMenuDTO {
	private int order_menu_no;
	private String order_no;
	private String menu_no;
	private String menu_name;
	private int menu_price;
	private String menu_info;
	private int menu_mount;
	private String detailStr; //재료추가 정보
	private String side;
	private String drink;
	private String cart_no;
	private String menu_img;
}
