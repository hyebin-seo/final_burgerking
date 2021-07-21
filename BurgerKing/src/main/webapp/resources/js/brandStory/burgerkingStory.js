$(document).ready(function () {
	
	// 카테고리(li) 선택 시
	$(document).on("click", ".tab_storyBtn li button", function(){
		
		// ** (다른 카테고리에서는 on클래스 제거)
		// ** 선택한 카테고리에 class="on"을 줌
		$(".tab_storyBtn li").removeClass("on");
		$(this).parent("li").addClass("on");
		
		var li1 = $(".tab_storyBtn li:nth-child(1)");
    	var li2 = $('.tab_storyBtn li:nth-child(2)');
    	
    	if(li1.hasClass('on')) {
    		$(".tab_aboutCon").show();		
    		$(".tab_historyWrap").hide();
    	}else {
    		$(".tab_aboutCon").hide();
    		$(".tab_historyWrap").show();
    	}
		
	});
	
	
});