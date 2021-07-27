package com.burger.event.model;

import java.util.List;

import com.burger.cs.model.PageDTO;



public interface EventDAO {

	public int getListCount();                          // 전체 게시물 수를 확인하는 메서드.
	public int getListCount2();                          // 전체 게시물 수를 확인하는 메서드.
	public int getListCount3();                          // 전체 게시물 수를 확인하는 메서드.
	public List<EventDTO> getEventList(PageDTO dto);    // 전체 리스트를 호출 추상메서드. 
	public List<EventDTO> getEventList2(PageDTO dto);    // 진행중인 리스트를 호출 추상메서드. 
	public List<EventDTO> getEventList3(PageDTO dto);    // 종료된 리스트를 호출 추상메서드. 
	public int insertEvent(EventDTO dto);               // 게시물 추가 호출 추상메서드.
	public void readCount(int no);                      // 조회수를 증가시키는 추상메서드.
	public EventDTO eventCont(int no);                  // 게시물 상세 내역 호출 추상메서드.
	public int updateEvent(EventDTO dto);               // 게시물 수정 호출 추상메서드.
	public int deleteEvent(int no);                     // 게시물 삭제 호출 추상메서드.
	public void reSequence(int no);                     // 삭제 시 게시물 번호 재작업 추상메서드.

}
