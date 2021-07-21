package com.burger.brandStory.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class brandTvDAOImpl implements brandTvDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<brandTvDTO> getTvList() {
		return this.sqlSession.selectList("getTvList");
	}

	@Override
	public brandTvDTO video(int tv_no) {
		return this.sqlSession.selectOne("video", tv_no);
	}

}
