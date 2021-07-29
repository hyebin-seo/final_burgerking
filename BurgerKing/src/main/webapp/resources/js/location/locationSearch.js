var totalCount_Custom = 0;
var keyword_Custom = "";

var form = document.lform;

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
	        	        url: 'resources/img/delivery/home_marker.png', //아이콘 경로
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
$(".sub_popWrap .btn_close").on("click", function(){
	//$(".popWrap").css('display','none');
	$(".sub_popWrap").hide();
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

//도로명 주소를 좌표 값으로 변환(API)
function addrChange(roadAddr_val) {
	
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
        
        $.ajax({
            url : "delivery_store.do",
            data : { "pi_x": y, "pi_y": x },
            type : "post",
            //async : false,
            success : function(data){
            	if(data.store != null) {
            		goDelivery(data, roadAddr_val);
            	} else {
            		alert("해당 배달지에 딜리버리 가능한 지점이 없습니다.");
            	}
            },
            error : function(request,status,error){
            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
        
    });

}

//배달지 세션 저장 호출
function goDelivery(data, roadAddr) {
	
	var store = data.store;
	
	var storeForm = document.storeForm;
	console.log("상세 주소:"+addr3);
	
	$(".store_key").val(store.store_key);
	$(".store_name").val(store.store_name);
	$(".store_addr").val(store.store_addr);
	$(".store_contact").val(store.store_contact);
	$(".pi_x").val(store.pi_x);
	$(".pi_y").val(store.pi_y);
	$(".delivery_addr").val(roadAddr+"\, "+addr3);
	
	storeForm.submit();
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

//최근 배달지로 배달지 설정
function recentAddrSetting(store_name, delivery_addr) {
	var newForm = document.createElement('form'); 
	
	newForm.name = 'newForm'; 
	newForm.method = 'post'; 
	newForm.action = 'recent_addr.do'; 
	
	var input1 = document.createElement('input');
	var input2 = document.createElement('input');
	
	input1.setAttribute("type", "hidden");
	input1.setAttribute("name", "store_name");
	input1.setAttribute("value", store_name);
	
	input2.setAttribute("type", "hidden");
	input2.setAttribute("name", "delivery_addr");
	input2.setAttribute("value", delivery_addr); 

	newForm.appendChild(input1);
	newForm.appendChild(input2);
	
	document.body.appendChild(newForm);
	
	newForm.submit();
}

var addr1;
var addr2;
var addr3;

$(document).ready(function () {
	
	// 상세 주소 입력란 변화 감지
	$(document).on("propertychange change keyup paste input", "input[class='addr3']", function () {
		
		if($(".addr3").val().length!=0){
			$(".btn_del01").css("display","");
			$(".btn02").prop("disabled", false);
			$(".full_type>.btn02").addClass("red");
			addr3 = $(".addr3").val();
		}else{
			$(".btn_del01").css("display","none");
			$(".btn02").prop("disabled", true);
			$(".full_type>.btn02").removeClass("red");
		}
			
	});
	
	// 클릭한 버튼의 주소를 가져오는 함수(도로명 주소, 지번 주소)
	$(document).on("click", "button[class='btn_detail']", function () {

		addr1 = $(this).siblings("p").eq(1).children("span").text();
		addr2 = $(this).siblings("p").eq(2).children("span").text();
		console.log(addr1);
		console.log(addr2);
		
		// 선택한 주소 보이게
		$(".addr_detail").show();
		
		//$(".addrbox dl:nth-child(1) dd span").html(addr1);
		//$(".addrbox dl:nth-child(2) dd span").html(addr2);
		$(".srchaddrPop .addrbox dd").eq(0).html("<span>"+addr1+"</span>");
		$(".srchaddrPop .addrbox dd").eq(1).html("<span>"+addr2+"</span>");
		
		$(".srchaddrPop").scrollTop($(document).height());
		
	});
	
	// MY배달지 체크 관련 이벤트
	$(document).on("click", "span[class='addLoc']", function () {
		
		if($(".chk_my .check02").is(":checked")){
			//$(".chk_my .check02").removeAttr("checked");
			$(".check02").removeClass("chekimg");
		} else {
			//$(".chk_my .check02").attr("checked", "checked");
			$(".check02").addClass("chekimg");
		}
	});
	
	// '이 주소로 배달지 설정' 버튼 클릭 이벤트, MY배달지 등록 체크 시 별칭 지정 div display
	$(".btn02").on("click", function() {
		
		// 폼에 도로명주소, 지번주소, 상세주소 값 입력
		$("input[name='loc_addr1']").val($(".addrbox dl:nth-child(1) dd").children("span").text());
		$("input[name='loc_addr2']").val($(".addrbox dl:nth-child(2) dd").children("span").text());
		$("input[name='loc_addr3']").val($(".inpbox .addr3").val());
		
		if($(".chk_my .check02").is(":checked")){
			$(".popWrap.m_FullpopWrap>.popbox01:nth-child(1)").css("display", "none");
			$(".popWrap.m_FullpopWrap>.popbox01:nth-child(2)").css("display", "");
		} else {
			//체크해제면 바로 배달지 지정
			addrChange(addr1);
		}
		
	});
	
	// 별칭 지정 취소 클릭시 주소 검색 팝업창 div display
	$(document).on("click", "a[class='btn02 m_btn01_s dark']", function() {
		
		$(".popWrap.m_FullpopWrap>.popbox01:nth-child(1)").css("display", "");
		$(".popWrap.m_FullpopWrap>.popbox01:nth-child(2)").css("display", "none");	
		
		// MY배달지 등록 체크는 풀린 상태로
		$(".chk_my .check02").removeAttr("checked");
		$(".check02").removeClass("chekimg");
		
		// 상세주소는 입력한 거 그대로 있어야 되는데 지금도 그냥 잇음.
		
	});
	
	// 별칭 입력 햇을 때만 우측에 x 버튼 보이게
	$(document).on("propertychange change keyup paste input", ".nick .inpbox input", function () {
		
		if($(".nick .inpbox input").val().length!=0){
			
			$(".btn_del01").css("display","");
			
			$(".btn02").prop("disabled", false);
			
			// 별칭 팝업에서 취소/등록 버튼도 pop_btn>btn02이기 때문에
			// 걔는 안 걸리고 배송지 설정 버튼만 걸리게 해줘야됨
			$(".full_type>.btn02").addClass("red");
			
		}else{
			$(".btn_del01").css("display","none");
			
			$(".btn02").prop("disabled", true);
			$(".full_type>.btn02").removeClass("red");
		}
			
	});
	
	
	// x(입력 텍스트 삭제) 버튼 클릭했을 때
	// 상세주소 텍스트 사라짐, x버튼 숨김, 배달지 등록 버튼 비활성화(색상 회색)
	$(".btn_del01").on("click", function () {
		
		$(".nick .inpbox input").val(null);
		$(".btn_del01").css("display","none");
		$(".btn02").prop("disabled", true);
		$(".btn02").removeClass("red");
			
	});
	
	
	// 등록 버튼 클릭했을 때
	$(".btn02.m_btn01_s.submit").on("click", function () {
		
		if($(".nick .inpbox input").val().length != 0) {
			
			$("input[name='loc_nickname']").val($(".nick .inpbox input").val());
			// 현재 경로의 .do 앞(location OR myLocation)
			$("input[name='path']").val(window.location.pathname.split("/").pop().split(".")[0]);
			
			//alert(window.location.pathname.split("/").pop().split(".")[0]);
			
			form.submit();
			
		}else {
			alert("별칭을 입력하세요 대화창 만들어야 함");
		}
			
	});
	
	$(document).on("click", ".btn_detail9", function () {
		var cont = $(this).siblings(".cont");
		var delivery_addr = cont.find(".recent_order_addr").text().trim();
		var store_name = cont.find(".recent_order_store").text().trim();
		
		console.log("최근 배달지:"+delivery_addr);
		console.log("최근 지점:"+store_name);
		
		recentAddrSetting(store_name, delivery_addr);
	});
	 
});