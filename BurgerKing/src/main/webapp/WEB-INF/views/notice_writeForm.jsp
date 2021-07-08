<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
	  
	      <h3>공지사항 글쓰기 </h3>
	  
	   <br> <br>
	
	   <form method="post"
	      action="<%=request.getContextPath() %>/notice_write_ok.do">
	      <div>
	      <table border="1" cellspacing="0" width="400">
	         <tr>
	         	<th>글제목</th>
	         	<td> <input type="text" name="notice_title"> </td>
	      	 </tr>
	      	 <tr>
	      	 	<th>글내용</th>
	      	 	<td>
	      	 		<textarea rows="7" cols="30" name="notice_cont"></textarea>
	      	 	</td>
	      	 </tr>
	      	 
	      	 <tr>
	      	 	<td colspan="2" align="center">
	      	       <input type="submit" value="글쓰기">&nbsp;&nbsp;
	      	 	   <input type="reset" value="다시작성">
	      	    </td>
	      	 </tr>
	      </table>
	   	  </div>
	   </form>
	</div>

</body>
</html>