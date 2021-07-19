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
<script src="resources/js/cs/event.js"></script>

</head>
<body>
		
		
		<div class="container">
		
		<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1">이벤트</li>
		<li class="tab-link" data-tab="tab-2">신규매장</li>
		</ul>
	  	
	  	<div id="tab-1" class="tab-content current">
	  	<div class = "event_list" align="center">
	    <table class = "table1">
	         
	   
	   	<hr class="hr1">
	      <tr>
	         <th>NO.</th> <th>이벤트제목</th>
	      	 <th>날짜</th> 
	      </tr>
	      
	      <c:set var="list" value="${List }" />
	      <c:if test="${!empty list }">
	         <c:forEach items="${list }" var="dto">
	            <tr align="center">
	               <td> ${dto.getEvent_no() } </td>
	         	   <td> <a href="<%=request.getContextPath() %>/event_cont.do?no=${dto.getEvent_no() }&page=${Paging.getPage() }">
	         						${dto.getEvent_title() }</a></td>
	               
	               <td> <fmt:formatDate value="${dto.getEvent_regdate() }"
	               				pattern="yyyy-MM-dd"/>
	               				
	            </tr>
	         </c:forEach>
	      </c:if>
	      
	      <c:if test="${empty list }">
	      	 <tr>
	            <td colspan="4" align="center">
	               <h3>검색된 게시물이 없습니다.....</h3>
	            </td>
	         </tr>
	      </c:if>
	      
	      <tr>
	         <td colspan="4" align="right">
	            <input type="button" class="btn_list" value="이벤트작성"
	                 onclick="location.href='event_write.do'">
	         </td>
	      </tr>
	      
	   </table>
	   </div>
	  
	   <hr class="hr1">
	   <%-- 페이징 처리 부분 --%>
	<%-- 페이징 처리 부분 --%>
      <div class="text">
      <c:forEach begin="${Paging.getStartBlock() }"
                         end="${Paging.getEndBlock() }" var="i">
         <c:if test="${i == Paging.getPage() }">
            <b class="page"><a href="event_list.do?page=${i }">${i }</a></b>
         </c:if>
         
         <c:if test="${i != Paging.getPage() }">
            <span class="page"><a href="event_list.do?page=${i }">${i }</a></span>
         </c:if>
      </c:forEach>
      </div>
   </div>
	   <br>
	   
	   <div id="tab-2" class="tab-content">
	  
	   </div>
	   
	</div>
	

</body>
</html>