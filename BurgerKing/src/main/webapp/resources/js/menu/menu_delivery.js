var form = document.cform;

/*$(function() {
	
	// 페이지 들어왔을 때 선택된 카테고리에 클래스 on 줘야함
	$(".item3 li").removeClass("on");
	
	if($(".tab01 .item3 button").children("span").text() == ${category}){
		$(this).parent("li").addClass("on");
	}
	
});*/

// 페이지 로딩 시 전달받은 카테고리에 클래스 on
window.onload = function() {
	
	var nowcat = $("#nowcat").val();
	
	// 이 부분 추가함!
	if(nowcat == null) {
		nowcat="스페셜&할인팩";
		
		getMenuList(nowcat);
	}
	
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
		//location.href='menu_delivery.do?cat='+cat.replace(/&/g,"%26");
		
		// ajax 호출
		getMenuList(cat);
		
	});
	
	
	/* 메뉴 선택 시 팝업 관련 */
	// 메뉴 클릭 이벤트 (팝업)
	/*$(document).on("click", ".btn_detail", function() {*/
	$(document).on("click", ".prdmenu_list .btn_detail", function() {
		
		// 메뉴 번호 인자로 전달
		menuSetOpen($(this).children("input").val());
		//alert($(this).children("input").val());
		
	});
	
	$(document).on("click", ".btn_close", function() {
		
		$(".popWrap").remove();
		
	});
	
	
	/* 세트 메뉴 클릭시 팝업 */
	$(document).on("click", ".menu_sub_list02 .btn_detail", function() {
		
		// 세트 메뉴 번호 인자로 전달
		menuSideOpen($(this).val());
		//alert($(this).val());
		
	});
	
	$(document).on("click", ".st02 .btn_close", function() {
		
		$(".popWrap").remove();
		
	});
	
	// 음료 선택 후 "선택" 버튼 누르면 음료 번호 저장 후 폼 제출까지
	$(document).on("click", ".pop_btn.c_btn .btn02.drink", function() {
		
		//alert("여기까지 되냐고");
		
		//alert($(".list_chk.drink").children("input").val());
		//alert($(".list_chk.drink input[name=option]:checked").val());
		
		var op_no = $(".list_chk.drink input[name=option]:checked").val();
		
		drinkInsert(op_no);
		
	});
	
	
	/* 세트 단계 선택시 팝업 라지/일반/단품 선택 후 뜨는 팝업창*/
	/*$(document).on("click", ".pop_btn.c_btn.item2 .btn02", function() {*/
	$(document).on("click", ".btn02", function() {
		if($(this).hasClass("drink")) {
			return;
		}
		
		//alert($(this).children("input").val());
		if($(this).children("input").length){ //a
			//alert("세트번호"+$(this).children("input").val().split(",")[0]);
			
			if($(this).children("input").val().split(",")[0] == "단품"){
				form.submit();
			}else{
				sideOptionOpen($(this).children("input").val().split(",")[0], $(this).children("input").val().split(",")[1]);
			}	
		
		}else{ //btn
			console.log("세트번호"+$(this).val().split(",")[1]);
			
			if($(this).val().split(",")[0] == "단품"){
				form.submit();
			}else{
				sideOptionOpen($(this).val().split(",")[0], $(this).val().split(",")[1]);
			}
					
		}
	});
	
	
	// 사이드 선택 후 "선택" 버튼 누르면 사이드 번호 저장
	$(document).on("click", ".pop_btn.c_btn .btn02.side", function() {
		
		var radio = $(".list_chk.side input[name=option]:checked").val();
		
		sideInsert(radio);
		
		sideOptionOpen($(this).val().split(",")[0], $(this).val().split(",")[1]);
		
	})
	
	// 재료 추가 부분
	$(document).on("click", "input[type='checkbox']", function () {
		console.log("지금 클릭한 체크박스:"+$(this).val());
		// 클릭했을 때 체크 상태 => 해제 / 해제 상태 => 체크 로 바뀜!
		if($(this).is(":checked")){
			//$(this).removeAttr("checked");
			//$(this).removeClass("changeImg");
			//alert("-"+$(this).val());
			
//			for(var i=1; i<=7; i++){
//				//alert(i);
//				if($(this).val == i){
//					
//				}
//			}
			//$("input[name='ing"+$(this).val()+"']").val($(this).val());
			console.log($("input[name='ing"+$(this).val()+"']").val());
			var addtext = $(this).siblings('.cont');
			console.log(addtext);
			console.log("재료추가:"+addtext.children('.tit').text());
			$("input[name='ing"+$(this).val()+"']").val(addtext.children('.tit').text());
		} else {
			//$(this).attr("checked", "checked");
			//$(this).addClass("changeImg");
			//alert("+"+$(this).val());
			
//			for(var i=1; i<=7; i++){
//				if($(this).val == i){
//					$("input[name='ing"+$(this).val()+"']").val($(this).val());
//				}
//			}
			$("input[name='ing"+$(this).val()+"']").val("");
			console.log($("input[name='ing"+$(this).val()+"']").val());
			
		}
	});
	
	//var radio = $("input[name='option']:checked").val();
	
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



