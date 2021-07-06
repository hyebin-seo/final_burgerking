package com.burger.delivery.model;

import java.util.List;

public interface DeliveryDAO {
	public List<DeliveryDTO> gerOrderList(String user_id);
}
