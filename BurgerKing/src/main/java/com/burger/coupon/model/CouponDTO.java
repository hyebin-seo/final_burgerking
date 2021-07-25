package com.burger.coupon.model;

import lombok.Data;

@Data
public class CouponDTO {
	private int coupon_no;
	private String user_id;
	private String coupon_date;		// 쿠폰 발급일
	private String coupon_type;		// 쿠폰 종류(5쿠폰OR10쿠폰)
}
