window.onload = function() {
	
	var nowcat = $("#nowcat").val();
	
	$(".item3 li").removeClass("on");
	
	//alert($(".tab01 .item3 li:nth-child(2) .button").children("span").text());
	
	for(var i=1; i<=4; i++){
		if($(".tab01 .item3 li:nth-child("+i+") button").children("span").text() == nowcat){
			$(".tab01 .item3 li:nth-child("+i+")").addClass("on");
		}
	}
	
}

$(document).ready(function () {
	
	// 카테고리(li) 선택 시
	$(document).on("click", ".tab01 .item3 button", function(){
		
		// ** (다른 카테고리에서는 on클래스 제거)
		// ** 선택한 카테고리에 class="on"을 줌
		$(".item3 li").removeClass("on");
		$(this).parent("li").addClass("on");
		
		// cs_카테고리
		var event_menu = $(this).children("span").text();
		
		if(event_menu == "전체"){
			
			location.href = "event_list.do";
			
		}else if(event_menu == "진행중") {
			
			location.href = "event_ing.do";	
			
		}else {
			
			location.href = "event_end.do"; 			
		}		
	});
	
});