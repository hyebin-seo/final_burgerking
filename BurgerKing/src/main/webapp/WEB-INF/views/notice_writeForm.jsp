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

	<hr class="hr1">
	  
  
	   <br> <br>
	
	   <form method="post" enctype="multipart/form-data"
	      action="<%=request.getContextPath() %>/notice_write_ok.do">
	      
	      <div class = "notice_write" align="center">
	     <table class= "table2">
	 		    <h1>공지사항 작성</h1>
	         <tr id = "tr1">
	         	<th>공지제목</th>
	         	<td> <input type="text" name="notice_title" size="100px"> </td>
	      	 </tr>
	      	 
	      	  <tr>
	           	<th>첨부파일1</th>
	         	<td> <input type="file" name="notice_image" > </td>
	         </tr>
	      	 
	      	 
	      	 <tr id = "tr1">
	      	 	<th>공지내용</th>
	      	 	<td>
	      	 		<textarea rows="30" cols="100" name="notice_cont"></textarea>
	      	 	</td>
	      	 </tr>
	      	 
	      
	      	 
	      	 	      
	      </table>
	       <hr class="hr1">
	       	 <tr>
	      	 	<td colspan="2" align="center">
	      	 	
	      	       <input type="submit" class="btn_list" value="글쓰기">&nbsp;&nbsp;
	      	 	   <input type="reset" class="btn_list" value="다시작성">
	      	    </td>
	      	 </tr>
	   	  </div>
	   </form>
	</div>

</body>
</html>