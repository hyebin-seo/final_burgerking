package com.burger.cs.model;

import java.util.List;

public interface FaqDAO {
	public int getListCount();					 		 //	전체 게시물 수를 확인하는 메서드. 
	public List<FaqDTO> getFaqList(PageDTO dto); 		 // 전체 리스트를 호출하는 추상메서드.
	public List<FaqDTO> getFaqcateList(PageDTO dto); 	 // 전체 리스트를 호출하는 추상메서드.
	public int getListcateCount(String faq_cate);		 //	전체 게시물 수를 확인하는 메서드. 
	public int insertFaq(FaqDTO dto); 					 //	faq추가 하는 추상메서드 
	public FaqDTO getFaqCont(int no);                    // faq 상세 내역 호출 추상메서드.
	public int updateFaq(FaqDTO dto);					 // faq 수정 호출 추상메서드.
	public int deleteFaq(int no);                     	 // faq 삭제 호출 추상메서드.
	public void reFaqNo(int no);                    	 // faq 삭제 시 게시물 번호 재작업 추상메서드.
}
