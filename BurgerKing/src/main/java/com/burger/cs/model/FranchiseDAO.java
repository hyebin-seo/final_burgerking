package com.burger.cs.model;

import java.util.List;

public interface FranchiseDAO {
	public int getListCount();                          // 전체 게시물 수를 확인하는 메서드.
	public int insertFranchise(FranchiseDTO dto); 		//프랜차이즈 신청서를 추가하는 추상메서드
	public List<FranchiseDTO> getFranchiseList(PageDTO dto); //프랜차이즈 리스트를 호출하는 추상메서드
	public FranchiseDTO getFranchiseCont(int no);         // 프랜차이즈 신청 상세 내역을 호출하는 메서드
	public int updateFranchise(int no);         // 프랜차이즈 신청 상태 수정 호출 추상메서드.
	public int deleteFranchise(int no);			// 프랜차이즈 신청 삭제 호출 추상메서드 
	public void reFranchiseNO(int no);          // 삭제 시 게시물 번호 재작업 추상메서드.
}
