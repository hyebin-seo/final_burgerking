<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<link href="resources/css/delivery/deliveryCart.css"  rel="stylesheet"  type="text/css">

<div class="order_container">
	<div class="order">
		<a href="orderList.do">
			<div class="personal_order">
				<dl>
					<dt>
					<strong>딜리버리 주문내역</strong>
					</dt>
						<dd>최근 주문내역 조회</dd>
				</dl>
			</div>
		</a>
		<div class="center_bar"> </div>
		<a <c:if test="${!empty addrSession }">href="cart.do"</c:if>>
			<div class="personal_cart">
				<dl>
					<dt>
						<strong>카트</strong>
					</dt>
						<dd>나의 장바구니</dd>
				</dl>
			</div>
		</a>
		
	</div>
</div>

<div class="loc_container">
	<div class="loc">
		<div class="page-navi">
			<a href="delivery_home.do"><span>딜리버리</span></a>
			<a href="delivery_home.do"><span>메뉴</span></a>
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

<script src="resources/js/delivery/deliveryCart.js"></script>