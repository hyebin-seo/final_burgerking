<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배달지설정</title>
</head>
<link href="resources/css/delivery/deliveryLocation.css"  rel="stylesheet"  type="text/css">
<jsp:include page="deliveryHeader.jsp" flush="true"/>
<jsp:include page="deliveryCart.jsp"/>
<body>
<!-- 주소지 찾기 -->
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

<!-- 최근 배달지와 마이 배달지 출력 div(DB와 연동 필요) -->
<div class="contentsBox01">
    <div class="web_container02">
        <div class="tabfixWrap">
            <div class="tab01">
                <ul class="item2">
                    <li class="on"><button type="button" class="tab01_btn"><span>최근 배달지</span></button></li>
                    <li class=""><button type="button" class="tab01_btn"><span>MY배달지</span></button></li>
                </ul>
            </div>
            <!-- 탭버튼 변경 시 Ajax 호출 -->
            <div class="tab_cont tab_cont_recent" style="">
                <h3 class="hide">최근 배달지</h3>
                <!-- 주문내역 없으면 nodata 출력 -->
                <div class="nodata " style="display: none;">
                    <p><span>최근에 주문한 주소가 없습니다.</span></p>
                </div>
                <div class="container01">
                    <ul class="delivery_list">
                    <!-- 추후 db데이터 for문 돌려야함 -->
                        <li>
                            <div class="cont">
                                <p class="addr">
                                	<strong>서울특별시 양천구 남부순환로83길 47 (신월동, 목동 센트럴 아이파크 위브 4단지) 401동 1002호</strong>
                                </p>
                                <div class="addr_old">
                                	<em class="type"><span>지번</span></em>
                                	<span>서울특별시 양천구 신월동 1078 목동 센트럴 아이파크 위브 4단지</span>
                                </div>
                            </div>
                            <button type="button" class="btn_detail">
                            	<span>배달지로 설정</span>
                            </button>
                        </li>
                        <li>
                        	<div class="cont">
	                        	<p class="addr">
	                        		<strong>서울특별시 양천구 오목로24길 9 (신정동) 401호</strong>
	                        	</p>
	                        	<div class="addr_old">
	                        		<em class="type"><span>지번</span></em>
	                        		<span>서울특별시 양천구 신정동 944-8</span>
	                        	</div>
                        	</div>
                        	<button type="button" class="btn_detail">
                        		<span>배달지로 설정</span>
                        	</button>
                        </li>
                    </ul>
                </div>
            </div>
            
            <div class="tab_cont tab_cont_my">
                <h3 class="hide">MY 배달지</h3>
                <div class="nodata ">
                    <p><strong><span> ${username }</span> 님</strong><br>
                    <span>
                    	평소에 자주 배달받는 주소를 등록해 보세요.<br> 패스트오더로 보다 쉽고 빠르게 주문하실 수 있어요!
                    </span></p>
                </div>
                <ul class="delivery_list"></ul>
            </div>
        </div>
    </div>
</div>
<jsp:include page="locationPopup.jsp" flush="true"/>
<script src="resources/js/delivery/deliveryLocation.js"></script>
</body>
<jsp:include page="footer.jsp" />
</html>