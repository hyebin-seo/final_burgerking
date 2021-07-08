<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배달지설정</title>
</head>
<link href="resources/css/delivery/deliveryLocation.css"  rel="stylesheet"  type="text/css">
<jsp:include page="deliveryHome.jsp" flush="true"/>
<body>
<div class="contentsBox01 bg_w">
    <div class="web_container02">
        <div class="subtitWrap">
            <h2 class="page_tit">배달지 검색</h2>
        </div>
        <div class="searchWrap01">
            <div class="r_srch01">
                <div class="inpbox"><input type="text" maxlength="50" placeholder=" ‘주소찾기’를 선택해주세요.">
                	<button type="button" class="btn_del01 " style="display: none;">
                		<span>입력 텍스트 삭제</span>
                	</button>
                </div>
                <button type="button" class="btn_search01 btn01_m">
                	<span>주소찾기</span>
                </button>
            </div>
        </div>
    </div>
</div>
    
<div class="contentsBox01">
    <div class="web_container02">
        <div class="tabfixWrap">
            <div class="tab01">
                <ul class="item2">
                    <li class="on"><button type="button"><span>최근 배달지</span></button></li>
                    <li class=""><button type="button"><span>MY배달지</span></button></li>
                </ul>
            </div>
            <div class="tab_cont" style="">
                <h3 class="hide">최근 배달지</h3>
                <div class="nodata " style="display: none;">
                    <p><span>최근에 주문한 주소가 없습니다.</span></p>
                </div>
                <div class="container01">
                    <ul class="delivery_list">
                    <!-- 추후 db데이터 for문 돌려야함 -->
                        <li>
                            <div class="cont">
                                <p class="addr"><strong>서울특별시 양천구 남부순환로83길 47 (신월동, 목동 센트럴 아이파크 위브 4단지) 401동 1002호</strong></p>
                                <div class="addr_old"><em class="type"><span>지번</span></em><span>서울특별시 양천구 신월동 1078 목동 센트럴 아이파크 위브 4단지</span></div>
                            </div><button type="button" class="btn_detail"><span>배달지로 설정</span></button>
                        </li>
                    </ul>
                </div>
            </div>
            
            <div class="tab_cont " style="display: none;">
                <h3 class="hide">MY 배달지</h3>
                <div class="nodata ">
                    <p><strong><span> (비회원)</span> 님</strong><br>
                    <span>
                    	평소에 자주 배달받는 주소를 등록해 보세요.<br> 패스트오더로 보다 쉽고 빠르게 주문하실 수 있어요!
                    </span></p>
                </div>
                <ul class="delivery_list"></ul>
            </div>
        </div>
    </div>
</div>
	
<!-- 주소지 찾기 팝업 -->
<div class="popWrap m_FullpopWrap">
    <div class="popbox01">
        <div class="M_headerWrap">
            <div class="titleBar">
                <h1 class="page_tit w_alignL"><span>배달 받을 주소</span></h1>
                <div class="title_btn"><button type="button" class="btn_close btn_head_close"><span>Close</span></button></div>
            </div>
        </div>
        
        <div id="srchaddrPop" class="popcont nopadding srchaddrPop">
            
            <div class="search_address">
                <div class="searchWrap01">
                    <div class="r_srch01 st02">
                        <div class="inpbox"><input type="text" maxlength="50" class="font_s01"><button type="button" class="btn_del01 " style="display: none;"><span>입력 텍스트 삭제</span></button></div><button type="button" class="btn_search02"><span>Search</span></button>
                    </div>
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
                <p class="txt_result"><span><em>0</em>개의 검색결과가 있습니다.</span></p>
                <div class="result_box">
                    <div class="nodata">검색 결과가 없습니다.<br>다시 입력해 주세요.</div>
                    <div class="board_paging">
                        <div class="VuePagination ">
                            <nav class="">
                                <ul class="pagination VuePagination__pagination" style="display: none;">
                                    <li class="VuePagination__pagination-item page-item  VuePagination__pagination-item-prev-chunk disabled"><a href="javascript:void(0);" disabled="disabled" class="page-link">&lt;&lt;</a></li>
                                    <li class="VuePagination__pagination-item page-item  VuePagination__pagination-item-prev-page disabled"><a href="javascript:void(0);" disabled="disabled" class="page-link">&lt;</a></li>
                                    <li class="VuePagination__pagination-item page-item  VuePagination__pagination-item-next-page disabled"><a href="javascript:void(0);" disabled="disabled" class="page-link">&gt;</a></li>
                                    <li class="VuePagination__pagination-item page-item  VuePagination__pagination-item-next-chunk disabled"><a href="javascript:void(0);" disabled="disabled" class="page-link">&gt;&gt;</a></li>
                                </ul>
                                <p class="VuePagination__count " style="display: none;">0 records</p>
                            </nav>
                        </div>
                    </div>
                </div>
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
                    <div class="inpbox"><input type="text" maxlength="50" placeholder="상세주소를 입력하세요."><button type="button" class="btn_del01 " style="display: none;"><span>입력 텍스트 삭제</span></button></div>
                    <div class="chk_my"><label><input type="checkbox" class="check02"><span>MY배달지 등록</span></label></div>
                </div>
            </div>
        </div>
        
        <div class="pop_btn full_type"><button type="button" disabled="disabled" class="btn02"><span>이 주소로 배달지 설정</span></button></div>
        
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
    
    <div class="popbox01 " style="display: none;">
        <div class="popcont">
            <p class="poptxt01"><strong>별칭을 지정하여 <br><em>MY배달지</em>로 등록하세요.</strong></p>
            <div class="inpbox"><input type="text" placeholder="" maxlength="10"><button type="button" class="btn_del01 " style="display: none;"><span>입력 텍스트 삭제</span></button></div>
            <div class="page_count"><span>0</span> / <span>10</span></div>
        </div>
        <div class="pop_btn c_btn item2"><a class="btn02 m_btn01_s dark"><span>취소</span></a><a class="btn02 m_btn01_s red"><span>등록</span></a></div>
    </div>
</div>

<script src="resources/js/delivery/deliveryLocation.js"></script>
</body>
</html>