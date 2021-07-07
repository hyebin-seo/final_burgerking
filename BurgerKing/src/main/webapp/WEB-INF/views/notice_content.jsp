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
	
	      <h3>공지사항 상세 내역</h3>
	  
	   <br> <br>
	   <div>
	   <table border="1" cellspacing="0" width="400">
	      <c:set var="dto" value="${Cont }" />
	      <c:if test="${!empty dto }">	         
	      	 <tr>
	            <th>글제목</th>
	            <td> ${dto.getNotice_title() } </td>
	      	 </tr>
	      	 <tr>
	            <th>글내용</th>
	            <td> 
	            	<textarea rows="7" cols="30" readonly>${dto.getNotice_cont() }</textarea>  
	            </td>
	      	 </tr>
	      	 
	      	 <tr>
	            <th>조회수</th>
	            <td> ${dto.getNotice_hit() } </td>
	      	 </tr>
	      	 <tr>
	            <th>작성일자</th>
	            <td> <fmt:formatDate value="${dto.getNotice_regdate() }"
	            				pattern="yyyy-MM-dd HH:mm" />  </td>
	      	 </tr>
	      </c:if>
	      
	      <c:if test="${empty dto }">
	         <tr>
	            <td colspan="2" align="center">
	               <h3>검색된 게시글이 없습니다.....</h3>
	            </td>
	         </tr>
	      </c:if>
	      
	      <tr>
	         <td colspan="2" align="center">
	            <input type="button" value="글수정"
	                onclick="location.href='notice_update.do?no=${dto.getNotice_no() }&page=${page }'">
	            <input type="button" value="글삭제"
	                onclick="if(confirm('게시글을 삭제 하시겠습니까?')) {
	                				location.href='notice_delete.do?no=${dto.getNotice_no() }&page=${page }'
	                		 }else {return; }">
	            <input type="button" value="전체목록"
	                onclick="location.href='notice_list.do?page=${page }'">
	         </td>
	      </tr>
	   </table>
	   </div>
	
	</div>

</body>
</html>