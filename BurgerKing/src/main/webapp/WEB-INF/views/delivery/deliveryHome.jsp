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

<c:if test="${!empty delivery_addr }">
	<jsp:include page="menu_delivery.jsp"/>	 
</c:if>
<c:if test="${empty delivery_addr }">
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