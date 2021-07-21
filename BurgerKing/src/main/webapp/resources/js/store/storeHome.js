var global_map = null;

$(document).ready(function () {
	
	// 탭 선택 이벤트
   $(document).on("click", ".mapWrap .tab01 button", function () {
	   // 선택한 탭 버튼 그래픽
	   $(".mapWrap .tab01 .item3 li").removeClass("on");
	   $(this).parent("li").addClass("on");
	   
	   // 선택한 탭에 해당하는 div display
	   $(".map_searchWrap .searchWrap .container01").css("display","none");
	   
	   var sel_index = $(this).parent("li").index();
	   console.log("선택한 탭 인덱스:"+sel_index);
	   $(".map_searchWrap .container01").eq(sel_index).css("display","");
	   
	   if(sel_index == 0) {
		   updateMap(global_map);
	   }
	   
	   // 탭 이동 시 매장 옵션 초기화
	   $(".option_list .shoptype_list input[type='checkbox']").prop("checked", false);
	   $(".option_list .shoptype_list input[type='checkbox']").eq(0).prop("checked", true);
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
   
   // 매장 옵션 적용 버튼 클릭 이벤트
   $(document).on("click", ".optionbtn", function () {
	   if($(".mapWrap .tab01 li").eq(0).hasClass("on")) { //가까운매장
		   updateMap(global_map);
	   } else if($(".mapWrap .tab01 li").eq(1).hasClass("on")) { //매장명검색
		   var searchName = $(".searchName").val();
		   storeNameSearch(searchName);
	   } else if($(".mapWrap .tab01 li").eq(2).hasClass("on")) { //지역검색
		   cityStoreOpen($(".city_select option:selected").text(),
				   $(".gungu_select option:selected").text());
	   }
	   
	   $(".shop_search_option").removeClass("option_open");
	   $(".shop_search_option .option_list").css("display","none");
   });
   
   //매장옵션 체크 박스 이미지
   $(document).on("click", ".option_list .shoptype_list .check02", function () {
	   
	   //선택한 체크 박스의 텍스트값(전체 일 때 나머지 체크 전부 풀기/나머지일 때 전체 체크 풀기)
	   var span_text = $(this).siblings('span').text();
	   
	   if(span_text == "전체"){
   			$(".option_list .shoptype_list .check02").prop("checked", false);
   			$(this).prop("checked", true);
	   } else {
		   $(".option_list .shoptype_list input[type='checkbox']").eq(0).prop("checked", false);
	   }
   });
   
   //매장 상세 정보 버튼 클릭 이벤트(팝업)
   $(document).on("click", ".btn_detail", function () {
	   
	   storeDetailOpen($(this).val());
   });
   
   //매장 상세 정보 팝업 삭제 액션
   $(document).on("click", ".popWrap .btn_close, .popWrap .btn02", function () {
	   
	   $("#PopWrapStore").remove();
   });
   
   //현 위치로 매장 검색
   $(document).on("click", ".locationBtn", function () {
	   console.log("현위치 불러오기");
	   getLocation();
   });
   
   // 매장명 검색 버튼 이벤트
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
   
   //특별,광역시 셀렉트 박스 이벤트
   $(document).on("change", ".city_select", function () {
	   gunguSetting($(this).val()+"");
   });
   
   //군,구 셀렉트 박스 이벤트(지도 오픈)
   $(document).on("change", ".gungu_select", function () {
	   cityStoreOpen($(".city_select option:selected").text(),
			   $(".gungu_select option:selected").text());
   });
   
   // 검색 결과 on/off 슬라이드
   $(document).on("click", ".btn_mapsearch_open, .btn_map_open", function () {
	   $(".mapWrap").toggleClass("search_close map_open");
   });
   
   
   //페이지 로딩 시 매장옵션 전체 default
   $(".option_list .shoptype_list input[type='checkbox']").eq(0).prop("checked", true);
   
   //페이지 로딩시 버거킹 본점으로 맵 셋팅
   storeOpen("37.569917", "126.988082", 0);
   
});

function optionSetting() {
	var optionArr = [];

	$(".shoptype_list input[type='checkbox']").each(function (i){
		if($(this).is(':checked')) {
			optionArr[i] = "1";
		} else {
			optionArr[i] = "0";
		}
	});
	
	return optionArr;
}

//군,구 셀렉트 박스 생성 함수
function gunguSetting(parentkey) {
	$.ajax({
        url : "gungu_open.do",
        data : {"parentkey" : parentkey},
        type : "post",
        async : false,
        success : function(data){
        	var gungulist = data.gungu;
         	
        	var gunguStr = "<option value=''>군, 구</option>";
            $.each(gungulist , function(i, gungu){
                gunguStr += "<option value='"+gungu.lockey+"'>"+gungu.name+"</option>";
            });
            
            $(".gungu_select").html(gunguStr);
        },
        error : function(request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
}

// 셀렉트박스 지역 선택 시 지도 생성
function cityStoreOpen(city, gungu) {
   if(city == "") {
	   alert("특별/광역시 선택 오류");
	   return;
   }
   
   if(gungu == "군, 구") {
	   gungu = "";
   }
   
   var search_key = city + " " + gungu;
   console.log("지역 검색 파라메터:"+search_key);
   
   var checkingArr = optionSetting();
	
   var param = { "store_addr": search_key, "checking": checkingArr };
	
	$.ajax({
        url : "city_store.do",
        data : param,
        type : "post",
        async: false,
        traditional: true,
        success : function(data){
        	var storelist = data.store;
	        var storeCount = data.storeCount;
	        
	        if(storeCount == 0) {
	        	searchResultMaking(data);
	        	return;
	        }
	        
        	var MARKER_ICON_URL = 'resources/img/delivery/map_marker.png';
        	
    		var map = new naver.maps.Map('map', {
    		    center: new naver.maps.LatLng(storelist[0].pi_x, storelist[0].pi_y),
    		    zoom: 15
    		});
    		
    		global_map = map;

    		var bounds = map.getBounds(),
    		    southWest = bounds.getSW(),
    		    northEast = bounds.getNE(),
    		    lngSpan = northEast.lng() - southWest.lng(),
    		    latSpan = northEast.lat() - southWest.lat();

    		var markers = [],
    	    	infoWindows = [];
        	
           $.each(storelist , function(i, store){
        	   
        	   var position = new naver.maps.LatLng(store.pi_x, store.pi_y);

    		   var marker = new naver.maps.Marker({
    		       map: map,
    		       position: position,
    		       title: store.store_name,
    		       icon: {
    		           url: MARKER_ICON_URL,
    		           size: new naver.maps.Size(36, 49),
    		           anchor: new naver.maps.Point(12, 37),
    		           origin: new naver.maps.Point(0, 0)
    		       },
    		       zIndex: 100
    		   });
    		   
    		   //마커 클릭 시 띄울 창
    		   var infoWindow = new naver.maps.InfoWindow({
    		        content: "<div style='width:150px;'><b>"+ store.store_name +"</b></div>"
    		   });

    		    markers.push(marker);
    		    infoWindows.push(infoWindow);
           });
           
           // 검색 결과 result div 셋팅
           searchResultMaking(data);
           
	       //해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
           this.getClickHandler=function(seq) {
        	   return function(e) {
	   		        var marker = markers[seq],
	   		            infoWindow = infoWindows[seq];

	   		        if (infoWindow.getMap()) {
	   		            infoWindow.close();
	   		        } else {
	   		            infoWindow.open(map, marker);
	   		        }
	   		    }
	   		}
	   		
	   		for (var i=0, ii=markers.length; i<ii; i++) {
	   		    naver.maps.Event.addListener(markers[i], 'click', this.getClickHandler(i));
	   		}
        },
        error : function(request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
	
}


function addrChange(roadAddr_val) {
	
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
        
    });

}

//현위치 불러오기
function getLocation() {
	
	if (navigator.geolocation) { // GPS를 지원하면
		navigator.geolocation.getCurrentPosition(function(position) {
			console.log("현 위치:"+position.coords.latitude + ' ' + position.coords.longitude);
			storeOpen(position.coords.latitude, position.coords.longitude, 0);
	    }, function(error) {
	      console.error(error);
	    }, {
	      enableHighAccuracy: false,
	      maximumAge: 0,
	      timeout: Infinity
	    });
			
	} else {
		alert('GPS를 지원하지 않습니다');
	}
}

//매장 상세정보 불러오기
function storeDetailOpen(storeKey) {
	$.ajax({
        url : "store_detail.do",
        data : {"store_key" : storeKey},
        type : "post",
        success : function(data){
           searchDetailMaking(data);
        },
        error : function(request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
}

function storeOpen(x, y, zoomval) {
	var MARKER_ICON_URL = 'resources/img/delivery/map_marker.png';
	var checkingArr = optionSetting();
	
	console.log("매장옵션:"+checkingArr);
	
	if(zoomval == 0) {
		zoomval = 15;
	}
	
	var map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(x, y),
	    zoom: zoomval
	});
	
	global_map = map;

	var bounds = map.getBounds(),
	    southWest = bounds.getSW(),
	    northEast = bounds.getNE(),
	    lngSpan = northEast.lng() - southWest.lng(),
	    latSpan = northEast.lat() - southWest.lat();

	var markers = [],
    	infoWindows = [];
	
	var param = { "pi_x": x, "pi_y": y, "checking" : checkingArr };
	
	$.ajax({
        url : "near_store.do",
        data : param,
        type : "post",
        async: false,
        traditional: true,
        success : function(data){
           var storelist = data.store;
           var storeCount = data.storeCount;
        	
           console.log("좌표 기준 지도 셋팅");
           
           $.each(storelist , function(i, store){
        	   
        	   var position = new naver.maps.LatLng(store.pi_x, store.pi_y);

    		   var marker = new naver.maps.Marker({
    		       map: map,
    		       position: position,
    		       title: store.store_name,
    		       icon: {
    		           url: MARKER_ICON_URL,
    		           size: new naver.maps.Size(36, 49),
    		           anchor: new naver.maps.Point(12, 37),
    		           origin: new naver.maps.Point(0, 0)
    		       },
    		       zIndex: 100
    		   });
    		   
    		   //마커 클릭 시 띄울 창
    		   var infoWindow = new naver.maps.InfoWindow({
    		        content: "<div style='width:150px;'><b>"+ store.store_name +"</b></div>"
    		   });

    		    markers.push(marker);
    		    infoWindows.push(infoWindow);
           });
           
           // 검색 결과 div 셋팅
           searchResultMaking(data);
        },
        error : function(request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });

	naver.maps.Event.addListener(map, 'zoom_changed', function() {
	    updateMarkers(map, markers);
		//updateMap(map);
	});

	naver.maps.Event.addListener(map, 'dragend', function() {
	    //updateMarkers(map, markers);
	    updateMap(map);
	});
	
	//해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
	this.getClickHandler=function(seq) {
		return function(e) {
	        var marker = markers[seq],
	            infoWindow = infoWindows[seq];

	        if (infoWindow.getMap()) {
	            infoWindow.close();
	        } else {
	            infoWindow.open(map, marker);
	        }
	    }
	}
	
	for (var i=0, ii=markers.length; i<ii; i++) {
	    naver.maps.Event.addListener(markers[i], 'click', this.getClickHandler(i));
	}
}

function updateMap(map) {
	console.log("좌표 이동 지도 재설정");
	
	var mapaddr = map.getCenter();
	var mapZoom = map.getZoom();
	
	storeOpen(mapaddr.y, mapaddr.x, mapZoom);
}

// 마커 갱신
function updateMarkers(map, markers) {
	
    var mapBounds = map.getBounds();
    var marker, position;

    for (var i = 0; i < markers.length; i++) {

        marker = markers[i]
        position = marker.getPosition();

        if (mapBounds.hasLatLng(position)) {
            showMarker(map, marker);
        } else {
            hideMarker(map, marker);
        }
    }
}

// 지도 움직임에 따라 마커 보임
function showMarker(map, marker) {

    if (marker.setMap()) return;
    marker.setMap(map);
}

// 지도 움직임에 따라 마커 숨김
function hideMarker(map, marker) {

    if (!marker.setMap()) return;
    marker.setMap(null);
}

// 매장명 검색
function storeNameSearch(searchName) {
   var checkingArr = optionSetting();
   console.log("검색 파라메터:"+searchName);
   
   if(searchName == "") {
	   alert("검색어를 입력해주세요!");
	   return;
   }
	
   var param = { "store_name": searchName, "checking" : checkingArr };
	
	$.ajax({
        url : "store_name_search.do",
        data : param,
        type : "post",
        async: false,
        traditional: true,
        success : function(data){
        	var storelist = data.store;
	        var storeCount = data.storeCount;
	        
	        if(storeCount == 0) {
	        	searchResultMaking(data);
	        	return;
	        }
	        
        	var MARKER_ICON_URL = 'resources/img/delivery/map_marker.png';
        	
        	console.log("이름 검색 x:"+storelist[0].pi_x);
        	console.log("이름 검색 y:"+storelist[0].pi_y);
        	
    		var map = new naver.maps.Map('map', {
    		    center: new naver.maps.LatLng(storelist[0].pi_x, storelist[0].pi_y),
    		    zoom: 15
    		});
    		
    		global_map = map;

    		var bounds = map.getBounds(),
    		    southWest = bounds.getSW(),
    		    northEast = bounds.getNE(),
    		    lngSpan = northEast.lng() - southWest.lng(),
    		    latSpan = northEast.lat() - southWest.lat();

    		var markers = [],
    	    	infoWindows = [];
        	
           $.each(storelist , function(i, store){
        	   
        	   var position = new naver.maps.LatLng(store.pi_x, store.pi_y);

    		   var marker = new naver.maps.Marker({
    		       map: map,
    		       position: position,
    		       title: store.store_name,
    		       icon: {
    		           url: MARKER_ICON_URL,
    		           size: new naver.maps.Size(36, 49),
    		           anchor: new naver.maps.Point(12, 37),
    		           origin: new naver.maps.Point(0, 0)
    		       },
    		       zIndex: 100
    		   });
    		   
    		   //마커 클릭 시 띄울 창
    		   var infoWindow = new naver.maps.InfoWindow({
    		        content: "<div style='width:150px;'><b>"+ store.store_name +"</b></div>"
    		   });

    		    markers.push(marker);
    		    infoWindows.push(infoWindow);
           });
           
           // 검색 결과 result div 셋팅
           searchResultMaking(data);
           
	       //해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
           this.getClickHandler=function(seq) {
        	   return function(e) {
	   		        var marker = markers[seq],
	   		            infoWindow = infoWindows[seq];

	   		        if (infoWindow.getMap()) {
	   		            infoWindow.close();
	   		        } else {
	   		            infoWindow.open(map, marker);
	   		        }
	   		    }
	   		}
	   		
	   		for (var i=0, ii=markers.length; i<ii; i++) {
	   		    naver.maps.Event.addListener(markers[i], 'click', this.getClickHandler(i));
	   		}
        },
        error : function(request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });

}

// 검색 결과 만드는 함수
function searchResultMaking(jsonStr) {
	
	var storelist = jsonStr.store;
    var storeCount = jsonStr.storeCount;

	var htmlStr = "";
	
	// 주소 결과 없으면 nodata div 출력
	if(storeCount == 0) {
		htmlStr += "<p class='nodata st02'><span class='txt'>검색 결과가 없습니다.<br>다시 입력해 주세요.</span></p>";
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
			htmlStr += "<button type='button' class='btn_detail' value='"+store.store_key+"'><span>Details</span></button>";
			htmlStr += "</li>";
		});
		
		htmlStr += "</ul>";
	}
	
	$(".search_result").html(htmlStr);
}



// 상세정보 띄우기
function searchDetailMaking(jsonStr) {
	
	var store = jsonStr.store;
	
	var htmlStr = "";
	
	// 주소 결과 없으면 리턴
	if(store == null) {
		return;
	} else {
		htmlStr += "<div class='popWrap m_FullpopWrap' id='PopWrapStore'>";
		
		//주소 검색 결과 한 건마다 li
		htmlStr += "<div class='popbox01 m_bg_basic'>";
		htmlStr += "<div class='M_headerWrap'>";
		htmlStr += "<div class='titleBar'>";
		htmlStr += "<h1 class='page_tit w_alignL'><span>"+store.store_name+"</span></h1>";
		htmlStr += "<div class='title_btn'><button type='button' class='btn_close'><span>x</span></button></div>";
		htmlStr += "</div>";
		htmlStr += "</div>";
		
		htmlStr += "<div class='popcont pd03'>";
		htmlStr += "<div class='container02 shop_detail'>";
		htmlStr += "<ul class='shoptype_list'>";

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
		
		htmlStr += "<div class='shop_detailinfo'>";
		htmlStr += "<dl>";
		htmlStr += "<dt>주소</dt>";
		htmlStr += "<dd><span>"+store.store_addr+"</span><span> </span></dd>";
		htmlStr += "</dl>";
		htmlStr += "<dl>";
		htmlStr += "<dt>연락처</dt>";
		htmlStr += "<dd><span>"+store.store_contact+"</span></dd>";
		htmlStr += "</dl>";
		htmlStr += "<dl>";
		htmlStr += "<dt>이용시간</dt>";
		htmlStr += "<dd>";
		htmlStr += "<p><span>매장 : "+store.open_time+"</span></p>";
		
		if(store.delivery == 1) {
			htmlStr += "<p><span>딜리버리 : "+store.delivery_time+"</span></p>";
		} else {
			htmlStr += "<p style='display: none;'><span>딜리버리 : "+store.delivery_time+"</span></p>";
		}
		
		if(store.kingorder == 1) {
			htmlStr += "<p><span>킹오더 : "+store.kingorder_time+"</span></p>";
		} else {
			htmlStr += "<p style='display: none;'><span>킹오더 : "+store.kingorder_time+"</span></p>";
		}
		
		htmlStr += "</dd>";
		htmlStr += "</dl>";
		htmlStr += "</div>";
		
		htmlStr += "</div>";
		htmlStr += "</div>";
		htmlStr += "<div class='pop_btn full_type'><button type='button' class='btn02'><span>확인</span></button></div>";
		htmlStr += "</div>";
		
		htmlStr += "</div>";
	}
	
	$("body").append(htmlStr);
}