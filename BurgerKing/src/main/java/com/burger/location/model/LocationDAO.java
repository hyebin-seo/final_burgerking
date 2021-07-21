package com.burger.location.model;

import java.util.List;

public interface LocationDAO {
	
	public void insertLocation(LocationDTO loc);
	
	public List<LocationDTO> getMyLocationList(String user_id);

	public void deleteLocation(int loc_no);
	
}
