package com.burger.store.model;

import java.util.List;

public interface StoreDAO {
	public int insertStore(StoreDTO dto);                // 매장 추가 호출 추상메서드.
	public int updateStore(StoreDTO dto);                // 매장 수정 호출 추상메서드.
	public int deleteStore(int no);                      // 매장 삭제 호출 추상메서드.
	public StoreDTO StoreDetailOpen(String store_key);   // 매장 상세 정보 추상메서드
	public List<StoreDTO> StoreMapSearch(SearchDTO dto);  // 가까운 매장 검색 추상메서드.
	public List<StoreDTO> StoreNameSearch(SearchDTO dto); // 매장명 검색 추상메서드.
	public List<StoreDTO> StoreLocSearch(SearchDTO dto);  // 매장 지역별 검색 추상메서드.
}
