package com.burger.menu.model;

import java.util.List;

public interface MenuDAO {
	
	// 카테고리에 해당하는 메뉴 리스트 반환
	public List<MenuDTO> getMenuList(String category);
	
	// 메뉴 번호에 해당하는 메뉴 정보 반환(menu 테이블)
	public MenuDTO getMenuDetail(int menu_no);

}
