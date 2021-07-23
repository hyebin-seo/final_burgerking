// 페이지 로딩 시 전달받은 카테고리에 클래스 on
window.onload = function() {
	
	var nowcat = $("#nowcat").val();
	
	//alert(nowcat);
	
	if(nowcat == null) {
		nowcat="스페셜&할인팩";
		
		//getMenuList(nowcat);
		location.href="menu_brand.do?category="+nowcat.replace(/&/g,"%26");
	} 
	
	$(".tab01 li").removeClass("on");
	
	for(var i=1; i<=7; i++){
		if($(".tab01 li:nth-child("+i+") button").children("span").text() == nowcat){
			$(".tab01 li:nth-child("+i+")").addClass("on");
		}
	}
}


$(document).ready(function () {
	
	// 카테고리(li) 선택 시
	$(document).on("click", ".tab01 button", function(){
		
		// (다른 카테고리에서는 on클래스 제거)
		// 선택한 카테고리에 class="on"을 줌
		$(".tab01 li").removeClass("on");
		$(this).parent("li").addClass("on");
		
		var cat = $(this).children("span").text();
		
		// ajax 호출
		//getMenuList(cat);
		
		location.href="menu_brand.do?category="+cat.replace(/&/g,"%26");
		
	});
	
	
	// 메뉴 클릭시 메뉴디테일 페이지로 이동
	$(document).on("click", ".btn_detail", function() {
		
		// 클릭한 메뉴의 메뉴 번호
		var menu_no = $(this).children("input").val();
		
		location.href="go_menuDetail.do?menu_no="+menu_no;
		
	});
	
});

//카테고리 해당 메뉴 리스트 불러오기
function getMenuList(category){
	$.ajax({
		url : "brandMenu_list.do",
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

//카테고리 해당하는 메뉴 리스트 뿌려주는 함수
function menuMaking(jsonStr) {
	
	var list = jsonStr.menuList;
	var cat = jsonStr.category;
	var size = jsonStr.size;
	
	var htmlStr = "";
	
	//htmlStr += "<div class='tab_cont'>";
	htmlStr += "<h4 class='hide'>프리미엄</h4>";
	htmlStr += "<input id='nowcat' type='hidden' value='"+cat+"'>";
	
	htmlStr += "<ul class='prdmenu_list'>";
	
	// 해당하는 메뉴 수만큼 li생성
	$.each(list , function(i, menu){
		htmlStr += "<li>";
		htmlStr += "<div class='prd_img'>";
			
		if(menu.menu_type == "NEW"){
			htmlStr += "<em class='ico_flag_new'></em>";
		}else if(menu.menu_type == "BEST"){
			htmlStr += "<em class='ico_flag_best'></em>";
		}
		
		htmlStr += "<span><img src='"+menu.menu_img+"' class style='display:inline; opacity:1;'></span>";
		htmlStr += "</div>";
		
		htmlStr += "<div class='cont'>";
		htmlStr += "<p class='tit'><strong>"+menu.menu_name+"</strong></p>";
		htmlStr += "</div>";
			
		htmlStr += "<a class='btn_detail'>";
		htmlStr += "<input type='hidden' value='"+menu.menu_no+"'>";
		htmlStr += "<span>Details</span>";
		htmlStr += "</a>";
		htmlStr += "</li>";
		
	});
		
	htmlStr += "</ul></div>";
		
	$(".tab_cont").html(htmlStr);
}