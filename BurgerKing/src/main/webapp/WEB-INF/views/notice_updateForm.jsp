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
	
	      <h3>수정</h3>
	
	   <br> <br>
	   
	   <form method="post"
	      action="<%=request.getContextPath() %>/notice_update_ok.do">
	      <c:set var="dto" value="${modify }" />
	      
	      <input type="hidden" name="notice_no" value="${dto.getNotice_no() }">   
	      <input type="hidden" name="page" value="${page }">	      
	      <div>
	      <table border="1" cellspacing="0" width="450">
	         
	         <tr>
	         	<th>글제목</th>
	         	<td> <input type="text" name="notice_title"
	         	          value="${dto.getNotice_title() }"> </td>
	         </tr>
	         <tr>
	         	<th>글내용</th>
	         	<td> 
					<textarea rows="7" cols="30" name="notice_cont">${dto.getNotice_cont() }</textarea>
	         	</td>
	         </tr>
	      
	         <tr>
	            <td colspan="2" align="center">
	               <input type="submit" value="글수정">&nbsp;&nbsp;
	         	   <input type="reset" value="다시작성">
	            </td>
	         </tr>
	    
	      </table>
	   	  </div>
	   </form>
	</div>

</body>
</html>