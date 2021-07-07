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
	
	<div align="center">
	  
	      <h3>공지사항</h3>
	 
	   <br> <br>
	   <div>
	   <table border="0" cellspacing="0" width="500">
	    <form method="post"
	      action="<%=request.getContextPath() %>/notice_search.do">
	      
	      <input type="hidden" name="page" value="${Paging.getPage() }">
	      <select name="field">	         
	         <option value="title_cont">제목+내용</option>	      	         	      
	      </select>
	      <input type="text" name="keyword">
	      <input type="submit" value="검색">
	   </form>
	   	<hr>
	      <tr>
	         <th>NO</th> <th>공지제목</th>
	      	 <th>작성일자</th> <th>조회수</th>
	      </tr>
	      
	      <c:set var="list" value="${List }" />
	      <c:if test="${!empty list }">
	         <c:forEach items="${list }" var="dto">
	            <tr>
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
	  
	   <hr>
	   <%-- 페이징 처리 부분 --%>
	   
	   
	   <c:forEach begin="${Pagjing.getStartBlock() }"
	       					end="${Paging.getEndBlock() }" var="i">
	      <c:if test="${i == Paging.getPage() }">
	         <b><a href="notice_list.do?page=${i }">[${i }]</a></b>
	      </c:if>
	      
	      <c:if test="${i != Paging.getPage() }">
	         <a href="notice_list.do?page=${i }">[${i }]</a>
	      </c:if>
	   </c:forEach>
	   
	
	   <br>
	   
	</div>


</body>
</html>