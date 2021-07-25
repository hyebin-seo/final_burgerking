package com.burger.delivery.model;

import java.util.List;

import lombok.Data;

@Data
public class OrderMenuListDTO {
	private List<OrderMenuDTO> menuList;
}
