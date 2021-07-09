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
	 
	 <div class="order_caution">
	    <div class="tit03">
	        <h4 class="WEB">유의사항</h4>
	        <button type="button" class="btn_infoingredient">
	        	<strong>원산지, 영양분석, 알레르기 유발성분</strong>
	        </button>
	    </div>
	    <ul class="WEB txtlist01">
	        <li>매장별 주문금액이 상이하니, 반드시 최소금액을 확인하기 바랍니다.</li>
	        <li>배달 소요시간은 기상조건이나 매장 사정상 지연 또는 제한될 수 있습니다.</li>
	        <li>고객님과 수 차례 연락을 시도한 후 연락이 되지 않는 경우 배달음식이 변질되거나 부패될 우려로 식품위생법상 위반될 여지가 있어 별도로 보관 하지 않으며, <strong>재배달 또는 환불처리가 어려울 수 있습니다.</strong></li>
	        <li>딜리버리 서비스 메뉴의 가격은 매장 가격과 상이하며, 딜리버리 시 타쿠폰을 사용하실 수 없습니다. (일부품목 배달 제외)</li>
	        <li>배달 제품은 매장 행사(할인가격)에서 제외됩니다.</li>
	        <li>제품 가격 및 메뉴 구성은 본사 사정상 변경될 수 있습니다.</li>
	        <li>대량 주문의 경우 콜센터(1599-0505)주문으로만 가능합니다.</li>
	        <li>주문 완료 후 변경 및 취소는 콜센터(1599-0505)에서만 가능합니다.</li>
	    </ul>
	</div>
</body>
<jsp:include page="footer.jsp" />
</html>