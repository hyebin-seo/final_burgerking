<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
</head>
<jsp:include page="deliveryHeader.jsp" flush="true"/>
<jsp:include page="deliveryCart.jsp"/>
<link href="resources/css/delivery/deliveryOrderDetail.css"  rel="stylesheet"  type="text/css">
<link href="resources/css/delivery/deliveryOrderList.css"  rel="stylesheet"  type="text/css">
<body>
<div class="loc_container">
	<div class="loc">
		<div class="page-navi">
			<a href="delivery_home.do"><span>딜리버리</span></a>
			<a href="mypage_main.do"><span>MY킹</span></a>
			<a href="orderList.do"><span>주문내역</span></a>
		</div>
		
		<div class="location">
			<span class="addr">
			   <c:if test="${empty addrSession }">
				<span>배달지를 선택하세요</span>
			   </c:if>
			   <c:if test="${!empty addrSession }">
				<span>${delivery_addr }</span>
			   </c:if>
			</span>
			<span class="shop">
			   <c:if test="${empty addrSession }">
				<span>지점</span>
			   </c:if>
			   <c:if test="${!empty addrSession }">
				<span>${addrSession.store_name }</span>
			   </c:if>
			</span>
			<span class="btn">
				<a href="javascript:locationModify();">
					<span>변경</span>
				</a>
			</span>
		</div>
	</div>
</div>
<div class="contentsBox01">
    <div class="web_container">
        <div class="subtitWrap">
            <h2 class="page_tit">주문내역</h2>
        </div>
        <div class="container01">
            <div class="tab_cont">
               <h4 class="MOB tit01 tit_ico list"><span>주문내역</span></h4>
               <c:if test="${empty orderList }">
                	<div class="nodata">
                    	<p>주문내역이 없습니다.</p>
                	</div>
               </c:if>
               <c:if test="${!empty orderList }">
                <ul class="order_list" style="">
                  <c:forEach items="${orderList }" var="order" varStatus="s">
                    <li>
                        <div class="prd_img"><span><img src="${order.order_img }" alt="제품" class="" style="display: inline; opacity: 1;"></span></div>
                        <div class="cont">
                            <p class="tit">
                            	<strong>${order.order_name }</strong>
                            	<em class="tag"><span>주문완료</span></em>
                            </p>
                            <div class="info">
                                <dl>
                                    <dt>주문번호</dt>
                                    <dd><span>${order.order_no }</span></dd>
                                </dl>
                                <dl>
                                    <dt>주문시간</dt>
                                    <dd><span>${order.order_date }</span></dd>
                                </dl>
                            </div>
                        </div>
                        <a class="btn_detail" onclick="location.href='orderDetail.do?no=${order.order_no }'">
                        	<span>Details</span>
                        </a>
                    </li>
                  </c:forEach>
                </ul>
               </c:if>
            </div>
        </div>
    </div>
</div>
</body>
<jsp:include page="../footer.jsp" />
</html>