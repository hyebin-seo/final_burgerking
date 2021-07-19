package com.burger.cs.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FranchiseDAOImpl implements FranchiseDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	@Override
	public int insertFranchise(FranchiseDTO dto) {
		return this.sqlSession.insert("fran_add", dto);
	}

}
