$(document).ready(function () {
	
	// 이전(<) 버튼을 클릭했을 때
	$(document).on("click", ".btn_prev", function(){
		
		// ex. 리스트 사이즈 11개면 div1,2,3까지 잇음
		for(var i=1; i<$(".catMenuListSize").val()/4+1; i++) {
			
			if($(".div"+i).css("display")=="block") {
				if($(".div"+(i-1)).length>0) {
					$(".div"+i).css("display", "none");
					$(".div"+(i-1)).css("display", "block");
				}
			}
		}
		
	});
	
	// 다음(>) 버튼을 클릭했을 때
	$(document).on("click", ".btn_next", function(){
		
		// ex. 리스트 사이즈 11개면 div1,2,3까지 잇음
		for(var i=1; i<$(".catMenuListSize").val()/4+1; i++) {
			
			if($(".div"+i).css("display")=="block") {
				if($(".div"+(i+1)).length>0) {
					$(".div"+i).css("display", "none");
					$(".div"+(i+1)).css("display", "block");
					return;
				}
			}
		}
		
	});
	
	// 같은 카테고리 내 다른 메뉴를 클릭햇을 때 해당 메뉴의 메뉴디테일 페이지로 이동
	$(document).on("click", ".btn_detail", function() {
		
		// 클릭한 메뉴의 메뉴 번호
		var menu_no = $(this).children("input").val();
		
		location.href="go_menuDetail.do?menu_no="+menu_no;
		
	});
		
});