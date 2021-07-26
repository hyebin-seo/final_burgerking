package com.burger.cs.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class QnaDAOImpl implements QnaDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		return this.sqlSession.selectOne("q_count");
	}

	@Override
	public List<QnaDTO> getQnaList(PageDTO dto) {
		
		return this.sqlSession.selectList("q_list", dto);
	}

	@Override
	public int insertQna(QnaDTO dto) {
		return this.sqlSession.insert("q_add", dto);
	}

	@Override
	public QnaDTO qnaCont(int no) {
		return this.sqlSession.selectOne("q_content", no);
	}



	@Override
	public int updateQna(int qna_no) {
		return this.sqlSession.update("q_edit", qna_no);
	}


}
