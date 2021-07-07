package com.burger.cs.model;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDTO {

	private int notice_no;
	private String notice_title;
	private String notice_cont;	
	private int notice_hit;
	private Date notice_regdate;
}
