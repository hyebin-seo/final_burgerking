var form = document.lform;

var totalCount_Custom = 0;
var keyword_Custom = "";


//페이지 이동 후 검색어를 변경하는 경우 페이지 값을 1로 초기화
$(".font_s01").on("change keyup paste", function(){
	document.form.currentPage.value=1;
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

// 주소 검색 후 요소 생성
function makeListJson(jsonStr){
	
	/*var htmlStr = "";*/
	
	var count = 1;
	var htmlStr2 = "";
	
	/*htmlStr += "<table>";*/
	
	/*$(jsonStr.results.juso).each(function(){
		htmlStr += "<tr>";
		htmlStr += "<td>"+this.roadAddr+"</td>";
		htmlStr += "<td>"+this.roadAddrPart1+"</td>";
		htmlStr += "<td>"+this.roadAddrPart2+"</td>";
		htmlStr += "<td>"+this.jibunAddr+"</td>";
		htmlStr += "<td>"+this.engAddr+"</td>";
		htmlStr += "<td>"+this.zipNo+"</td>";
		htmlStr += "<td>"+this.admCd+"</td>";
		htmlStr += "<td>"+this.rnMgtSn+"</td>";
		htmlStr += "<td>"+this.bdMgtSn+"</td>";
		htmlStr += "<td>"+this.detBdNmList+"</td>";
		*/ /*API 서비스 제공항목 확대 (2017.02)*/ /*
		htmlStr += "<td>"+this.bdNm+"</td>";
		htmlStr += "<td>"+this.bdKdcd+"</td>";
		htmlStr += "<td>"+this.siNm+"</td>";
		htmlStr += "<td>"+this.sggNm+"</td>";
		htmlStr += "<td>"+this.emdNm+"</td>";
		htmlStr += "<td>"+this.liNm+"</td>";
		htmlStr += "<td>"+this.rn+"</td>";
		htmlStr += "<td>"+this.udrtYn+"</td>";
		htmlStr += "<td>"+this.buldMnnm+"</td>";
		htmlStr += "<td>"+this.buldSlno+"</td>";
		htmlStr += "<td>"+this.mtYn+"</td>";
		htmlStr += "<td>"+this.lnbrMnnm+"</td>";
		htmlStr += "<td>"+this.lnbrSlno+"</td>";
		htmlStr += "<td>"+this.emdNo+"</td>";
		*//* API 서비스 제공항목 확대 (2020.12) *//*
		htmlStr += "<td>"+this.hstryYn+"</td>";
		htmlStr += "<td>"+this.relJibun+"</td>";
		htmlStr += "<td>"+this.hemdNm+"</td>";
		htmlStr += "</tr>";

		htmlStr2 += "<ul class='addr_list cls"+count+"'>";
	    htmlStr2 += "<li>";
	    htmlStr2 += "<p class='keyword'><strong>"+this.bdNm+"</strong></p>";
	    htmlStr2 += "<p><span>"+this.roadAddr+"</span></p>";
	    htmlStr2 += "<p><em class='txtbox02 st02'>지번</em><span>"+this.jibunAddr+"</span></p>";
	    htmlStr2 += "<button type='button' class='btn_detail cls"+count+"' value='"+this.jibunAddr+"'><span>Details</span></button>";
	    htmlStr2 += "<button type='button' class='btn04'><span>지도보기</span></button>";
	    htmlStr2 += "</li>";
	    htmlStr2 += "</ul>";
	    
	    count++;
	});
	htmlStr += "</table>";
	//$("#list").html(htmlStr);
	
	$(".address_result").css('display','');
	$(".addr_searchguide").css('display','none');
	$(".address_result .txt_result").html('<span><em>'+totalCount+'</em>개의 검색결과가 있습니다.</span>');
	$(".address_result .result_box").not('.addr_searchguide').html(htmlStr2);*/
	
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
			htmlStr2 += "<ul class='addr_list cls"+count+"'>";
		    htmlStr2 += "<li>";
		    htmlStr2 += "<p class='keyword'><strong>"+keyword_Custom+"</strong></p>";
		    htmlStr2 += "<p><span>"+this.roadAddr+"</span></p>";
		    htmlStr2 += "<p><em class='txtbox02 st02'>지번</em><span>"+this.jibunAddr+"</span></p>";
		    //htmlStr2 += "<button type='button' class='btn_detail cls"+count+"'><span>Details</span></button>";
		    htmlStr2 += "<button type='button' class='btn_detail' value="+count+"><span>Details</span></button>";
		    htmlStr2 += "<button type='button' class='btn04' value='"+this.roadAddr+"'><span>지도보기</span></button>";
		    htmlStr2 += "</li>";
		    htmlStr2 += "</ul>";
		    
		    count++;
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



// 주소 이벤트
$(document).ready(function () {
	
	
	// 클릭한 버튼의 주소를 가져오는 함수(도로명 주소, 지번 주소)
	$(document).on("click", "button[class='btn_detail']", function () {
		
		//alert($(this).val());
		
		//alert($(".addr_list.cls"+$(this).val()+" li p:nth-child(2)").first().text());
		//alert($(".addr_list.cls"+$(this).val()+" li p:nth-child(3)").first().text().substr(2));
		
		// 지번 주소 앞에 '지번'이라고 붙어나와서 앞에 두 글자는 자름!
		//var addr1 = $(".addr_list.cls1"+$(this).val()+" li p:nth-child(2)").first().text();
		//var addr2 = $(".addr_list.cls1"+$(this).val()+" li p:nth-child(3)").first().text().substr(2);
		
		//alert(addr1);
		
		// 선택한 주소 보이게
		$(".addr_detail").show();
		
		$(".addrbox dl:nth-child(1) dd span").html($(".addr_list.cls"+$(this).val()+" li p:nth-child(2)").first().text())
		$(".addrbox dl:nth-child(2) dd span").html($(".addr_list.cls"+$(this).val()+" li p:nth-child(3)").first().text().substr(2))
		
		//location.href='mypage_addMyLocation.do';
		
	});
	
	
	// 상세 주소 입력란 변화 감지
	// => 텍스트 입력했을 경우 x(입력 텍스트 삭제) 버튼 보이게 + 배달지 등록 버튼 활성화(색상 빨강)
	// 지우면 안 보이게 + 배달지 등록 버튼 비활성화(색상 회색)
	$(document).on("propertychange change keyup paste input", "input[class='addr3']", function () {
		
		/*console.log($(".addr3").val());
		console.log($(".addr3").val().length);*/
		
		if($(".addr3").val().length!=0){
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
		
		$(".addr3").val(null);
		$(".btn_del01").css("display","none");
		$(".btn02").prop("disabled", true);
		$(".btn02").removeClass("red");
			
	});
	
	
	// 체크박스 체크 표시
	// 주소 클릭 함수 밖으로 빼야 함! 주소 클릭 시 얘까지 실행되는 게 아니니까!
	$(document).on("click", "span[class='addLoc']", function () {
		
		//$("input:checkbox[class='check02']").prop("checked", true);
		//$(".chk_my .check02").prop("checked", true);
		
		// 클릭했을 때 체크 상태 => 해제 / 해제 상태 => 체크 로 바뀜!
		if($(".chk_my .check02").is(":checked")){
		//if($("input#mycheck.check02").prop("checked")==true){
			//alert("체크 돼잇던 상태"+$(".chk_my .check02").is(":checked"));
			//alert($(".chk_my .check02").hasClass("chekimg"));
			$(".chk_my .check02").removeAttr("checked");
			$(".check02").removeClass("chekimg");
			//alert($("input#mycheck.check02.chekimg").is(":checked"));
			//$(".btn02").prop("disabled", false);
			//$(".btn02").addClass("red");
		} else {
			//alert("체크 안 돼잇던 상태"+$(".chk_my .check02").is(":checked"));
			//alert($(".chk_my .check02").hasClass("chekimg"));
			$(".chk_my .check02").attr("checked", "checked");
			//$(".check02+:before").css("background", "url(../../img/mypage/img_checked.png)");
			$(".check02").addClass("chekimg");
			//alert($("input#mycheck.check02.chekimg").is(":checked"));
		}
		
	});
	
	
	// '이 주소로 배달지 설정' 버튼 클릭시 
	$(".search .btn02").on("click", function() {
		
		//alert($(".addrbox dl:nth-child(1) dd").children("span").text());
		//alert($(".addrbox dl:nth-child(2) dd").children("span").text());
		//alert($(".inpbox .addr3").val());
		
		//alert("결과"+$(".chk_my .check02").is(":checked"));
		//alert("클래스유무"+$(".chk_my .check02").hasClass("chekimg"));
		
		$("input[name='loc_addr1']").val($(".addrbox dl:nth-child(1) dd").children("span").text());
		$("input[name='loc_addr2']").val($(".addrbox dl:nth-child(2) dd").children("span").text());
		$("input[name='loc_addr3']").val($(".inpbox .addr3").val());
		
		//alert($("input#mycheck.check02.chekimg").is(":checked"));
		
		// my배달지 설정에 체크 되어잇으면
		//if($("#mycheck").is(":checked")) {
		if($(".chk_my .check02").hasClass("chekimg")) {
			$("input[name='loc_my']").val("y");
			
			//$(".popWrap.m_FullpopWrap>.popbox01:nth-child(1)").css("display", "none");
			//$(".popWrap.m_FullpopWrap>.popbox01:nth-child(2)").css("display", "");
			
			// 두 번째 popbox01 (별칭 팝업창) div가 보이도록 하기
			$(".search").css("display", "none");
			$(".nick").css("display", "block");
			
		// my배달지 등록 안 하는 경우
		}else {
			
			$("input[name='loc_my']").val("n");
			
			alert("이 주소를 배송지로 하고 바로 메뉴 화면으로 이동");
		}
		
	});
	
	
	// **********************************************
	// * 별칭 팝업 창에서 사용하는 함수들 *
	
	// '취소' 버튼 클릭시 첫 번째 popbox01 (주소 검색 팝업창) div가 보이도록 하기
	$(document).on("click", "a[class='btn02 m_btn01_s dark']", function() {
		
		//$(".popWrap.m_FullpopWrap>.popbox01:nth-child(1)").css("display", "");
		//$(".popWrap.m_FullpopWrap>.popbox01:nth-child(2)").css("display", "none");	
		
		$(".search").css("display", "block");
		$(".nick").css("display", "none");
		
		// MY배달지 등록 체크는 풀린 상태로 돌아가게
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
	$(".btn02.m_btn01_s").on("click", function () {
		
		if($(".nick .inpbox input").val().length != 0) {
			//alert($(".nick .inpbox input").val());
			
			$("input[name='loc_nickname']").val($(".nick .inpbox input").val());
			form.submit();
			
		}else {
			alert("별칭을 입력하세요 대화창 만들어야 함");
		}
			
	});
	
	
	
});
