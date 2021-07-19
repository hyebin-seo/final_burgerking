package com.burger.cs.model;

import java.util.Date;

import lombok.Data;

@Data
public class NStoreDTO {


	private int store_no;
	private String store_title;
	private String store_cont;	
	private Date store_regdate;
	private String store_image;
	
}
