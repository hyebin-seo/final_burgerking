package com.burger.event.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.burger.cs.model.PageDTO;

@Repository
public class NStoreDAOImpl implements NStoreDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		return this.sqlSession.selectOne("s_count");
	}

	@Override
	public List<NStoreDTO> getStoreList(PageDTO dto) {
		return this.sqlSession.selectList("s_list", dto);
	}

	@Override
	public int insertStore(NStoreDTO dto) {
		return this.sqlSession.insert("s_add", dto);
	}

	@Override
	public void readCount(int no) {
		this.sqlSession.update("s_read", no);
		
	}

	@Override
	public NStoreDTO storeCont(int no) {
		return this.sqlSession.selectOne("s_content", no);
	}

	@Override
	public int updateStore(NStoreDTO dto) {
		return this.sqlSession.update("s_edit", dto);
	}

	@Override
	public int deleteStore(int no) {
		return this.sqlSession.delete("s_del", no);
	}

	@Override
	public void reSequence(int no) {
		this.sqlSession.update("s_seq", no);
		
	}

	
	

}
