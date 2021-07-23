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
		
		// brandStory_menu_카테고리
		var brandStory_menu = $(this).children("span").text();
		
		if(brandStory_menu == "브랜드 스토리"){
			
			location.href = "brandStory.do";
			
		}else if(brandStory_menu == "WHY 버거킹") {
			
			location.href = "whyBurgerking.do";	
			
		}else {		// 가맹점문의
			location.href = "burgerkingNews.do";
		}
		
	});
	
});