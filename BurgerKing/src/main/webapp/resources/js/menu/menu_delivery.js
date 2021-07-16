/*$(function() {
	
	// 페이지 들어왔을 때 선택된 카테고리에 클래스 on 줘야함
	$(".item3 li").removeClass("on");
	
	if($(".tab01 .item3 button").children("span").text() == ${category}){
		$(this).parent("li").addClass("on");
	}
	
});*/

// 페이지 로딩 시 전달받은 카테고리에 클래스 on
window.onload = function() {
	
	/*var nowCat = '<c:out value="${category}"/>';*/
	var nowcat = $("#nowcat").val();
	
	if(nowcat == "올데이킹&치킨버거"){
		nowcat="치킨버거";
	}
	
	//alert(nowcat);
	
	$(".item3 li").removeClass("on");
	
	//alert($(".tab01 .item3 li:nth-child(2) .button").children("span").text());
	
	for(var i=1; i<=7; i++){
		if($(".tab01 .item3 li:nth-child("+i+") .button").children("span").text() == nowcat){
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
		
		//alert($(this).children("span").text());
		//console.log($(this).children("span").text());
		//console.log($(".on .button span").text());
		
		var cat = $(this).children("span").text();
		
		// 카테고리명은 "올데이킹&치킨버거"인데 딜리버리 홈에서는 "치킨버거"라고 써야하기 때문에
		// 치킨버거 클릭했을 경우에는 값을 바꿔서 넘겨주어야 함!
		if(cat == '치킨버거'){
			cat = "올데이킹&치킨버거";
		}
		
		// alert(cat);
		
		// get방식일 때 특수문자가 안 넘어가는 문제
		// => POST방식으로 변경(form) OR 특수문자를 코드로 변환
		// & -> %26
		// ** 컨트롤러에 카테고리네임 전달
		location.href=
			'menu_delivery.do?cat='+cat.replace(/&/g,"%26");
		
	});
	
	
	/* 메뉴 선택 시 팝업 관련 */
	// 메뉴 클릭 이벤트 (팝업)
	$(document).on("click", ".btn_detail", function() {
		
		// 메뉴 번호 인자로 전달
		menuSetOpen($(this).children("input").val());
		
	});
	
	$(document).on("click", ".btn_close", function() {
		
		$(".popWrap").remove();
		
	});
	
	
	
	/*$(".popWrap").css("display","none");
	
	$(document).on("click", ".btn_detail", function(){
		$(".popWrap").css("display","");
	});
	
	$(document).on("click", ".btn_close", function(){
		$(".popWrap").css("display","none");
	});*/
	
	//popSetting();
	
	// 클릭한 카테고리(class="on"인 li) 이름을 컨트롤러에 전달
	/*$(".item3 .on .button").on("click", function () {
		
		alert($(this).children("span").text());
		//console.log($(this).children("span").text());
		//console.log($(".on .button span").text());
		
		// get방식일 때 특수문자가 안 넘어가는 문제
		// => POST방식으로 변경(form) OR 특수문자를 코드로 변환
		// & -> %26
		location.href=
			'menu_delivery.do?cat='+$(this).children("span").text().replace(/&/g,"%26");
		
	});*/
});


// 메뉴 세트 정보 불러오기
function menuSetOpen(menu_no) {
	$.ajax({
		url : "menu_detail.do",
		data : {"menu_no" : menu_no},
		type: "post",
		success: function(data){
			setPopupMaking(data);
		},
		error: function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}


function setPopupMaking(jsonStr) {
	
	var menu = jsonStr.setMenu;
	
	var htmlStr = "";
	
	// 세트 메뉴 없으면 바로 장바구니로,,
	// *********** 이건 나중에 ***********
	if(menu != null) {
		htmlStr += "<div class='popWrap m_FullpopWrap'>";
		
		//
		htmlStr += "<div class='popbox01 nobtn'>";
		htmlStr += "<div class='M_headerWrap'>";
		htmlStr += "<div class='titleBar'>";
		htmlStr += "<h1 class='page_tit w_alignL'><span>메뉴 선택</span></h1>";
		htmlStr += "<div class='title_btn'><button type='button' class='btn_close btn_head_close'><span>Close</span></button></div>";
		htmlStr += "</div></div>";
		htmlStr += "<div class='popcont nopadding'>";
		htmlStr += "<div class='prd_intro'>";
		htmlStr += "<div class='prd_img'>";
		htmlStr += "<em class='prd_img'></em><span>이미지</span></div>";
		htmlStr += "<div class='intro_txt'>";
		htmlStr += "<h3 class='tit'><span>메뉴이름</span></h3>";
		htmlStr += "<p class='subtxt'><span>멘트</span></p></div></div>";
		
		htmlStr += "<ul class='menu_sub_list02'>";
		htmlStr += "<li><div class='prd_img'><em class></em>";
		htmlStr += "<span>이미지1</span></div>";
		htmlStr += "<div class='cont'><p class='tit'><strong>세트이름1</strong></p>";
		htmlStr += "<p class='set'><span>구성</span></p>";
		htmlStr += "<p class='price'><strong><em><span>가격</span></em></strong></p></div>";
		htmlStr += "<button type='button' class='btn_detail'><span>Details</span></button>";
		htmlStr += "</li></ul>";
		htmlStr += "</div></div></div>";
		
	}
	
	$("body").append(htmlStr);
}

/*function popSetting() {
	const menu_chosen = document.querySelector(".btn_detail");
	const closeBtn = document.querySelector(".btn_close");
	const popup = document.querySelector(".popWrap");
	
	//주소찾기 팝업 띄우기 액션
	menu_chosen.addEventListener('click', onPopup);
	//searchBtn.addEventListener('click', goPopup);
	//주소찾기 팝업 X버튼 액션
	closeBtn.addEventListener('click', offPopup);
}*/

/*function offPopup() {
	popup.style.display ='none';
}

function onPopup() {
	popup.style.display ='block';
}*/

