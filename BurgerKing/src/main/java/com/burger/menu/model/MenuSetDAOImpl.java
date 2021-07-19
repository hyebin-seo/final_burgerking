package com.burger.menu.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MenuSetDAOImpl implements MenuSetDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<MenuSetDTO> getMenuSetList(int menu_no) {
		
		return this.sqlSession.selectList("getMenuSetList", menu_no);
	}

	// 세트 메뉴가 있는 메뉴들의 번호를 리스트로 반환
	// (=menu_set 테이블에 있는 menu_no들의 리스트)
	@Override
	public List<String> getMenuNoListInMenuSet() {
		
		return this.sqlSession.selectList("getMenuNoListInMenuSet");
	}
	
	// 세트 메뉴 한 개 정보(menuSetDTO)를 반환
	public MenuSetDTO getSetDetail(int set_no) {
		
		return this.sqlSession.selectOne("getSetDTO", set_no);
	}

}
