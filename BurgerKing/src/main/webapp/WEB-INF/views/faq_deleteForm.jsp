<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ삭제</title>
<link  href="resources/css/cs/faq_deleteForm.css"  rel="stylesheet"  type="text/css">
</head>
<body>
	<jsp:include page="cs_menu.jsp" />	
	<div class="deleteTitle" align="center">
	      <p>FAQ 삭제시 복구되지 않습니다.</p>
	   <br><br>
	   
	   <form method="post"
	      action="<%=request.getContextPath() %>/faq_deleteOk.do">
	      <c:set var="dto" value="${faqDelete }" />
	      
	      <input type="hidden" name="faq_no" value="${dto.getFaq_no() }">     
	      <input type="hidden" name="page" value="${page }">
	      <input type="hidden" name="category" value="${category }">   
	     <div>
	      <table class="table2">
	        
	         <tr>
	         	<td colspan="2" align="center">
	               <input type="submit" class="btn_list" value="FAQ삭제">&nbsp;&nbsp;
	               <input type="button" class="btn_list" value="뒤로가기"
	                onclick="location.href='faq_home.do?faq_cate=${category }&page=${page}'">
	            </td>
	         </tr>
	      </table>
	   	  </div>
	   </form>
	 </div>
</body>
</html>