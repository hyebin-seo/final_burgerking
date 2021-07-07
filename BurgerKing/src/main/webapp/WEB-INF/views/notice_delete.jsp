<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
	  
	      <h3>공지사항 삭제 폼</h3>
	 
	   <br> <br>
	   
	   <form method="post"
	      action="<%=request.getContextPath() %>/notice_delete_ok.do">
	      <c:set var="dto" value="${delete }" />
	      
	      <input type="hidden" name="notice_no" value="${dto.getNotice_no() }">     
	      <input type="hidden" name="page" value="${page }">
	     <div>
	      <table border="1" cellspacing="0" width="350">
	        
	         <tr>
	         	<td colspan="2" align="center">
	               <input type="submit" value="글삭제">&nbsp;&nbsp;
	             
	            </td>
	         </tr>
	      </table>
	   	  </div>
	   </form>
	</div>

</body>
</html>