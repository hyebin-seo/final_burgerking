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
					<span>공지사항</span>
				</div>
			</div>
		</div>		<!-- 까만 영역 끝 -->

	<div id = "menu_m">
	<jsp:include page="cs_menu.jsp" />
	</div>
	<hr class="hr1">	
   
    <br> <br>
	
	
	<div align="center">
	
	      <h1>공지사항 수정</h1>
	   
	   <form method="post" 
	      action="<%=request.getContextPath() %>/notice_update_ok.do">
	      <c:set var="dto" value="${modify }" />
	      
	      <input type="hidden" name="notice_no" value="${dto.getNotice_no() }">   
	      <input type="hidden" name="page" value="${page }">	      
	      <div class = "notice_update" align="center">
	      <table class = "table2">	         
	         <tr id = "tr1">
	         	<th>공지제목</th>
	         	<td> <input type="text" name="notice_title"
	         	          value="${dto.getNotice_title() }" size="100px"> </td>
	         </tr>
	         
	         <tr id = "tr1">
	         	<th>공지사진</th>
	         	<td> 
					<textarea rows="1" cols="10" name="notice_image" readonly>${dto.getNotice_image() }</textarea>
	         	</td> 
	         	
	         	<!-- <td> <input type="file" name="notice_image"> </td>	  --> 	
	          			
	         </tr>
	         
	         <tr id = "tr1">
	         	<th>공지내용</th>
	         	<td> 
					<textarea rows="30" cols="100" name="notice_cont">${dto.getNotice_cont() }</textarea>
	         	</td>
	         </tr>
	      	 
	        
	    
	      </table>
	      <hr class="hr1">
	      
	       <tr>
	            <td colspan="2" align="center">
	               <input type="submit" class="btn_list" value="공지수정">&nbsp;&nbsp;
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