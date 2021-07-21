<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장찾기</title>
</head>
<jsp:include page="../header.jsp"/>
<script src="resources/js/store/storeHome.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=7l0mvlbzl6&submodules=geocoder"></script>
<link href="resources/css/store/storeHome.css"  rel="stylesheet"  type="text/css">
<body>

<div class="contentsBox01 MOB">
	<div class="subtitWrap">
		<h3 class="page_tit">매장찾기</h3>
	</div>
</div>

<div class="loc_container">
	<div class="loc">
		<div class="page-navi">
			<a href="/burger/"><span>Home</span></a>
			<a href="store.do"><span>매장찾기</span></a>
		</div>
	</div>
</div>

<!-- 매장찾기 전체 div -->
<div class="mapWrap">
    <div class="map_searchWrap">
        <div class="map_search_head">
            <div class="tab01">
                <ul class="item3">
                    <li class="on"><button type="button"><span>가까운매장</span></button></li>
                    <li class=""><button type="button"><span>매장명검색</span></button></li>
                    <li class=""><button type="button"><span>지역검색</span></button></li>
                </ul>
            </div>
            <div class="searchWrap">
                <h1 class="hide">가까운매장</h1>
                <div class="shop_search_option"><button type="button" class="btn_search_option"><span>매장옵션</span></button>
                    <div class="popWrap m_FullpopWrap option_list">
                        <div class="popbox01">
                            <div class="M_headerWrap">
                                <div class="titleBar">
                                    <h2 class="page_tit w_alignL">매장옵션</h2>
                                    <div class="title_btn"><button type="button" class="btn_close btn_head_close"><span>x</span></button></div>
                                </div>
                            </div>
                            <div class="popcont">
                                <ul class="check_list01 shoptype_list">
                                    <li><label><input type="checkbox" class="check02"><span>전체</span></label></li>
                                    <li><label><input type="checkbox" class="check02"><span><span class="shop_type delivery">딜리버리</span></span></label></li>
                                    <li><label><input type="checkbox" class="check02"><span><span class="shop_type king">킹오더</span></span></label></li>
                                    <li><label><input type="checkbox" class="check02"><span><span class="shop_type allday">24시간매장</span></span></label></li>
                                    <li><label><input type="checkbox" class="check02"><span><span class="shop_type morning">아침메뉴</span></span></label></li>
                                    <li><label><input type="checkbox" class="check02"><span><span class="shop_type parking">주차가능</span></span></label></li>
                                    <li><label><input type="checkbox" class="check02"><span><span class="shop_type drive">드라이브스루</span></span></label></li>
                                </ul>
                            </div>
                            <div class="pop_btn full_type"><button type="button" class="btn02 st04 optionbtn"><span>적용</span></button></div>
                        </div>
                    </div>
                </div>
                
                <!-- 가까운 매장 검색 -->
                <div class="container01" style="">
                	<button type="button" class="btn03 gps locationBtn"><span>현 위치로 매장검색 </span></button>
                </div>
                
                <!-- 매장명 검색  -->
                <div class="container01" style="display: none;">
                    <div class="r_srch01 st02">
                        <div class="inpbox">
                        	<input type="text" class="searchName">
                        </div>
                        <button type="button" class="btn_search02"><span>Search</span></button>
                    </div>
                </div>
                
                <!-- 지역검색 탭 -->
                <div class="container01" style="display: none;">
                    <div class="form_list">
                        <select class="st04 city_select">
                            <option value="" disabled="disabled">특별/광역시</option>
                            <option value="11">서울특별시</option>
                            <option value="21">부산광역시</option>
                            <option value="22">대구광역시</option>
                            <option value="23">인천광역시</option>
                            <option value="24">광주광역시</option>
                            <option value="25">대전광역시</option>
                            <option value="26">울산광역시</option>
                            <option value="29">세종특별자치시</option>
                            <option value="31">경기도</option>
                            <option value="32">강원도</option>
                            <option value="33">충청북도</option>
                            <option value="34">충청남도</option>
                            <option value="35">전라북도</option>
                            <option value="36">전라남도</option>
                            <option value="37">경상북도</option>
                            <option value="38">경상남도</option>
                            <option value="39">제주특별자치도</option>
                        </select>
                        <select class="st04 gungu_select">
							<!-- 군, 구 동적 생성 -->
							<option value="">군, 구</option>
                        </select>
                    </div>
                </div>
                
            </div> <!-- SearchWrap end -->
        </div> <!-- map_search_head end -->
        
        <!-- 검색 결과 div -->
        <div class="container01 search_result">
            <!-- db 동적 생성 -->
        </div>
        
        <button type="button" class="WEB btn_mapsearch_open"><span>검색 영역 보기/숨기기</span></button>
		<button type="button" class="MOB btn_map_open"><span>지도 영역 보기/숨기기</span></button>
    </div> <!-- map_searchWrap end -->
    
    <!-- 배경 map -->
    <div class="api">
    	<button type="button" class="btn_gps MOB"><span>내 위치 확인</span></button>
        <div id="map" style="width: 100%; height: 100%;"></div>
    </div>
</div> <!-- mapWrap end -->

<!-- 매장 상세 팝업 동적 생성 -->

</body>
</html>