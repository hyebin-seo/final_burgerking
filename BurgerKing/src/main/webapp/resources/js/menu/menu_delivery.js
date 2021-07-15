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


/*var totalCount = 0;
var keyword_Custom = "";*/

// 카테고리에 해당하는 메뉴 가져오기
/*function makeListJson(jsonStr){
	
	var htmlStr = "";
	
	// 메뉴 없으면 nodata div 출력
	if(totalCount == 0) {
		htmlStr += "<div class='nodata'><p><span>메뉴 준비중 입니다</span></p></div>"
		htmlStr += "</div>";
	} else {
		// 메뉴판(딜리버리) 전체 div
		$(jsonStr.results.juso).each(function(){
			//메뉴 검색 결과 하나마다 li
			htmlStr += "<ul class='prdmenu_list'>";
		    htmlStr += "<li>";
		    htmlStr += "<div class='prd_img'><em class=' ico_flag_new'></em>";
		    htmlStr += "<span><img src='"+이미지경로+"' alt='제품' class style='display:inline; opacity:1;'></span></div>";
		    htmlStr += "<div class='cont'>";
		    htmlStr += "<p class='tit'><strong>"+메뉴이름+"</strong></p>";
		    htmlStr += "<p class='set_info'><span>"+this.세트구성+"</span></p>";
		    htmlStr += "<p class='price'><span><strong><em><span>"+this.가격+"</span></em></strong></span></p></div>";
		    htmlStr += "<a class='btn_detail'><span>Details</span></a>";
		    htmlStr += "</li>";
		    htmlStr += "</ul></div>";
		});
		
		//html()메소드로 초기화된 페이징 div 재부여
		htmlStr += "<div class='board_paging'>";
		htmlStr += "<div class='VuePagination'>";
		htmlStr += "<nav class=''>";
		htmlStr += "<ul class='pagination VuePagination__pagination'>";
		htmlStr += "</ul>";
		htmlStr += "<p class='VuePagination__count' style='display: none;'>0 records</p>";
		htmlStr += "</nav>";
		htmlStr += "</div>";
		htmlStr += "</div>";
		
		htmlStr += "</div>"; //resultbox end
		
		count++;
	}
	
	$(".address_result").css('display','');
	$(".addr_searchguide").css('display','none');
	$(".address_result").not('.addr_searchguide').html(htmlStr);	
}*/

//페이지 이동
/*function goPage(pageNum){
	document.form.currentPage.value=pageNum;
	getAddr();
}*/

//json타입 페이징 처리 (주소정보 리스트 makeListJson(jsonStr); 다음에서 호출)
/*function pageMake(jsonStr){ 
  	var total = Number(jsonStr.results.common.totalCount); // 총건수 
	var pageNum = Number(document.form.currentPage.value); // 현재페이지
	var paggingStr = "";
	if(total < 10){
	}else{
		//var PAGEBLOCK=Number(document.form.countPerPage.value);
		var PAGEBLOCK=6; // 하단 페이지 갯수
		var pageSize=Number(document.form.countPerPage.value);
		var totalPages = Math.floor((total-1)/pageSize) + 1;
		var firstPage = Math.floor((pageNum-1)/PAGEBLOCK) * PAGEBLOCK + 1;		
		
		if( firstPage <= 0 ) firstPage = 1;	
		
		var lastPage = firstPage-1 + PAGEBLOCK;
		
		if( lastPage > totalPages ) lastPage = totalPages;		
		
		var nextPage = lastPage+1 ;
		var prePage = firstPage-5 ;	

		if( firstPage > PAGEBLOCK ){
			paggingStr += "<li class='VuePagination__pagination-item page-item  VuePagination__pagination-item-prev-chunk'>";
			paggingStr += "<a href='javascript:goPage("+prePage+");' class='page-link'>&lt;&lt;</a></li>";
		}
		
		for( i=firstPage; i<=lastPage; i++ ){
			if( pageNum == i ) {
				paggingStr += "<li class='VuePagination__pagination-item page-item active'>";
				paggingStr += "<a href='javascript:goPage("+i+");' class='page-link active' role='button'>"+i+"</a></li>";
			} else {
				paggingStr += "<li class='VuePagination__pagination-item page-item'>";
				paggingStr += "<a href='javascript:goPage("+i+");' class='page-link' role='button'>"+i+"</a></li>";
			}
		}		
		if( lastPage < totalPages ){
			paggingStr += "<li class='VuePagination__pagination-item page-item  VuePagination__pagination-item-next-chunk'>";
			paggingStr += "<a href='javascript:goPage("+nextPage+");' class='page-link'>&gt;&gt;</a></li>";
		}
		$(".VuePagination__pagination").html(paggingStr);
			
	} }
*/