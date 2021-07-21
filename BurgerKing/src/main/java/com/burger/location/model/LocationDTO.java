package com.burger.location.model;

import lombok.Data;

@Data
public class LocationDTO {
	
	private int loc_no;
	private String user_id;
	private String loc_addr1;
	private String loc_addr2;
	private String loc_addr3;
	private String loc_my;
	private String loc_nickname;
	private String loc_default;

}
