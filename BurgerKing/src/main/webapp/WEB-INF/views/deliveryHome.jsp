<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>딜리버리</title>
<link href="resources/css/delivery/deliveryHome.css"  rel="stylesheet"  type="text/css">
</head>
<jsp:include page="deliveryHeader.jsp" flush="true"/>
<body>
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
			<a>
				<div class="personal_cart">
					<dl>
						<dt>
							<strong>카트</strong>
							<em class="count" style="display: none;">
								<span>0</span>
							</em>
						</dt>
						<dd>카트에 담은 상품이 없습니다.</dd>
					</dl>
				</div>
			</a>
			
		</div>
	</div>
	
	<div class="loc_container">
		<div class="loc">
			<div class="page-navi">
				<a><span>딜리버리</span></a>
				<a><span>메뉴</span></a>
			</div>
			
			<div class="location">
				<span class="addr">
					<span>배달지를 선택하세요</span>
				</span>
				<span class="shop">
					<span>지점</span>
				</span>
				<span class="money">
					최소주문금액  : 12,000원 / 배달팁 : 0원
				</span>
				<span class="btn">
					<a href="location.do">
						<span>변경</span>
					</a>
				</span>
			</div>
		</div>
	</div>

	<c:forEach items="${orderList }" var="orderList">
	      <h4>${orderList.order_no }</h4>
	      <h4>${orderList.user_id }</h4>
	 </c:forEach>
</body>
</html>