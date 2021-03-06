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
</head>
	<jsp:include page="header.jsp" />
<body>

	<!-- 1. 까만 영역 -->
		<div class="WEB locationWrap">
			<div class="web_container">
				<div class="page_navi">
					<a href="/burger/" class>
						<span>HOME</span>
					</a>
					<span>신규메장</span>
					<span>상세</span>
				</div>
			</div>
		</div>		<!-- 까만 영역 끝 -->

	<div id = "menu_m">
		<jsp:include page="store_menu.jsp" />	
	  	</div>
	  	
	<div align="center">
	  
	      <h1>매장 삭제시 복구되지 않습니다.</h1>
	 
	   <br> <br>
	   
	   <form method="post"
	      action="<%=request.getContextPath() %>/store_delete_ok.do">
	      <c:set var="dto" value="${delete }" />
	      
	      <input type="hidden" name="store_no" value="${dto.getStore_no() }">     
	      <input type="hidden" name="page" value="${page }">
	     <div>
	      <table class="table2">
	        
	         <tr>
	         	<td colspan="2" align="center">
	               <input type="submit" class="btn_list" value="매장삭제">&nbsp;&nbsp;
	               <input type="button" class="btn_list" value="뒤로가기"
	                onclick="location.href='store_cont.do?no=${dto.getStore_no() }&page=${page }'">
	            </td>
	         </tr>
	      </table>
	   	  </div>
	   </form>
	</div>

</body>
<div id = "footer_m">
<jsp:include page="siteMap.jsp" />
</div>
</html>