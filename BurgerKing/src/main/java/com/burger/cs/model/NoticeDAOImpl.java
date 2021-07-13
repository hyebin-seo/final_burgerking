package com.burger.cs.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int getListCount() {
		
		return this.sqlSession.selectOne("count");
	}

	@Override
	public List<NoticeDTO> getNoticeList(PageDTO dto) {
		
		return this.sqlSession.selectList("list", dto);
	}

	@Override
	public int insertNotice(NoticeDTO dto) {

		return this.sqlSession.insert("add", dto);
	}

	@Override
	public void readCount(int no) {
		
		this.sqlSession.update("read", no);
		
	}

	@Override
	public NoticeDTO noticeCont(int no) {
		
		return this.sqlSession.selectOne("content", no);
	}

	@Override
	public int updateNotice(NoticeDTO dto) {
		
		return this.sqlSession.update("edit", dto);
	}

	@Override
	public int deleteNotice(int no) {
		
		return this.sqlSession.delete("del", no);
	}

	@Override
	public void reSequence(int no) {
		
		this.sqlSession.update("seq", no);
	}

	@Override
	public int searchNoticeCount(String field, String keyword) {
		return this.sqlSession.selectOne("search_count",keyword);
	}

	@Override
	public List<NoticeDTO> searchNoticeList(PageDTO dto) {
		return this.sqlSession.selectList("search_list", dto);
		
	}

	
	
	
	/*
	 * @Override public List<NoticeDTO> searchNoticeList(String field, String
	 * keyword) {
	 * 
	 * return this.sqlSession.selectList(field, keyword); }
	 */	 
	
}
