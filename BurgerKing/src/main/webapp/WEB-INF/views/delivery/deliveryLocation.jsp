<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<div class="contentsBox01">
    <div class="web_container02">
        <div class="tabfixWrap">
            <div class="tab01">
                <ul class="item2">
                    <li class="on"><button type="button" class="tab01_btn"><span>최근 배달지</span></button></li>
                    <li class=""><button type="button" class="tab01_btn"><span>MY배달지</span></button></li>
                </ul>
            </div>
            <div class="tab_cont tab_cont_recent" style="">
                <h3 class="hide">최근 배달지</h3>
                <c:if test="${empty orderList }">
	                <div class="nodata ">
	                    <p><span>최근에 주문한 주소가 없습니다.</span></p>
	                </div>
                </c:if>
                <div class="container01">
                    <ul class="delivery_list">
                      <c:forEach items="${orderList }" var="order" varStatus="s">
                        <li>
                            <div class="cont">
                                <p class="addr">
                                	<strong class="recent_order_addr">${order.order_addr }</strong>
                                </p>
                                <div class="addr_old">
                                	<em class="type"><span>지점</span></em>
                                	<span class="recent_order_store">${order.store_name }</span>
                                </div>
                            </div>
                            <button type="button" class="btn_detail9">
                            	<span>배달지로 설정</span>
                            </button>
                        </li>
                      </c:forEach>
                    </ul>
                </div>
            </div>
            
            <div class="tab_cont tab_cont_my">
                <h3 class="hide">MY 배달지</h3>
                <div class="nodata ">
                    <p><strong><span> ${memberSession.user_name}</span> 님</strong><br>
                    <span>
                    	평소에 자주 배달받는 주소를 등록해 보세요.<br> 패스트오더로 보다 쉽고 빠르게 주문하실 수 있어요!
                    </span></p>
                </div>
                <ul class="delivery_list"></ul>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../location/locationPopup.jsp" flush="true"/>
<script src="resources/js/delivery/deliveryLocation.js"></script>
</body>
<jsp:include page="../footer.jsp" />
</html>