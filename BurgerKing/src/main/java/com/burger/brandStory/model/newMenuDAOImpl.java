package com.burger.brandStory.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class newMenuDAOImpl implements newMenuDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		return this.sqlSession.selectOne("newMenuCount");
	}
	
	@Override
	public List<newMenuDTO> getNewMenuList(PageDTO dto) {
		return this.sqlSession.selectList("NewMenuList", dto);
	}

	

}