// 선택한 세트번호 폼 입력
function noInsert(set_no) {
	
	console.log("noInsert세트번호:"+set_no);
	
	$("input[name='set_no']").val(set_no);
	$("input[name='menu_flag']").val("set");
	//form.submit();
}

//선택한 사이드번호 폼 입력
function sideInsert(radio) {
	
	console.log("sideInsert사이드:"+radio);
	
	$("input[name='side']").val(radio.split("^")[0]);
	$("input[name='side_price']").val(radio.split("^")[1]);
	
	//form.submit();
}

//선택한 음료번호 폼 입력(제출)
function drinkInsert(op_no) {
	
	console.log("drinkInsert음료:"+op_no);
	
	$("input[name='drink']").val(op_no.split("^")[0]);
	$("input[name='drink_price']").val(op_no.split("^")[1]);
	form.submit();
	
}


// 카테고리 해당 메뉴 리스트 불러오기
function getMenuList(category){
	$.ajax({
		url : "menu_list.do",
		data : {"category" : category},
		type: "post",
		success: function(data){
			menuMaking(data);
		},
		error: function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

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


function menuSideOpen(set_no) {
	$.ajax({
		url : "menu_side.do",
		data : {"set_no" : set_no},
		type: "post",
		success: function(data){
			sidePopupMaking(data);
			//alert("ahdlf");
		},
		error: function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

// 카테고리 해당하는 메뉴 리스트 뿌려주는 함수
function menuMaking(jsonStr) {
	
	//alert("menuList 받아오는 것까지 되나?");
	
	var list = jsonStr.menuList;
	var menuNoList = jsonStr.menuNoList;
	var cat = jsonStr.category;
	var size = jsonStr.size;
	
	var htmlStr = "";
	
	//htmlStr += "<div class='tab_cont'>";
	htmlStr += "<h4 class='hide'>프리미엄</h4>";
	htmlStr += "<input id='nowcat' type='hidden' value='"+cat+"'>";
	
	// 메뉴 결과 없으면 nodata div
	if(size == 0){
		htmlStr += "<div class='nodata' style=''>";
		htmlStr += "<p><span>메뉴 준비중입니다</span></p>";
		htmlStr += "</div>";
	}else {
		htmlStr += "<ul class='prdmenu_list'>";
		
		$.each(list , function(i, menu){
			htmlStr += "<li>";
			htmlStr += "<div class='prd_img'>";
				
			if(menu.menu_type == "NEW"){
				htmlStr += "<em class='ico_flag_new'></em>";
			}else if(menu.menu_type == "BEST"){
				htmlStr += "<em class='ico_flag_best'></em>";
			}
			
			htmlStr += "<span><img src='"+menu.menu_img+"' alt='제품' class style='display:inline; opacity:1;'></span>";
			htmlStr += "</div>";
			
			htmlStr += "<div class='cont'>";
			htmlStr += "<p class='tit'><strong>"+menu.menu_name+"</strong></p>";
			htmlStr += "<p class='set_info'>";
			
			if(menu.menu_name == "몬스터Ⅱ팩1" || menu.menu_name == "몬스터Ⅱ팩2" || menu.menu_name == "몬스터Ⅱ팩3") {
				htmlStr += "<span>"+menu.menu_member+"</span>";
			}
			
			htmlStr += "</p>";
			
			htmlStr += "<p class='price'>";
			htmlStr += "<span><strong><em><span>&#8361;"+menu.menu_price.toLocaleString();
			
			$.each(menuNoList , function(i, no){
				if(menu.menu_no == no) {
					htmlStr += "~";
				}
			});
			
			htmlStr += "</span></em></strong></span></p></div>";
			htmlStr += "<a class='btn_detail'>";
			htmlStr += "<input type='hidden' value='"+menu.menu_no+"'>";
			htmlStr += "<span>Details</span>";
			htmlStr += "</a>";
			
		});
		
		htmlStr += "</ul></div>";
		
	}
	
	$(".tab_cont").html(htmlStr);
}

// 메뉴판에서 메뉴 클릭했을 때 세트메뉴(라지,세트,단품) 선택하는 팝업
function setPopupMaking(jsonStr) {
	
	var menuDetail = jsonStr.menuDetail;	// 메뉴 상세
	var list = jsonStr.setList;				// 세트메뉴 정보	
	
	//alert(list);
	
	var htmlStr = "";
	
	// 세트 메뉴 없으면 바로 장바구니로,,
	// *********** 이건 나중에 ***********
	if(list.length == 0) {
		console.log("세트 메뉴 x 경우! 장바구니로 바로! 보내주세용~~~~~~");
		
		var form = document.cform;
		$("input[name='set_no']").val(menuDetail.menu_no);
		$("input[name='menu_flag']").val("single");
		form.submit();
		
	}else if(list != null) {
		
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
		
		if(menuDetail.menu_type == "NEW"){
			htmlStr += "<em class='ico_flag_new'></em>";
		}else if(menuDetail.menu_type == "BEST"){
			htmlStr += "<em class='ico_flag_best'></em>";
		}
		
		htmlStr += "<span><img src='"+menuDetail.menu_img+"' alt='제품' class style='display:inline; opacity: 1;'>";
		htmlStr += "</span></div>";
		htmlStr += "<div class='intro_txt'>";
		htmlStr += "<h3 class='tit'><span>"+menuDetail.menu_name+"</span></h3>";
		
		if(menuDetail.menu_sentence != null) {
			htmlStr += "<p class='subtxt'><span>"+menuDetail.menu_sentence+"</span></p></div></div>";
		}else {
			htmlStr += "<p class='subtxt'><span></span></p></div></div>";
		}
		
		htmlStr += "<ul class='menu_sub_list02'>";
		
		$.each(list , function(i, set){
			htmlStr += "<li>";
			htmlStr += "<div class='prd_img'>";
			
			// 세트메뉴에 따로 new, best 주려면 DB 바꿔야함!
			/*if(menuDetail.menu_type == "NEW"){
				htmlStr += "<em class='ico_flag_new'></em>";
			}else if(menuDetail.menu_type == "BEST"){
				htmlStr += "<em class='ico_flag_best'></em>";
			}*/
			
			htmlStr += "<span><img src='"+set.set_img+"' alt='제품' class style='display:inline; opacity:1;'></span></div>";
			htmlStr += "<div class='cont'><p class='tit'><strong>"+set.set_name+"</strong></p>";
			
			if(set.set_member != null) {
				htmlStr += "<p class='set'><span>"+set.set_member+"</span></p>";
			}
			
			htmlStr += "<p class='price'><strong><em><span>&#8361;"+set.set_price.toLocaleString()+"</span></em></strong></p></div>";
			htmlStr += "<button type='button' class='btn_detail' value='"+set.set_no+"'><span>Details</span></button>";
			htmlStr += "</li>";
		});
		
		htmlStr += "</ul>";
		htmlStr += "</div></div></div>";
	}
	
	$("body").append(htmlStr);
}

// 단품->세트 / 세트->라지 업그레이드 여부 물어보는 팝업
function sidePopupMaking(jsonStr) {
	
	var menu = jsonStr.menu;	// 현재 클릭한 세트의 메뉴 정보
	var set = jsonStr.set;		// 현재 세트 DTO 정보
	var up = jsonStr.up;		// 업그레이드 할 세트 정보
	
	//alert(set.set_no);
	
	var htmlStr = "";
	// alert(set.set_no);
	
	// 카테고리가 사이드나 음료&디저트일 경우 세트 업그레이드 옵션이 없음. 클릭한 세트로 바로 장바구니 이동
	if(menu.menu_cat=="사이드" || menu.menu_cat=="음료&디저트" || menu.menu_show == "delivery"){
		console.log("사이드나 음료&디저트/배달only는 클릭한 세트 바로 장바구니로 보내주면 됩니당");
		
		//$("input[name=set_no]").val(set.set_no);
		//alert($("input[name=set_no]").val());
		
		//location.href="cart_insert.do?";
		//var form = document.cform;
		/*var form = $("<form></form>");
		form.attr("name", "form");
		form.attr("method", "post");
		form.attr("action", "cart_insert.do");
		form.append($("<input/>", {type:"hidden", name:"set_no", value:set.set_no}));
		form.appendTo("body");*/
		$("input[name='set_no']").val(set.set_no);
		$("input[name='menu_flag']").val("set");
		form.submit();
		
	// 그 외 카테고리일 경우 업그레이드 팝업
	}else {
		
		//var form = document.cform;
		
		// 라지 세트를 선택했을 경우 바로 사이드 옵션 선택으로
		// indexOf => 인자로 받은 문자의 위치를 인덱스로 반환
		if(set.set_name.indexOf("라지")!=-1) {
			
			// 롱치킨버거 or 치즈버거 or 와퍼종류일때는 먼저 재료추가 팝업
			if(menu.menu_name=="롱치킨버거" || menu.menu_name=="치즈버거" || menu.menu_name.indexOf("와퍼")!=-1){
				
				$("input[name='set_no']").val(set.set_no);
				sideOptionOpen("재료", set.set_no);
			
			// 아닐 경우 바로 사이드L 팝업창
			}else {
				
				$("input[name='set_no']").val(set.set_no);
				//alert(menu.menu_name+"클릭햇다");
				sideOptionOpen("사이드L", set.set_no);
				// return;
			}
			
		
		// 그냥 세트를 클릭했을 경우 라지 세트로 업그레이드 할거냐는 팝업창
		}else if(set.set_name.indexOf("세트")!=-1) {		// "라지"는 없는데 "세트"는 포함한 경우 = R 세트
			
			htmlStr += "<div class='popWrap'>";
			
			//
			htmlStr += "<div class='popbox01'>";
			htmlStr += "<div class='popcont'>";
			htmlStr += "<p class='poptxt01 st02'>";
			htmlStr += "<strong><em>700원</em>만 추가하면<br> 사이드와 음료를 라지 사이즈로<br> 즐기실 수 있어요!<br>업그레이드 하시겠습니까?</strong>";
			htmlStr += "</p>";
			htmlStr += "<div class='prdsetWrap'>";
			htmlStr += "<div class='prd_img'>";
			
			if(up.menu_type == "NEW"){
				htmlStr += "<em class='ico_flag_new'></em>";
			}else if(up.menu_type == "BEST"){
				htmlStr += "<em class='ico_flag_best'></em>";
			}
			
			htmlStr += "<span><img src='"+up.set_img+"' alt='제품' class style='display:inline; opacity: 1;'>";
			htmlStr += "</span></div>";
			htmlStr += "<p class='tit'><strong>"+up.set_name+"</strong></p>";
			
			if(up.set_member != null) {
				htmlStr += "<p class='set'><span>"+up.set_member+"</span></p></div></div>";
			}else {
				htmlStr += "<p class='set'><span></span></p></div></div>";
			}
			
			htmlStr += "<div class='pop_btn c_btn item2'>";
			htmlStr += "<a class='btn02 m_btn01_s dark upgradebtn' onclick=noInsert("+set.set_no+")>";
			
			// 업그레이드 X
			// 롱치킨버거 or 치즈버거 or 와퍼종류일때는 먼저 재료추가 팝업
			if(menu.menu_name=="롱치킨버거" || menu.menu_name=="치즈버거" || menu.menu_name.indexOf("와퍼")!=-1){
				
				htmlStr += "<input type='hidden' value='재료, "+set.set_no+"'>";
			
			// 아닐 경우 사이드R 팝업창
			}else {
				
				htmlStr += "<input type='hidden' value='사이드R, "+set.set_no+"'>";
			}
			
			htmlStr += "<span>아니오</span></a>";
			
			htmlStr += "<a class='btn02 m_btn01_s red upgradebtn' onclick=noInsert("+set.set_no+")>";
			
			// 롱치킨버거 or 치즈버거 or 와퍼종류일때는 먼저 재료추가 팝업
			if(menu.menu_name=="롱치킨버거" || menu.menu_name=="치즈버거" || menu.menu_name.indexOf("와퍼")!=-1){
				
				htmlStr += "<input type='hidden' value='재료, "+set.set_no+"'>";
			
			// 아닐 경우 사이드L 팝업창
			}else {
				
				htmlStr += "<input type='hidden' value='사이드L, "+set.set_no+"'>";
			}
			
			/*htmlStr += "<a onclick=formInsert("+set.set_no+")><span>업그레이드 하기</span></a></a>"*/
			htmlStr += "<span>업그레이드 하기</span></a>";
			htmlStr += "</div></div></div></div>";
		
		// 단품을 선택했을 경우 세트로 업그레이드 할거냐는 팝업창
		}else {
			
			htmlStr += "<div class='popWrap'>";
			
			//
			htmlStr += "<div class='popbox01'>";
			htmlStr += "<div class='popcont'>";
			htmlStr += "<p class='poptxt01 st02'>";
			htmlStr += "<strong><em>"+(up.set_price-set.set_price).toLocaleString()+"원</em>만 추가하면<br> 더 풍성하게 세트로<br> 즐기실 수 있어요!<br>업그레이드 하시겠습니까?</strong>";
			htmlStr += "</p>";
			htmlStr += "<div class='prdsetWrap'>";
			htmlStr += "<div class='prd_img'>";
			
			if(up.menu_type == "NEW"){
				htmlStr += "<em class='ico_flag_new'></em>";
			}else if(up.menu_type == "BEST"){
				htmlStr += "<em class='ico_flag_best'></em>";
			}
			
			htmlStr += "<span><img src='"+up.set_img+"' alt='제품' class style='display:inline; opacity: 1;'>";
			htmlStr += "</span></div>";
			htmlStr += "<p class='tit'><strong>"+up.set_name+"</strong></p>";
			
			if(up.set_member != null) {
				htmlStr += "<p class='set'><span>"+up.set_member+"</span></p></div></div>";
			}else {
				htmlStr += "<p class='set'><span></span></p></div></div>";
			}
			
			htmlStr += "<div class='pop_btn c_btn item2'>";
			htmlStr += "<a class='btn02 m_btn01_s dark upgradebtn' onclick=noInsert("+set.set_no+")>";
			
			htmlStr += "<input type='hidden' value='단품, "+set.set_no+"'>";
			
			htmlStr += "<span>아니오</span></a>";
			htmlStr += "<a class='btn02 m_btn01_s red upgradebtn' onclick=noInsert("+set.set_no+")>";
			
			// 롱치킨버거 or 치즈버거 or 와퍼종류일때는 먼저 재료추가 팝업
			if(menu.menu_name=="롱치킨버거" || menu.menu_name=="치즈버거" || menu.menu_name.indexOf("와퍼")!=-1){
				
				htmlStr += "<input type='hidden' value='재료, "+set.set_no+"'>";
			
			// 아닐 경우 사이드L 팝업창
			}else {
				
				htmlStr += "<input type='hidden' value='사이드R, "+set.set_no+"'>";
			}
			
			htmlStr += "<span>업그레이드 하기</span></a>";
			htmlStr += "</div></div></div></div>";
			
		}
	}

	$(".popWrap").remove();
	$("body").append(htmlStr);
}

//인자로 받은 옵션 카테고리(재료, 사이드l,r, 음료l,r)에 따른 옵션 리스트
function sideOptionOpen(op, set_no) {
	
	//alert(op);
	
	$.ajax({
		url : "menu_option.do",
		data : {"op" : op, "set_no" : set_no},
		type: "post",
		success: function(data){
			optionPopupMaking(data);
		},
		error: function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

// 교환 옵션 팝업(재료, 사이드L,R, 음료L,R)
function optionPopupMaking(jsonStr){
	
	// 먼저 떠있던 팝업창은 삭제~
	$(".popWrap").remove();
	
	var list = jsonStr.optionList;	// 옵션 리스트
	var op = jsonStr.op;			// 옵션 카테고리
	var set = jsonStr.set;
	
	var htmlStr = "";
	
	if(op == "사이드L" || op == "사이드R"){
		
		htmlStr += "<div class='popWrap'>";
		htmlStr += "<div class='popbox01'>";
		htmlStr += "<div class='pop_header01 st02'>";
		htmlStr += "<h1 class='m_cen'><span>사이드 변경</span></h1>";
		htmlStr += "<button type='button' class='btn_close'></button>";
		htmlStr += "</div>";
		htmlStr += "<div class='popcont bg_basic container01'>";
		htmlStr += "<ul class='menu_change'>";
		
		$.each(list , function(i, side){
			
			htmlStr += "<li>";
			htmlStr += "<div class='prd_img'><img src='"+side.op_img+"' alt='사이드'></div>";
			htmlStr += "<div class='cont'>";
			htmlStr += "<p class='tit'><span>"+side.op_name+"</span></p>";
			htmlStr += "<p class='price'><span>+</span><span>"+side.op_price+"</span><span class='unit'>원</span></p>";
			htmlStr += "</div>";
			htmlStr += "<label class='list_chk side'>";
			
			if(i == 0){
				htmlStr += "<input type='radio' name='option' value='"+side.op_name+"^"+side.op_price+"' checked><span>사이드 변경</span></label>";
			}else{
				htmlStr += "<input type='radio' name='option' value='"+side.op_name+"^"+side.op_price+"'><span>사이드 변경</span></label>";
			}
			
			htmlStr += "</li>";
			
		});
		
		htmlStr += "</ul></div>";
		htmlStr += "<div class='pop_btn c_btn'>";
		
		//var radio = $("input[name='option']:checked").val();
		//alert("클릭된 사이드 번호"+radio);
		
		if(set.set_name.indexOf("라지")){
			htmlStr += "<button type='button' class='btn02 red m_btn01_s side' value='음료L,"+set.set_no+"'><span>선택</span></button></div>";
		}else if(set.set_name.indexOf("세트")){
			htmlStr += "<button type='button' class='btn02 red m_btn01_s side' value='음료R,"+set.set_no+"'><span>선택</span></button></div>";
		}
		
		htmlStr += "</div></div></div>";
		
	}else if(op == "재료") {
		
		htmlStr += "<div class='popWrap'>";
		htmlStr += "<div class='popbox01'>";
		htmlStr += "<div class='pop_header01 st02'>";
		htmlStr += "<h1><span>재료를 추가해 더 맛있게 즐겨보세요!</span></h1>";
		htmlStr += "<button type='button' class='btn_close'></button>";
		htmlStr += "</div>";
		htmlStr += "<div class='popcont bg_basic container01'>";
		htmlStr += "<ul class='menu_sub_list check_mode'>";
		
		$.each(list , function(i, ing){
			
			htmlStr += "<li>";
			htmlStr += "<input type='checkbox' title='재료 추가' class='check02' value='"+ing.op_no+"'>";
			htmlStr += "<div class='prd_img'><img src='"+ing.op_img+"' alt='재료'></div>";
			htmlStr += "<div class='cont'>";
			htmlStr += "<p class='tit'><span>"+ing.op_name+"</span></p>";
			htmlStr += "<p class='price'><span>+</span><span>"+ing.op_price.toLocaleString()+"원</span></p>";
			htmlStr += "</div></li>";
			
		});
		
		htmlStr += "</ul></div>";
		htmlStr += "<div class='pop_btn c_btn item2'>";
		
		if(set.set_name.indexOf("라지")){
			htmlStr += "<button type='button' class='btn02 dark m_btn01_s' value='사이드L, "+set.set_no+"'>";
			htmlStr += "<span>추가안함</span></button>";
			
			htmlStr += "<button type='button' class='btn02 red m_btn01_s' value='사이드L, "+set.set_no+"'>";
			htmlStr += "<span>추가하기</span></button></div>";
			
		}else if(set.set_name.indexOf("세트")){
			htmlStr += "<button type='button' class='btn02 dark m_btn01_s' value='사이드R, "+set.set_no+"'>";
			htmlStr += "<span>추가안함</span></button>";
			
			htmlStr += "<button type='button' class='btn02 red m_btn01_s' value='사이드R, "+set.set_no+"'>";
			htmlStr += "<span>추가하기</span></button></div>";
		}
		
		htmlStr += "</div></div></div>";
		
	}else if(op == "음료L" || op == "음료R"){
		
		htmlStr += "<div class='popWrap'>";
		htmlStr += "<div class='popbox01'>";
		htmlStr += "<div class='pop_header01 st02'>";
		htmlStr += "<h1 class='m_cen'><span>음료 변경</span></h1>";
		htmlStr += "<button type='button' class='btn_close'></button>";
		htmlStr += "</div>";
		htmlStr += "<div class='popcont bg_basic container01'>";
		htmlStr += "<ul class='menu_change'>";
		
		$.each(list , function(i, side){
			
			htmlStr += "<li>";
			htmlStr += "<div class='prd_img'><img src='"+side.op_img+"' alt='음료'></div>";
			htmlStr += "<div class='cont'>";
			htmlStr += "<p class='tit'><span>"+side.op_name+"</span></p>";
			htmlStr += "<p class='price'><span>+</span><span>"+side.op_price+"</span><span class='unit'>원</span></p>";
			htmlStr += "</div>";
			htmlStr += "<label class='list_chk drink'>";
			
			if(i == 0){
				htmlStr += "<input type='radio' name='option' checked value='"+side.op_name+"^"+side.op_price+"'><span>사이드 변경</span></label>";
			}else{
				htmlStr += "<input type='radio' name='option' value='"+side.op_name+"^"+side.op_price+"'><span>사이드 변경</span></label>";
			}
			
			htmlStr += "</li>";
			
		});
		
		htmlStr += "</ul></div>";
		htmlStr += "<div class='pop_btn c_btn'>";
		htmlStr += "<button type='button' class='btn02 red m_btn01_s drink'><span>선택</span></button></div>";
		htmlStr += "</div></div></div>";
		
	}else if(op == "단품") {
		
		console.log("장바구니로 바로!");
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

