$(document).ready(function () {
	
	// 탭 선택 이벤트
   $(document).on("click", ".mapWrap .tab01 button", function () {
	   // 선택한 탭 버튼 그래픽
	   $(".mapWrap .tab01 .item3 li").removeClass("on");
	   $(this).parent("li").addClass("on");
	   
	   // 선택한 탭에 해당하는 div display
	   $(".map_searchWrap .searchWrap .container01").css("display","none");
	   
	   var sel_index = $(this).parent("li").index();
	   $(".map_searchWrap .container01").eq(sel_index).css("display","");
   });
   
   $(".st04 option:eq(0)").prop("selected", true); //셀렉트 박스 첫번째 option 선택
   $(".shop_search_option .option_list").css("display","none"); // 매장옵션 팝업 페이지로드시 안보이게
   
   // 매장 옵션 클릭 이벤트
   $(document).on("click", ".shop_search_option .btn_search_option", function () {
	   $(".shop_search_option").addClass("option_open");
	   $(".shop_search_option .option_list").css("display","block");
   });
   
   // 매장 옵션 X 클릭 이벤트
   $(document).on("click", ".shop_search_option .option_list .btn_close", function () {
	   $(".shop_search_option").removeClass("option_open");
	   $(".shop_search_option .option_list").css("display","none");
   });
   
   //매장옵션 체크 박스 이미지
   $(document).on("click", ".option_list .shoptype_list .check02", function () {
	   
	   //선택한 체크 박스의 텍스트값(전체 일 때 나머지 체크 전부 풀기)
	   var span_text = $(this).siblings('span').text();
	   
	   if(span_text == "전체"){
   			$(".option_list .shoptype_list .check02").prop("checked", false);
   			$(this).prop("checked", true);
	   }
   });
   
   //페이지 로딩시 버거킹 본점으로 맵 셋팅
   mapSetting("서울특별시 종로구 종로 94");
   
});

function mapSetting(roadAddr_val) {
	
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
			zoom: 15
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

}