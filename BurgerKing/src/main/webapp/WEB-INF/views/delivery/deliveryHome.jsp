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
<jsp:include page="deliveryCart.jsp"/>
<body>
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

<c:if test="${!empty addrSession }">
	<jsp:include page="menu_delivery.jsp"/>	 
</c:if>
<c:if test="${empty addrSession }">
	<div class="web_container">
	    <div class="subtitWrap">
	        <h3 class="page_tit">메뉴</h3>
	    </div>
	    <div class="tab_cont">
	        <div class="nodata ">
	            <p><span>메뉴 준비중 입니다</span></p>
	        </div>
	    </div>
	</div>
</c:if>
	 
</body>
<jsp:include page="../ingredient/ingredientFooter.jsp" />
<jsp:include page="../footer.jsp" />
</html>