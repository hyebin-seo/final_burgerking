package com.burger.cart.model;

import lombok.Data;

@Data
public class CartDTO {
	
	private String cart_no;
	private String user_id;
	private String set_no;
	private String ing1;
	private String ing2;
	private String ing3;
	private String ing4;
	private String ing5;
	private String ing6;
	private String ing7;
	private String side;
	private String drink;
	private int amount;
	private int total_price;

}
