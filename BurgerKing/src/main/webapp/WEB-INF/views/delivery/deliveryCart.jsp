<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<link href="resources/css/delivery/deliveryCart.css"  rel="stylesheet"  type="text/css">

<div class="order_container">
	<div class="order">
		<a>
			<div class="personal_order">
				<dl>
					<dt>
					<strong>딜리버리 주문내역</strong>
					</dt>
					<dd>주문내역이 없습니다.</dd>
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
					<c:if test="${empty addrSession }">
						<dd>카트에 담은 상품이 없습니다.</dd>
					</c:if>
					<c:if test="${!empty addrSession}">
						<dd>총 ${fn:length(cartlist) }건의 상품이 담겨 있습니다.</dd>
					</c:if>
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