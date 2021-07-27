package com.burger.cs.model;

import java.util.List;

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

	@Override
	public int getListCount() {
		return this.sqlSession.selectOne("FranchiseCount");
	}

	@Override
	public List<FranchiseDTO> getFranchiseList(PageDTO dto) {
		return this.sqlSession.selectList("FranchiseList", dto);
	}
	
	@Override
	   public FranchiseDTO getFranchiseCont(int no) {
	      return this.sqlSession.selectOne("franchiseCont", no);
	   }

	@Override
	public int updateFranchise(int no) {
		return this.sqlSession.update("francshieUpdate", no);
	}

	@Override
	public int deleteFranchise(int no) {
		return this.sqlSession.delete("franchiseDelete", no);
	}

	@Override
	public void reFranchiseNO(int no) {
		this.sqlSession.update("reFranchiseNO", no);
		
	}
}
