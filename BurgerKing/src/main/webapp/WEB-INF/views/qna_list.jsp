<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link  href="resources/css/cs/notice.css"  rel="stylesheet"  type="text/css">
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
					<span>고객센터</span>
					<span>문의</span>
				</div>
			</div>
		</div>		<!-- 까만 영역 끝 -->
		


		<div id = "menu_m">
		<jsp:include page="qna_menu.jsp" />	
	  	</div>
	  	<div class = "qna_list" align="center">
	    <table class = "table1">
	    
	    
	    	
	  
	    	   	<hr class="hr1">
	      <tr>
	         <th>문의번호</th> <th>고객</th>
	         <th>분류</th>
	      	 <th>문의제목</th> <th>문의지점</th>
	      	 <th>문의날짜/시간</th> 
	      </tr>
	      
	    <c:set var="list" value="${List }" />
	    	<c:if test="${!empty list }">
	        	 <c:forEach items="${list }" var="dto">
	            	<tr align="center">
	               <td> ${dto.getQna_no() } </td>
	               <td> ${dto.getQna_name() } </td>
	               <td> ${dto.getQna_field() } </td>
	               <td> <a href="<%=request.getContextPath() %>/qna_cont.do?no=${dto.getQna_no() }&page=${Paging.getPage() }"><BIG><U>${dto.getQna_title() }</U></BIG> </a></td>
	               <td> ${dto.getQna_store() } </td>
	                <td>${dto.getQna_regdate() } </td>	               			
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
	      
	      
	      
	      
	   </table>
	   </div>
	  
	   <hr class="hr1">
	   <%-- 페이징 처리 부분 --%>
	<%-- 페이징 처리 부분 --%>
      <div class="text">
      <c:forEach begin="${Paging.getStartBlock() }"
                         end="${Paging.getEndBlock() }" var="i">
         <c:if test="${i == Paging.getPage() }">
            <b class="page"><a href="qna_list.do?page=${i }">${i }</a></b>
         </c:if>
         
         <c:if test="${i != Paging.getPage() }">
            <span class="page"><a href="qna_list.do?page=${i }">${i }</a></span>
         </c:if>
      </c:forEach>
      </div>
      <br>
	   
	


</body>
<div id = "footer_m">
<jsp:include page="siteMap.jsp" />
</div>
</html>