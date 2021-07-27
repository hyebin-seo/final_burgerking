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

$(document).ready(function () {
	
	// 카테고리(li) 선택 시
	$(document).on("click", ".tab01 .item3 button", function(){
		
		// ** (다른 카테고리에서는 on클래스 제거)
		// ** 선택한 카테고리에 class="on"을 줌
		$(".item3 li").removeClass("on");
		$(this).parent("li").addClass("on");
		
		// brandStory_menu_카테고리
		var brandStory_menu = $(this).children("span").text();
		
		if(brandStory_menu == "버거킹 스토리"){
			
			location.href = "brandStory.do";
			
		}else if(brandStory_menu == "WHY 버거킹") {
			
			location.href = "whyBurgerking.do";	
			
		}else{		// 가맹점문의
			location.href = "burgerkingNews.do";
		}
		
	});
	
});