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


$(document).ready(function () {
	
	// 이전(<) 버튼을 클릭했을 때
	/*$(document).on("click", ".btn_prev", function(){*/
	$(".btn_prev").click(function() {
		
		// 
		for(var i=1; i<=5; i++) {
			
			if($(".div"+i).css("display")=="block") {
				if($(".div"+(i-1)).length>0) {
					$(".div"+i).css("display", "none");
					$(".div"+(i-1)).css("display", "block");
				}
			}
		}
		
	});
	
	// 다음(>) 버튼을 클릭했을 때
	/*$(document).on("click", ".btn_next", function(){*/
	$(".btn_next").click(function() {
		
		// 
		for(var i=1; i<=5; i++) {
			
			if($(".div"+i).css("display")=="block") {
				if($(".div"+(i+1)).length>0) {
					$(".div"+i).css("display", "none");
					$(".div"+(i+1)).css("display", "block");
					return;
				}
			}
		}
		
	});
	
});