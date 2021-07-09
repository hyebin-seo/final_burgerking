package com.burger.cs.model;

import java.util.List;

public interface FaqDAO {
	public int getListCount();					 //전체 게시물 수를 확인하는 메서드. 
	public List<FaqDTO> getFaqList(PageDTO dto); // 전체 리스트를 호출하는 추상메서드.
	public List<FaqDTO> getFaqcateList(PageDTO dto); // 전체 리스트를 호출하는 추상메서드.
	public int getListcateCount(String faq_cate);					 //전체 게시물 수를 확인하는 메서드. 
}
