package com.burger.cs.model;

import java.util.List;



public interface QnaDAO {

	public int getListCount();                     // 전체 게시물 수를 확인하는 메서드.
	public List<QnaDTO> getQnaList(PageDTO dto);    // 전체 리스트를 호출 추상메서드. 
	public int insertQna(QnaDTO dto);               // 게시물 추가 호출 추상메서드.	
	public QnaDTO qnaCont(int no);                  // 게시물 상세 내역 호출 추상메서드.
	/*public int updateQna(QnaDTO dto);               // 게시물 수정 호출 추상메서드.	
	 * public int deleteQna(int no); // 게시물 삭제 호출 추상메서드. public void
	 * reSequence(int no); // 삭제 시 게시물 번호 재작업 추상메서드. public int
	 * searchQnaCount(String field, String keyword); // 검색된 내용에 대한 촐 게시물 수 확인
	 * 추상메서드. public List<QnaDTO> searchQnaList(PageDTO dto); // 게시물 검색 호출
	 * 추상메서드.
	 */	
	//public List<QnaDTO> searchQnaList(String field, String keyword);

	// 혜린 추가 : 탈퇴시 문의 삭제
	public void deleteUserQna(String user_id);
} 
