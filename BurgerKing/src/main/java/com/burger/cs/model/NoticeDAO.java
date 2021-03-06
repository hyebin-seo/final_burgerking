package com.burger.cs.model;

import java.util.List;



public interface NoticeDAO {

	public int getListCount();                          // 전체 게시물 수를 확인하는 메서드.
	public List<NoticeDTO> getNoticeList(PageDTO dto);    // 전체 리스트를 호출 추상메서드. 
	public int insertNotice(NoticeDTO dto);               // 게시물 추가 호출 추상메서드.
	public void readCount(int no);                      // 조회수를 증가시키는 추상메서드.
	public NoticeDTO noticeCont(int no);                  // 게시물 상세 내역 호출 추상메서드.
	public int updateNotice(NoticeDTO dto);               // 게시물 수정 호출 추상메서드.
	public int deleteNotice(int no);                     // 게시물 삭제 호출 추상메서드.
	public void reSequence(int no);                     // 삭제 시 게시물 번호 재작업 추상메서드.
	public int searchNoticeCount(String field, String keyword);  // 검색된 내용에 대한 촐 게시물 수 확인 추상메서드.
	public List<NoticeDTO> searchNoticeList(PageDTO dto); // 게시물 검색 호출 추상메서드.
	//public List<NoticeDTO> searchNoticeList(String field, String keyword);
} 
