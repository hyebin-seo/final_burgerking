package com.burger.menu.model;

import java.util.List;

public interface MenuOptionDAO {
	
	public List<MenuOptionDTO> getMenuOptionList(String op_cat);

}
