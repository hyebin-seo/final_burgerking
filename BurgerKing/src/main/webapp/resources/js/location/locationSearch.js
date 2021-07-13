var totalCount_Custom = 0;
var keyword_Custom = "";


//페이지 이동 후 검색어를 변경하는 경우 페이지 값을 1로 초기화
$(".font_s01").on("change keyup paste", function(){
	document.form.currentPage.value=1;
});

//지도보기 버튼 액션
$(document).ready(function () {
	$(document).on("click", "button[class='btn04']", function () {
		var roadAddr_val = $(this).val();

		// 도로명 주소를 좌표 값으로 변환(API)
		naver.maps.Service.geocode({
	        query: roadAddr_val
	    }, function(status, response) {
	        if (status !== naver.maps.Service.Status.OK) {
	            return alert('Something wrong!');
	        }
	
	        var result = response.v2, // 검색 결과의 컨테이너
	            items = result.addresses; // 검색 결과의 배열
	            
	        // 리턴 받은 좌표 값 변수에 저장
	        let x = parseFloat(items[0].x);
	        let y = parseFloat(items[0].y);
	        
	        // 지도 생성
	        var map = new naver.maps.Map('map', {
				center: new naver.maps.LatLng(y, x), //지도를 열 좌표
				zoom: 19
			});
			
	        // 지도에 해당 지역 마커(좌표/아이콘 설정)
	        var markerOptions = {
	        	    position: new naver.maps.LatLng(y, x), //마커 찍을 좌표
	        	    map: map,
	        	    icon: {
	        	        url: 'resources/img/delivery/map_marker.png', //아이콘 경로
	        	        size: new naver.maps.Size(36, 49), //아이콘 사이즈
	        	        origin: new naver.maps.Point(0, 0),
	        	        anchor: new naver.maps.Point(11, 35)
	        	    }
	        	};
	        
	        // 마커 생성
	        var marker = new naver.maps.Marker(markerOptions);
	
	    });

		$(".sub_popWrap").css('display','');
	});
});

//지도보기 끄기
$(".popWrap .btn_close").on("click", function(){
	$(".sub_popWrap").css('display','none');
});


//주소 검색
function getAddr(){
	// 적용예 (api 호출 전에 검색어 체크) 	
	if (!checkSearchedWord(document.form.keyword)) {
		return ;
	}

	$.ajax({
		 url :"https://www.juso.go.kr/addrlink/addrLinkApiJsonp.do"  //인터넷망
		,type:"post"
		,data:$("#form").serialize()
		,dataType:"jsonp"
		,crossDomain:true
		,success:function(jsonStr){
			$("#list").html("");
			var errCode = jsonStr.results.common.errorCode;
			var errDesc = jsonStr.results.common.errorMessage;
			if(errCode != "0"){
				alert(errCode+"="+errDesc);
			}else{
				if(jsonStr != null){
					totalCount_Custom = jsonStr.results.common.totalCount;
					keyword_Custom = $(".font_s01").val();
					makeListJson(jsonStr);
					pageMake(jsonStr);
				}
			}
		}
	    ,error: function(xhr,status, error){
	    	alert("에러발생");
	    }
	});
}

//주소 검색 후 요소 생성
function makeListJson(jsonStr){
	
	var htmlStr2 = "";
	
	// 주소 결과 없으면 nodata div 출력
	if(totalCount_Custom == 0) {
		htmlStr2 += "<div class='result_box'>";
		htmlStr2 += "<div class='nodata'>검색 결과가 없습니다.<br>다시 입력해 주세요.</div>"
		htmlStr2 += "</div>";
	} else {
		// 주소결과 전체 div / 검색 결과 수
		htmlStr2 += "<p class='txt_result'><span><em>"+totalCount_Custom+"</em>개의 검색결과가 있습니다.</span></p>";
		htmlStr2 += "<div class='result_box'>";
		$(jsonStr.results.juso).each(function(){
			//주소 검색 결과 한 건마다 li
			htmlStr2 += "<ul class='addr_list'>";
		    htmlStr2 += "<li>";
		    htmlStr2 += "<p class='keyword'><strong>"+keyword_Custom+"</strong></p>";
		    htmlStr2 += "<p><span>"+this.roadAddr+"</span></p>";
		    htmlStr2 += "<p><em class='txtbox02 st02'>지번</em><span>"+this.jibunAddr+"</span></p>";
		    htmlStr2 += "<button type='button' class='btn_detail'><span>Details</span></button>";
		    htmlStr2 += "<button type='button' class='btn04' value='"+this.roadAddr+"'><span>지도보기</span></button>";
		    htmlStr2 += "</li>";
		    htmlStr2 += "</ul>";
		});
		
		//html()메소드로 초기화된 페이징 div 재부여
		htmlStr2 += "<div class='board_paging'>";
		htmlStr2 += "<div class='VuePagination'>";
		htmlStr2 += "<nav class=''>";
		htmlStr2 += "<ul class='pagination VuePagination__pagination'>";
		htmlStr2 += "</ul>";
		htmlStr2 += "<p class='VuePagination__count' style='display: none;'>0 records</p>";
		htmlStr2 += "</nav>";
		htmlStr2 += "</div>";
		htmlStr2 += "</div>";
		
		htmlStr2 += "</div>"; //resultbox end
	}
	
	$(".address_result").css('display','');
	$(".addr_searchguide").css('display','none');
	$(".address_result").not('.addr_searchguide').html(htmlStr2);
}

//특수문자, 특정문자열(sql예약어의 앞뒤공백포함) 제거
function checkSearchedWord(obj){
	if(obj.value.length >0){
		//특수문자 제거
		var expText = /[%=><]/ ;
		if(expText.test(obj.value) == true){
			alert("특수문자를 입력 할수 없습니다.") ;
			obj.value = obj.value.split(expText).join(""); 
			return false;
		}
		
		//특정문자열(sql예약어의 앞뒤공백포함) 제거
		var sqlArray = new Array(
			//sql 예약어
			"OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", "EXEC",
             		 "UNION",  "FETCH", "DECLARE", "TRUNCATE" 
		);
		
		var regex;
		for(var i=0; i<sqlArray.length; i++){
			regex = new RegExp( sqlArray[i] ,"gi") ;
			
			if (regex.test(obj.value) ) {
			    alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
				obj.value =obj.value.replace(regex, "");
				return false;
			}
		}
	}
	return true ;
}

//엔터키 눌러서 검색
function enterSearch() {
	var evt_code = (window.netscape) ? ev.which : event.keyCode;
	if (window.event.keyCode == 13) {    
		event.keyCode = 0;  
		getAddr(); 
	}
}

//페이지 이동
function goPage(pageNum){
	document.form.currentPage.value=pageNum;
	getAddr();
}

//json타입 페이징 처리 (주소정보 리스트 makeListJson(jsonStr); 다음에서 호출)
function pageMake(jsonStr){ 
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
			
	}	
}

