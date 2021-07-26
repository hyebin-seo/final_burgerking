package com.burger.stamp.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StampDAOImpl implements StampDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	//private StampDAO stampDao;
	
	@Override
	public void insertStamp(String user_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<StampDTO> getMyStampList(String user_id) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("getStampList", user_id);
	}

	@Override
	public void minus5Stamp(String user_id) {
		
		this.sqlSession.update("minus5Stamp", user_id);
	}

	@Override
	public void minus10Stamp(String user_id) {
		
		this.sqlSession.update("minus10Stamp", user_id);
	}

	@Override
	public void deleteUserStamp(String user_id) {
		
		this.sqlSession.delete("deleteUserStamp", user_id);
	}

}
