var totalCount = 0;

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
					totalCount = jsonStr.results.common.totalCount;
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

function makeListJson(jsonStr){
	
	var htmlStr = "";
	var htmlStr2 = "";
	htmlStr += "<table>";
	$(jsonStr.results.juso).each(function(){
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
		/** API 서비스 제공항목 확대 (2017.02) **/
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
		/** API 서비스 제공항목 확대 (2020.12) **/
		htmlStr += "<td>"+this.hstryYn+"</td>";
		htmlStr += "<td>"+this.relJibun+"</td>";
		htmlStr += "<td>"+this.hemdNm+"</td>";
		htmlStr += "</tr>";

		htmlStr2 += "<ul class='addr_list'>";
	    htmlStr2 += "<li>";
	    htmlStr2 += "<p class='keyword'><strong>"+this.bdNm+"</strong></p>";
	    htmlStr2 += "<p><span>"+this.roadAddr+"</span></p>";
	    htmlStr2 += "<p><em class='txtbox02 st02'>지번</em><span>"+this.jibunAddr+"</span></p>";
	    htmlStr2 += "<button type='button' class='btn_detail'><span>Details</span></button>";
	    htmlStr2 += "<button type='button' class='btn04'><span>지도보기</span></button>";
	    htmlStr2 += "</li>";
	    htmlStr2 += "</ul>";
	});
	htmlStr += "</table>";
	//$("#list").html(htmlStr);
	
	$(".address_result").css('display','');
	$(".addr_searchguide").css('display','none');
	$(".address_result .txt_result").html('<span><em>'+totalCount+'</em>개의 검색결과가 있습니다.</span>');
	$(".address_result .result_box").not('.addr_searchguide').html(htmlStr2);
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

function enterSearch() {
	var evt_code = (window.netscape) ? ev.which : event.keyCode;
	if (evt_code == 13) {    
		event.keyCode = 0;  
		getAddr(); 
	} 
}

//페이지 이동
function goPage(pageNum){
	document.form.currentPage.value=pageNum;
	getAddr();
}

//json타입 페이지 처리 (주소정보 리스트 makeListJson(jsonStr); 다음에서 호출)
function pageMake(jsonStr){ 
  	var total = jsonStr.results.common.totalCount; // 총건수 
	var pageNum = document.form.currentPage.value;// 현재페이지
	var paggingStr = "";
	if(total < 1){
	}else{
		var PAGEBLOCK=document.form.countPerPage.value;
		var pageSize=document.form.countPerPage.value;
		var totalPages = Math.floor((total-1)/pageSize) + 1;
		var firstPage = Math.floor((pageNum-1)/PAGEBLOCK) * PAGEBLOCK + 1;		
		if( firstPage <= 0 ) firstPage = 1;		
		var lastPage = firstPage-1 + PAGEBLOCK;
		if( lastPage > totalPages ) lastPage = totalPages;		
		var nextPage = lastPage+1 ;
		var prePage = firstPage-5 ;		
		if( firstPage > PAGEBLOCK ){
			paggingStr +=  "<a href='javascript:goPage("+prePage+");'>◁</a>  " ;
		}		
		for( i=firstPage; i<=lastPage; i++ ){
			if( pageNum == i )
				paggingStr += "<a style='font-weight:bold;color:blue;font-size:15px;' href='javascript:goPage("+i+");'>" + i + "</a>  ";
			else
				paggingStr += "<a href='javascript:goPage("+i+");'>" + i + "</a>  ";
		}		
		if( lastPage < totalPages ){
			paggingStr +=  "<a href='javascript:goPage("+nextPage+");'>▷</a>";
		}		
		$("#pageApi").html(paggingStr);
	}	
}