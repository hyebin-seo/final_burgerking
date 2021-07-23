$(document).ready(function() {
	// 
	$(document).on("click", ".rcen_btn > ul > li", function () {
		$(".rcen_btn > ul > li").removeClass("on");
		$(this).addClass("on");
		
		$(".payment_tabcont").addClass("w_none");
		$(".payment_tabcont").eq($(this).index()).removeClass("w_none");
	});
	
	$(document).on("click", ".order_accWrap .btn_orderacc .txt", function () {
		if($(this).hasClass("close")) {
			$(this).removeClass("close");
		} else {
			$(this).addClass("close");
		}
		
		//if($(this))
		
	});
	
	
	
	$(".easy_payment_list .naver label>input").prop("checked",true);
});