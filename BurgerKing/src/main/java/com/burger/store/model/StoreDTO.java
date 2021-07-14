package com.burger.store.model;


import lombok.Data;

@Data
public class StoreDTO {
	private String store_key;
	private String store_name;
	private String store_addr;
	private String store_contact;
	private int delivery;
	private int kingorder;
	private int allday;
	private int morning;
	private int parking;
	private int drivethru;
	private String open_time;
	private String delivery_time;
	private String kingorder_time;
	private String pi_x;
	private String pi_y;
}
