package com.burger.menu.model;

import java.util.List;

public interface MenuDAO {
	
	public List<MenuDTO> getMenuList(String category);

}
