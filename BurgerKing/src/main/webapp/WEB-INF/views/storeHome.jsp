<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장찾기</title>
</head>
<jsp:include page="header.jsp" flush="true"/>
<link href="resources/css/store/storeHome.css"  rel="stylesheet"  type="text/css">
<script src="resources/js/store/storeHome.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=7l0mvlbzl6&submodules=geocoder"></script>

<body>

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
                            <div class="pop_btn full_type"><button type="button" class="btn02 st04"><span>적용</span></button></div>
                        </div>
                    </div>
                </div>
                
                <!-- 가까운 매장 검색 -->
                <div class="container01" style="">
                	<button type="button" class="btn03 gps"><span>현 위치로 매장검색 </span></button>
                </div>
                
                <!-- 매장명 검색  -->
                <div class="container01" style="display: none;">
                    <div class="r_srch01 st02">
                        <div class="inpbox">
                        	<input type="text">
                        </div>
                        <button type="button" class="btn_search02"><span>Search</span></button>
                    </div>
                </div>
                
                <!-- 지역검색 탭 -->
                <div class="container01" style="display: none;">
                    <div class="form_list">
                        <select class="st04">
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
                        <select class="st04">
                            <option value="">군, 구</option>
						    <option value="11230">강남구</option>
						    <option value="11250">강동구</option>
						    <option value="11090">강북구</option>
						    <option value="11160">강서구</option>
						    <option value="11210">관악구</option>
						    <option value="11050">광진구</option>
						    <option value="11170">구로구</option>
						    <option value="11180">금천구</option>
						    <option value="11110">노원구</option>
						    <option value="11100">도봉구</option>
						    <option value="11060">동대문구</option>
						    <option value="11200">동작구</option>
						    <option value="11140">마포구</option>
						    <option value="11130">서대문구</option>
						    <option value="11220">서초구</option>
						    <option value="11040">성동구</option>
						    <option value="11080">성북구</option>
						    <option value="11240">송파구</option>
						    <option value="11150">양천구</option>
						    <option value="11190">영등포구</option>
						    <option value="11030">용산구</option>
						    <option value="11120">은평구</option>
						    <option value="11010">종로구</option>
						    <option value="11020">중구</option>
						    <option value="11070">중랑구</option>
                        </select>
                    </div>
                </div>
                
            </div> <!-- SearchWrap end -->
        </div> <!-- map_search_head end -->
        
        <!-- 검색 결과 div -->
        <div class="container01 search_result">
            <p class="nodata st02 none"><span class="txt">검색 결과가 없습니다.<br>다시 입력해 주세요.</span></p>
            <!-- db 동적 생성 -->
            <div class="tit_result">
                <p><em><span>12</span>개</em>의 검색결과가 있습니다</p>
            </div>
            <ul class="list02">
            	
                <li>
                    <div class="shop_detail02">
                        <p class="tit"><strong>선릉역점</strong><em class="km hide"><span>0.0km</span></em></p>
                        <div class="subinfo">
                            <p class="addr"><span>서울특별시 강남구 선릉로 429</span><span> </span></p>
                            <p><span>02-3452-0377</span></p>
                        </div>
                        <ul class="shoptype_list ico_type">
                            <li><span class="shop_type delivery">딜리버리</span></li>
                            <li><span class="shop_type king">킹오더</span></li>
                            <li style="display: none;"><span class="shop_type allday">24시간매장</span></li>
                            <li style="display: none;"><span class="shop_type morning">아침메뉴</span></li>
                            <li style="display: none;"><span class="shop_type parking">주차가능</span></li>
                            <li style="display: none;"><span class="shop_type drive">드라이브스루</span></li>
                        </ul>
                    </div><button type="button" class="btn_detail"><span>Details</span></button>
                </li>
            </ul>
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

<!-- 매장 상세정보 팝업 -->
<div class="popWrap m_FullpopWrap">
	<!-- db 동적생성 -->
    <div class="popbox01 m_bg_basic">
        <div class="M_headerWrap">
            <div class="titleBar">
                <h1 class="page_tit w_alignL"><span>선릉역점</span></h1>
                <div class="title_btn"><button type="button" class="btn_close"><span>x</span></button></div>
            </div>
        </div>
        <div class="popcont pd03">
            <div class="container02 shop_detail">
                <ul class="shoptype_list">
                    <li style=""><span class="shop_type delivery">딜리버리</span></li>
                    <li style=""><span class="shop_type king">킹오더</span></li>
                    <li style="display: none;"><span class="shop_type allday">24시간매장</span></li>
                    <li style="display: none;"><span class="shop_type morning">아침메뉴</span></li>
                    <li style="display: none;"><span class="shop_type parking">주차가능</span></li>
                    <li style="display: none;"><span class="shop_type drive">드라이브스루</span></li>
                </ul>
                <div class="shop_detailinfo">
                    <dl>
                        <dt>주소</dt>
                        <dd><span>서울특별시 강남구 선릉로 429</span><span> </span></dd>
                    </dl>
                    <dl>
                        <dt>연락처</dt>
                        <dd><span>02-3452-0377</span></dd>
                    </dl>
                    <dl>
                        <dt>이용시간</dt>
                        <dd>
                            <p><span>매장 : 연중무휴 (09:00~23:00) </span></p>
                            <p style=""><span>딜리버리 : 10:00 - 23:00</span></p>
                            <p style=""><span>킹오더 : 09:00 - 22:45 </span></p>
                            <p style="display: none;"><span>아침메뉴: 00:00 - 00:00</span></p>
                        </dd>
                    </dl>
                    <dl class="event hide">
                        <dt>이벤트</dt>
                        <dd>
                            <div class="datagroup">
                                <p>아침메뉴 10% 할인</p>
                                <p class="period">(2018.09.01 - 09.30)</p>
                            </div>
                            <div class="datagroup">
                                <p>몬스터와퍼 출시 기념 이벤트 10% 할인</p>
                                <p class="period">(2018.09.01 - 09.30)</p>
                            </div>
                        </dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="pop_btn full_type"><button type="button" class="btn02"><span>확인</span></button></div>
    </div>
</div>
	
</body>
</html>