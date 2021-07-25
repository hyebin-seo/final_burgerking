$(function(){
	
	// 쿠폰받기 버튼 클릭 이벤트
	$(".getCoupon").click(function() {
		
		var coupon_type = $(this).val();
		
		getCoupon(coupon_type);
		
	});
	
	
});


function getCoupon(coupon_type) {
	location.href="insert_coupon.do?coupon_type="+coupon_type;
}