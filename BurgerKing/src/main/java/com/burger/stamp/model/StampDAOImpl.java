package com.burger.stamp.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StampDAOImpl implements StampDAO {

	@Autowired
	private StampDAO stampDao;
	
	@Override
	public void insertStamp(String user_id) {
		// TODO Auto-generated method stub
		
	}

}
