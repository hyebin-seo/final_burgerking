const toggleBtn = document.querySelector(".delivery_navbar_toggleBtn");
const menu = document.querySelector(".delivery_navbar_menu_div");
const closeDiv = document.querySelector(".menu_div_close");

//햄버거 버튼을 클릭하면 메뉴 출력
toggleBtn.addEventListener('click', onClick);
//메뉴 안의 X버튼 클릭시 메뉴 숨김
closeDiv.addEventListener('click', offClick);

function onClick() {
	menu.style.display ='block';
}

function offClick() {
	menu.style.display ='none';
}

$(document).ready(function() {
	
	var url = $(location).attr('href');
	var arSplitUrl = url.split("/");    //   "/" 로 전체 url 을 나눈다
	var nArLength = arSplitUrl.length;
	var arFileName = arSplitUrl[nArLength-1];   // 나누어진 배열의 맨 끝 컨트롤러 액션명
	console.log("현재 경로:"+arFileName);
	if(arFileName == "delivery_home.do") {
		addrCheck();
	}
		
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