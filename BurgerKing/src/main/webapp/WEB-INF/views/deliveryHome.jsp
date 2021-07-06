<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${orderList }" var="orderList">
	      <h4>${orderList.order_no }</h4>
	      <h4>${orderList.user_id }</h4>
	      <img alt="이미지 오류" src="resources/img/product/french_fries.png">
	 </c:forEach>
</body>
</html>