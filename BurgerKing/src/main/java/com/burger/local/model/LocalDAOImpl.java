package com.burger.local.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LocalDAOImpl implements LocalDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<LocalDTO> GunguOpen(LocalDTO dto) {
		return this.sqlSession.selectList("gungu_open", dto);
	}

}
