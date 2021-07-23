package com.burger.cs.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDAOImpl implements FaqDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		return this.sqlSession.selectOne("faqcount");
	}

	@Override
	public List<FaqDTO> getFaqList(PageDTO dto) {
		return this.sqlSession.selectList("faqlist", dto);
	}
	
	@Override
	public List<FaqDTO> getFaqcateList(PageDTO dto) {
		return this.sqlSession.selectList("faqcatelist", dto);
	}

	@Override
	public int getListcateCount(String faq_cate) {
		return this.sqlSession.selectOne("faqcatecount",faq_cate);
	}

	@Override
	public int insertFaq(FaqDTO dto) {
		return this.sqlSession.insert("insertFaq", dto);
	}
}
