package com.burger.store.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDAOImpl implements StoreDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertStore(StoreDTO dto) {
		return this.sqlSession.insert("store_reigster", dto);
	}

	@Override
	public int updateStore(StoreDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteStore(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<StoreDTO> StoreMapSearch(SearchDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StoreDTO> StoreNameSearch(SearchDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StoreDTO> StoreLocSearch(SearchDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
