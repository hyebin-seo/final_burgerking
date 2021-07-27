package com.burger.coupon.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CouponDAOImpl implements CouponDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertCoupon(CouponDTO coupon) {
		
		this.sqlSession.insert("insertCoupon", coupon);
	}

	@Override
	public List<CouponDTO> getMyCouponList(String user_id) {
		
		return this.sqlSession.selectList("couponList", user_id);
	}

	// 탈퇴시 쿠폰 삭제
	@Override
	public void deleteUserCoupon(String user_id) {
		
		this.sqlSession.delete("deleteUserCoupon", user_id);
	}
	
}
