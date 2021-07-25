package com.burger.coupon.model;

import java.util.List;

public interface CouponDAO {
	
	// 해당 회원아이디 앞으로 쿠폰 발급하는 메소드
	public void insertCoupon(CouponDTO coupon);
	
	// 해당 회원의 쿠폰 리스트 반환하는 메소드
	public List<CouponDTO> getMyCouponList(String user_id);

}
