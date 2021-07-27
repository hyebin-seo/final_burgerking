package com.burger.location.model;

import java.util.List;

public interface LocationDAO {
	
	public void insertLocation(LocationDTO loc);
	
	public List<LocationDTO> getMyLocationList(String user_id);

	public void deleteLocation(int loc_no);
	
	public void noDefaultLoc(String user_id);
	
	public void setDefaultLoc(int loc_no);
	
	public void changeLocName(LocationDTO loc);
	
	public void deleteUserLoc(String user_id);
	
}
