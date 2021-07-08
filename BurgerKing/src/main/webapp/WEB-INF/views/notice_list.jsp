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


</head>
<body>
	
	
		
	  	<div class = "notice_list" align="center">
	    <table class = "table1">
	    
	    <form method="post"
	      action="<%=request.getContextPath() %>/notice_search.do">
	      
	      <input type="hidden" name="page" value="${Paging.getPage() }">
	      <select name="field">	         
	         <option value="title_cont">제목+내용</option>	      	         	      
	      </select>
	     
	      <img alt="..." src="resources/img/cs/barB.png">
	     
	  
	      <button class="btn_search" type="submit"></button>
	     
	   </form>
	   	<hr id="hr1">
	      <tr>
	         <th>NO.</th> <th>공지제목</th>
	      	 <th>날짜</th> <th>조회수</th>
	      </tr>
	      
	      <c:set var="list" value="${List }" />
	      <c:if test="${!empty list }">
	         <c:forEach items="${list }" var="dto">
	            <tr align="center">
	               <td> ${dto.getNotice_no() } </td>
	         	   <td> <a href="<%=request.getContextPath() %>/notice_cont.do?no=${dto.getNotice_no() }&page=${Paging.getPage() }">
	         						${dto.getNotice_title() }</a></td>
	               
	               <td> <fmt:formatDate value="${dto.getNotice_regdate() }"
	               				pattern="yyyy-MM-dd"/>
	               	<td> ${dto.getNotice_hit() } </td>			
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
	            <input type="button" value="글쓰기"
	                 onclick="location.href='notice_write.do'">
	         </td>
	      </tr>
	      
	   </table>
	   </div>
	  
	   <hr id="hr1">
	   <%-- 페이징 처리 부분 --%>
	<%-- 페이징 처리 부분 --%>
      <div class="text">
      <c:forEach begin="${Paging.getStartBlock() }"
                         end="${Paging.getEndBlock() }" var="i">
         <c:if test="${i == Paging.getPage() }">
            <b class="page"><a href="notice_list.do?page=${i }">${i }</a></b>
         </c:if>
         
         <c:if test="${i != Paging.getPage() }">
            <span class="page"><a href="notice_list.do?page=${i }">${i }</a></span>
         </c:if>
      </c:forEach>
      </div>
   </div>
	   <br>
	   
	</div>


</body>
</html>