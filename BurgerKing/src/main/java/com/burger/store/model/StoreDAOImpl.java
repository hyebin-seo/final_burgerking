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
		return this.sqlSession.selectList("near_store", dto);
	}

	@Override
	public List<StoreDTO> StoreNameSearch(SearchDTO dto) {
		return this.sqlSession.selectList("store_name_search", dto);
	}

	@Override
	public List<StoreDTO> StoreLocSearch(SearchDTO dto) {
		return this.sqlSession.selectList("city_store", dto);
	}

	@Override
	public StoreDTO StoreDetailOpen(String store_key) {
		return this.sqlSession.selectOne("store_detail", store_key);
	}

	@Override
	public StoreDTO deliveryStoreOpen(SearchDTO dto) {
		return this.sqlSession.selectOne("delivery_store", dto);
	}

	@Override
	public StoreDTO recentStoreOpen(String store_name) {
		return this.sqlSession.selectOne("recent_store_name", store_name);
	}
	

}
