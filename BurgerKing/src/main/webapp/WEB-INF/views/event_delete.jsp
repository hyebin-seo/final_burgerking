<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link  href="resources/css/cs/event.css"  rel="stylesheet"  type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<jsp:include page="header.jsp" />	
</head>
<body>

	<div id = "menu_m">
		<jsp:include page="event_menu.jsp" />	
	 </div>
	  	
	<div align="center">
	  
	      <h1>이벤트 삭제시 복구되지 않습니다.</h1>
	 
	   <br> <br>
	   
	   <form method="post"
	      action="<%=request.getContextPath() %>/event_delete_ok.do">
	      <c:set var="dto" value="${delete }" />
	      
	      <input type="hidden" name="event_no" value="${dto.getEvent_no() }">     
	      <input type="hidden" name="page" value="${page }">
	     <div>
	      <table class="table2">
	        
	         <tr>
	         	<td colspan="2" align="center">
	               <input type="submit" class="btn_list" value="이벤트삭제">&nbsp;&nbsp;
	               <input type="button" class="btn_list" value="뒤로가기"
	                onclick="location.href='event_cont.do?no=${dto.getEvent_no() }&page=${page }'">
	            </td>
	         </tr>
	      </table>
	   	  </div>
	   </form>
	</div>

</body>
<div id = "footer_m">
<jsp:include page="footer.jsp" />
</div>
</html>