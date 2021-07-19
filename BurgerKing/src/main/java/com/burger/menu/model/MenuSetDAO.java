package com.burger.menu.model;

import java.util.List;

public interface MenuSetDAO {
	
	public List<String> getMenuNoListInMenuSet();
	
	public List<MenuSetDTO> getMenuSetList(int menu_no);

	public MenuSetDTO getSetDetail(int set_no);
}
