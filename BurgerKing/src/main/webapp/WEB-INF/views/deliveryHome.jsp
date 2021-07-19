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

<%-- 	<c:forEach items="${orderList }" var="orderList">
	      <h4>${orderList.order_no }</h4>
	      <h4>${orderList.user_id }</h4>
	 </c:forEach> --%>
	 
<jsp:include page="menu_delivery.jsp"/>	 
	 
</body>
<jsp:include page="ingredientFooter.jsp" />
<jsp:include page="footer.jsp" />
</html>