package com.burger.delivery.model;

import lombok.Data;

@Data
public class OrderListDTO {
	private String order_no;
	private String order_id;
	private String order_addr;
	private String order_phone;
	private String order_pwd;
	private String store_name;
	private int order_price;
	private int pay_price;
	private String pay_way;
	private String pay_coupon;
	private String order_date;
	private String order_claim;
}
