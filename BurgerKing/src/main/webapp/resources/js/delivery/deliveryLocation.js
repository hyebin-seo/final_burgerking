const search_Btn = document.querySelector(".btn_search01");
const closeBtn = document.querySelector(".btn_close");
const popup = document.querySelector(".popWrap");

var addr3;
	
//주소찾기 팝업 띄우기 액션
search_Btn.addEventListener('click', onPopup);
//searchBtn.addEventListener('click', goPopup);
//주소찾기 팝업 X버튼 액션
closeBtn.addEventListener('click', offPopup);

function offPopup() {
	popup.style.display ='none';
}

function onPopup() {
	popup.style.display ='block';
}

function goPopup(){
	//경로는 시스템에 맞게 수정하여 사용
	//호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를
	//호출하게 됩니다.
	var pop = window.open("/popup/locationPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
	//** 2017년 5월 모바일용 팝업 API 기능 추가제공 **/
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서
	// 실제 주소검색 URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	// var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
}

$(function(){  
    $(".tab01_btn").click(function() {
    	
    	var li1 = $('.tab01 .item2 li:nth-of-type(1)');
    	var li2 = $('.tab01 .item2 li:nth-of-type(2)');
    	
    	if(li1.hasClass('on')) {
    		li1.removeClass('on');
    		$(".tab_cont_recent").hide();
    		
    		li2.addClass('on');
    		$(".tab_cont_my").show();
    	} else {
    		li1.addClass('on');
    		$(".tab_cont_recent").show();
    		
    		li2.removeClass('on');
    		$(".tab_cont_my").hide();
    	}
    
    });  
    
    
    // 각 주소 li의 삭제(X) 버튼 클릭시 MY배달지에서 삭제
	$(".btn_del02").click(function() {
		
		// 선택한 배달지를 실제 DB상에서 삭제
		deleteLocation($(this).val());
		
		// 페이지에서도 li 삭제
		$(".cls"+$(this).val()).remove();
		
	});
	
	// MY배달지 클릭시 딜리버리 홈으로 + 근처 매장으로 배달지 설정
	$(".goDeli").click(function() {
		
		//alert($(this).val());
		
		var addr1 = $(this).val().split(",")[0];	// 도로명주소
		addr3 = $(this).val().split(",")[1];		// 상세 주소
		
		// 도로명 주소->좌표 값 함수 호출 (연결돼서 배달지 세팅 후 딜리버리 홈으로 이동까지)
		addrChange2(addr1);
		
	});
	
}); 

$(document).ready(function() {
	$(".tab_cont_my").hide();
	
	//페이지 로딩 후 페이지네비게이션 변경
	$(".page-navi").empty();
	
	var navi_str = "";
	
	navi_str += "<a href='delivery_home.do'><span>딜리버리</span></a>";
	navi_str += "<a href='location.do'><span>배달지검색</span></a>";
	
	$(".page-navi").html(navi_str);
});


//DB에서 배달지 삭제하는 ajax함수
function deleteLocation(loc_no) {
	$.ajax({
		url : "location_delete.do",
		data : {"loc_no" : loc_no},
		type: "post",
		success: function(data){
			//alert("삭제됏다~!!!");
			//updateLocSize(data);
		},
		error: function(request, status, error){
			
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}


//도로명 주소를 좌표 값으로 변환(API)
function addrChange2(roadAddr_val) {
	
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
            		goDelivery2(data, roadAddr_val);
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
function goDelivery2(data, roadAddr) {
	
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