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

	<!-- 1. 까만 영역 -->
		<div class="WEB locationWrap">
			<div class="web_container">
				<div class="page_navi">
					<a href="/burger/">
						<span>HOME</span>
					</a>
					<span>이벤트</span>
					<span>상세</span>
				</div>
			</div>
		</div>		<!-- 까만 영역 끝 -->

	<div id = "menu_m">
		<jsp:include page="event_menu.jsp" />	
	  	</div>
	  	
	<hr class="hr1">	
   
    <br> <br>
	
	
	<div align="center">
	
	      <h1>이벤트 수정</h1>
	   
	   <form method="post" 
	      action="<%=request.getContextPath() %>/event_update_ok.do">
	      <c:set var="dto" value="${modify }" />
	      
	      <input type="hidden" name="event_no" value="${dto.getEvent_no() }">   
	      <input type="hidden" name="page" value="${page }">	      
	      <div class = "event_update" align="center">
	      <table class = "table2">	         
	         <tr id = "tr1">
	         	<th>이벤트제목</th>
	         	<td> <input type="text" name="event_title"
	         	          value="${dto.getEvent_title() }" size="100px"> </td>
	         </tr>
	         
	         
	         
	         <tr id = "tr1">
	         	<th>이벤트내용</th>
	         	<td> 
					<textarea rows="30" cols="100" name="event_cont">${dto.getEvent_cont() }</textarea>
	         	</td>
	         </tr>
	      	 
	      	  <tr id = "tr1">
	      	 	 <th>카테고리</th>
	         		<!-- <td> <input type="text" name="event_cat" size="100px"> </td> -->
	         		<td>
	         		<select name = "event_cat">
	         		<option value="진행중">진행중</option>
	         		<option value="종료">종료</option>
	         		</select>
	         		</td>		
	      	 </tr>
	        
	    
	      </table>
	      <hr class="hr1">
	      
	       <tr>
	            <td colspan="2" align="center">
	               <input type="submit" class="btn_list" value="이벤트수정">&nbsp;&nbsp;
	         	   <input type="reset" class="btn_list" value="다시작성">
	            </td>
	         </tr>
	   	  </div>
	   </form>
	</div>

</body>
<div id = "footer_m">
<jsp:include page="footer.jsp" />
</div>
</html>