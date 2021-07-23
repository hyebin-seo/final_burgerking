const popup1 = document.querySelector(".qnaStorepopWrap");
const closeBtn1 = document.querySelector(".storefindclose");
const open_Btn1 = document.querySelector(".storefindopen");
const open_Btn2 = document.querySelector(".storefindopen2");

//가맹점 신청 팝업 띄우기 액션
open_Btn1.addEventListener('click', onPopup1); //input눌렸을 때
open_Btn2.addEventListener('click', onPopup1); //button눌렸을 때 

//가맹점 신청 팝업 X버튼 액션
closeBtn1.addEventListener('click', offPopup1);

function offPopup1() {
	popup1.style.display ='none';
}

function onPopup1() {
	popup1.style.display ='block';
}

$(document).ready(function () {
		
	//매장명 검색 버튼 이벤트
	$(document).on("click", ".btn_search02", function () {
	   	var searchName = $(".searchName").val();
		storeNameSearch(searchName);
	});
	
	// 매장명 엔터 이벤트
	$(".searchName").keydown(function(key) {
	   if (key.keyCode == 13) {
		   	var searchName = $(".searchName").val();
		   	storeNameSearch(searchName);
	   }
	});
	
	
	// 클릭한 매장명을 input창으로 가져오기 
	$(document).on("click", "button[class='btn_detail']", function () {
		
		// 매장찾기 팝업창 닫기
		offPopup1();
		
		$(".chosenStore").val($(this).val());
		
	});

});


//매장명 검색
function storeNameSearch(searchName) {
   var optionArr = [0,0,0,0,0,0,0];
   console.log("검색 파라메터:"+searchName);
   
   if(searchName == "") {
	   alert("검색어를 입력해주세요!");
	   return;
   }
	
   var param = { "store_name": searchName, "checking" : optionArr };
	
	$.ajax({
        url : "store_name_search.do",
        data : param,
        type : "post",
        async: false,
        traditional: true,
        success : function(data){

           // 검색 결과 result div 셋팅
           searchResultMaking(data);
        },
        error : function(request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });

}

//검색 결과 만드는 함수
function searchResultMaking(jsonStr) {
	
	var storelist = jsonStr.store;
    var storeCount = jsonStr.storeCount;

	var htmlStr = "";
	
	// 주소 결과 없으면 nodata div 출력
	if(storeCount == 0) {
		htmlStr += "<div class='tit_result'>";
		htmlStr += "<p class='nodata st02'><span class='txt'>검색 결과가 없습니다.<br>다시 입력해 주세요.</span></p>";
		htmlStr += "</div>";
	} else {
		// 주소결과 전체 div / 검색 결과 수
		htmlStr += "<div class='tit_result'>";
		htmlStr += "<p><em><span>"+storeCount+"</span>개</em>의 검색결과가 있습니다</p>";
		htmlStr += "</div>";
		htmlStr += "<ul class='list02'>";
		
		$.each(storelist , function(i, store){
			//주소 검색 결과 한 건마다 li
			htmlStr += "<li>";
			htmlStr += "<div class='shop_detail02'>";
			htmlStr += "<p class='tit'><strong>"+store.store_name+"</strong></p>";
			htmlStr += "<div class='subinfo'>";
			htmlStr += "<p class='addr'><span>"+store.store_addr+"</span><span> </span></p>";
			htmlStr += "<p><span>"+store.store_contact+"</span></p>";
			htmlStr += "</div>";
			htmlStr += "<ul class='shoptype_list ico_type'>";

			if(store.delivery == 1) {
				htmlStr += "<li><span class='shop_type delivery'>딜리버리</span></li>";
			} else {
				htmlStr += "<li style='display: none;'><span class='shop_type delivery'>딜리버리</span></li>";
			}
			
			if(store.kingorder == 1) {
				htmlStr += "<li><span class='shop_type king'>킹오더</span></li>";
			} else {
				htmlStr += "<li style='display: none;'><span class='shop_type king'>킹오더</span></li>";
			}
			
			if(store.allday == 1) {
				htmlStr += "<li><span class='shop_type allday'>24시간매장</span></li>";
			} else {
				htmlStr += "<li style='display: none;'><span class='shop_type allday'>24시간매장</span></li>";
			}
			
			if(store.morning == 1) {
				htmlStr += "<li><span class='shop_type morning'>아침메뉴</span></li>";
			} else {
				htmlStr += "<li style='display: none;'><span class='shop_type morning'>아침메뉴</span></li>";
			}
			
			if(store.parking == 1) {
				htmlStr += "<li><span class='shop_type parking'>주차가능</span></li>";
			} else {
				htmlStr += "<li style='display: none;'><span class='shop_type parking'>주차가능</span></li>";
			}
			
			if(store.drivethru == 1) {
				htmlStr += "<li><span class='shop_type drive'>드라이브스루</span></li>";
			} else {
				htmlStr += "<li style='display: none;'><span class='shop_type drive'>드라이브스루</span></li>";
			}
			
			htmlStr += "</ul>";
			htmlStr += "</div>"
			htmlStr += "<button type='button' class='btn_detail' value='"+store.store_name+"'><span>Details</span></button>";
			htmlStr += "</li>";
			
		});
		
		htmlStr += "</ul>";
	}
	
	$(".search_result").html(htmlStr);
}