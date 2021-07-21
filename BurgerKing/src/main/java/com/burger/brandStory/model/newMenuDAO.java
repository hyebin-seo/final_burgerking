package com.burger.brandStory.model;

import java.util.List;

public interface newMenuDAO {
	public int getListCount();					 //전체 게시물 수를 확인하는 메서드. 
	public List<newMenuDTO> getNewMenuList(PageDTO dto); // 신제품 리스트를 호출하는 추상메서드
}
