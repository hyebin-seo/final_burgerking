$(document).ready(function() {
	
	var url = $(location).attr('href');
	var arSplitUrl = url.split("/");    //   "/" 로 전체 url 을 나눈다
	var nArLength = arSplitUrl.length;
	var arFileName = arSplitUrl[nArLength-1];   // 나누어진 배열의 맨 끝 컨트롤러 액션명
	console.log("현재 경로:"+arFileName);
	if(arFileName == "delivery_home.do") {
		addrCheck();
	}
	
	//모바일 햄버거 메뉴 오픈
	$(document).on("click", ".btn_head_menu, .ham_close", function () {
		if($(".headerWrap").hasClass("side_open")) {
			$(".headerWrap").removeClass("side_open");
		} else{
			$(".headerWrap").addClass("side_open");
		}
	});
	
	$(document).on("click", ".headerWrap .GNBWrap>ul>li>button", function () {
		var parent_li = $(this).parent("li");
		
		if(parent_li.hasClass("menu_open")) {
			parent_li.removeClass("menu_open");
		} else{
			parent_li.addClass("menu_open");
		}
	});
		
});

function addrCheck() {
	console.log("배달지 주소 체킹 함수 실행");
	var delivery_addr = $("#head_delivery_addr").val();
	
	if(delivery_addr == "") {
		$(".addrPopWrap").show();
	} else {
		$(".addrPopWrap").hide();
	}
}

function addrWrapHide() {
	$(".addrPopWrap").hide();
}