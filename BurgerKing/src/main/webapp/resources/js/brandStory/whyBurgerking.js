$(document).ready(function () {
	
	// 카테고리(li) 선택 시
	$(document).on("click", ".item5 li button", function(){
		
		// ** (다른 카테고리에서는 on클래스 제거)
		// ** 선택한 카테고리에 class="on"을 줌
		$(".item5 li").removeClass("on");
		$(this).parent("li").addClass("on");
		
		var li1 = $(".item5 li:nth-child(1)");
    	var li2 = $('.item5 li:nth-child(2)');
    	var li3 = $('.item5 li:nth-child(3)');
    	var li4 = $('.item5 li:nth-child(4)');
    	var li5 = $('.item5 li:nth-child(5)');
    	
    	if(li1.hasClass('on')) {
    		$(".real").show();		
    		$(".flame_grilled").hide();
    		$(".material").hide();
    		$(".TNT").hide();
    		$(".contribu").hide();
    	}else if(li2.hasClass('on')) {
    		$(".real").hide();		
    		$(".flame_grilled").show();
    		$(".material").hide();
    		$(".TNT").hide();
    		$(".contribu").hide();
    	}else if(li3.hasClass('on')) {
    		$(".real").hide();		
    		$(".flame_grilled").hide();
    		$(".material").show();
    		$(".TNT").hide();
    		$(".contribu").hide();
    	}else if(li4.hasClass('on')) {
    		$(".real").hide();		
    		$(".flame_grilled").hide();
    		$(".material").hide();
    		$(".TNT").show();
    		$(".contribu").hide();
    	}else{
    		$(".real").hide();		
    		$(".flame_grilled").hide();
    		$(".material").hide();
    		$(".TNT").hide();
    		$(".contribu").show();
    	}
		
	});
	
	
});

