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
		<jsp:include page="cs_menu.jsp" />
		
		<ul class="tab_storyBtn m_shadow">
		<li class="">
		<button type="button" onclick="location.href='event_list.do'">이벤트</button>
		</li>
		<li class="on"><button type="button" onclick="location.href='store_list.do'">신규매장</button>
		</li>
		</ul>
		
	  	
	 
	  	<div class = "store_list" align="center">
	    <table class = "table1">
	         
	   
	   
	      
	      
	      <c:set var="list" value="${List }" />
	      <c:if test="${!empty list }">
	         <c:forEach items="${list }" var="dto">
	            <tr id = "tr0">
	               	<td id = "td0"> 
	               		<a href="<%=request.getContextPath() %>/store_cont.do?no=${dto.getStore_no() }&page=${Paging.getPage() }">	               			
	               		<img src="../../burger/resources/img/nstore/${dto.getStore_image() }"  alt="이미지없음" width="450px;" height="200px;">
	              				<br>	               					
	               			<p><fmt:formatDate value="${dto.getStore_regdate() }"
	               				pattern="yyyy-MM-dd"/></p>
	            		</a>
	            		
	            		</td>
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
	            <input type="button" class="btn_list" value="매장작성"
	                 onclick="location.href='store_write.do'">
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
            <b class="page"><a href="store_list.do?page=${i }">${i }</a></b>
         </c:if>
         
         <c:if test="${i != Paging.getPage() }">
            <span class="page"><a href="store_list.do?page=${i }">${i }</a></span>
         </c:if>
      </c:forEach>
      </div>
   
	
	

</body>
	
</html>