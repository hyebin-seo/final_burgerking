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
}
