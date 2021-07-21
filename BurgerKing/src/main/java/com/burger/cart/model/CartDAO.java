package com.burger.cart.model;

import java.util.List;

public interface CartDAO {
	
	public int insertCart(CartDTO cart);
	public List<CartDTO> cartOpen(CartDTO cart);
	public AllMenuDTO cartMenuOpen(String set_no);
	public AllMenuDTO cartSetOpen(String set_no);
	public int cartDelete(String cart_no);
}
