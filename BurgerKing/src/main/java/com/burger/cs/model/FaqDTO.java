package com.burger.cs.model;

import lombok.Data;

@Data
public class FaqDTO {
	private int faq_no; 
	private String faq_title; 
	private String faq_cont; 
	private String faq_kind; 
	private String faq_cate;
}
