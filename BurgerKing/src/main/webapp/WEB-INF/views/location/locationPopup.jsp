<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소지 검색</title>
<link href="resources/css/location/locationPopup.css"  rel="stylesheet"  type="text/css">
<!-- 지도 API CDN -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=7l0mvlbzl6&submodules=geocoder"></script>
<body>

<!-- MY배송지 등록하기 위한 폼 -->
<form name="lform" method="post" action="location_insert.do">
	<input type="hidden" name="user_id" value="${memberSession.user_id }">
	<input type="hidden" name="loc_addr1">
	<input type="hidden" name="loc_addr2">
	<input type="hidden" name="loc_addr3">
	<input type="hidden" name="loc_nickname">
	<input type="hidden" name="path">
</form>

<!-- 주소지 찾기 팝업 -->
<div class="popWrap m_FullpopWrap">
    <div class="popbox01">
        <div class="M_headerWrap">
            <div class="titleBar">
                <h1 class="page_tit w_alignL"><span>배달 받을 주소</span></h1>
                <div class="title_btn">
                	<button type="button" class="btn_close btn_head_close">
                		<span>Close</span>
                	</button>
                </div>
            </div>
        </div>
        
        <div id="srchaddrPop" class="popcont nopadding srchaddrPop">
            
            <div class="search_address">
                <div class="searchWrap01">
                  <form name="form" id="form" method="post" onsubmit="return false;">
                  	<input type="hidden" name="currentPage" value="1"/> <!-- 요청 변수 설정 (현재 페이지. currentPage : n > 0) -->
					<input type="hidden" name="countPerPage" value="10"/><!-- 요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100) -->
					<input type="hidden" name="resultType" value="json"/> <!-- 요청 변수 설정 (검색결과형식 설정, json) --> 
					<input type="hidden" name="confmKey" value="devU01TX0FVVEgyMDIxMDcwOTE2Mzc0OTExMTM5Mjc="/><!-- 요청 변수 설정 (승인키) -->
                    <div class="r_srch01 st02">
                        <div class="inpbox">
                        	<input type="text" maxlength="50" class="font_s01" name="keyword" onkeydown="enterSearch();" autocomplete="off">
                       		<button type="button" class="btn_del01" style="display: none;">
                       			<span>입력 텍스트 삭제</span>
                       		</button>
                        </div>
                        <button type="button" class="btn_search02" onClick="getAddr();">
                        	<span>Search</span>
                        </button>
                    </div>
                   </form>
                </div>
            </div>
           
            <div class="address_result addr_searchguide">
                <p class="txt_result"><span>아래와 같은 형식으로 검색을 하시면 정확한 주소를 검색할 수 있어요.</span></p>
                <div class="result_box">
                    <ul>
                        <li><strong>도로명 + 건물번호</strong><span>예) 판교역로 330+ 제주 첨단로 221</span></li>
                        <li><strong>지역명(동/리) + 번지</strong><span>예) 삼평동 670, 제주 영평동 2169</span></li>
                        <li><strong>지역명(동) + 건물명(아파트명)</strong><span>예) 분당 주공, 연수동 주공2차</span></li>
                        <li><strong>도로명 + 건물번호</strong><span>예) 분당 우체국사서함 1-100</span></li>
                    </ul>
                </div>
            </div>
           
            <div class="address_result" style="display: none;">
                <!-- 주소 결과 / 페이지네이션 동적생성 -->
            </div>
            
            <div class="addr_detail" style="display: none;">
                <div class="addrbox">
                    <dl>
                        <dt><em class="txtbox02">도로명</em></dt>
                        <dd><span> </span></dd>
                    </dl>
                    <dl>
                        <dt><em class="txtbox02">지번</em></dt>
                        <dd><span></span></dd>
                    </dl>
                </div>
                <div class="inp_detail">
                    <div class="inpbox">
                    	<input class="addr3" type="text" maxlength="50" placeholder="상세주소를 입력하세요.">
                    	<button type="button" class="btn_del01 " style="display: none;">
                    	<span>입력 텍스트 삭제</span></button>
                    </div>
                    <div class="chk_my">
                    	<label>
                    		<input type="checkbox" class="check02">
                    		<span class='addLoc'>MY배달지 등록</span>
                    	</label>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="pop_btn full_type"><button type="button" disabled="disabled" class="btn02"><span>이 주소로 배달지 설정</span></button></div>
        
        <!-- 지도 팝업 -->
        <div class="sub_popWrap" style="display: none;">
            <div class="popbox01 nobtn">
                <div class="M_headerWrap">
                    <div class="titleBar">
                        <h1 class="page_tit w_alignL"><span>지도보기</span></h1>
                        <div class="title_btn"><button type="button" class="btn_close btn_head_close"><span>Close</span></button></div>
                    </div>
                </div>
                <div class="popcont nopadding">
                    <div id="map" style="width: 100%; height: 100%;"></div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="popbox01 nick" style="display: none;">
        <div class="popcont">
            <p class="poptxt01"><strong>별칭을 지정하여 <br><em>MY배달지</em>로 등록하세요.</strong></p>
            <div class="inpbox"><input type="text" placeholder="" maxlength="10"><button type="button" class="btn_del01 " style="display: none;"><span>입력 텍스트 삭제</span></button></div>
            <div class="page_count"><span>0</span> / <span>10</span></div>
        </div>
        <div class="pop_btn c_btn item2"><a class="btn02 m_btn01_s dark"><span>취소</span></a><a class="btn02 m_btn01_s submit red"><span>등록</span></a></div>
    </div>
</div>

<form name="storeForm" method="post" action="delivery_addr.do">
	<input type="hidden" name="store_key" class="store_key">
	<input type="hidden" name="store_name" class="store_name">
	<input type="hidden" name="store_addr" class="store_addr">
	<input type="hidden" name="store_contact" class="store_contact">
	<input type="hidden" name="pi_x" class="pi_x">
	<input type="hidden" name="pi_y" class="pi_y">
	<input type="hidden" name="delivery_addr" class="delivery_addr">
</form>
<script src="resources/js/location/locationSearch.js"></script>
</body>
</html>