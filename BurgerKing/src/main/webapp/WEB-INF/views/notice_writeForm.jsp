<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
	
	   <form method="post" 
	      action="<%=request.getContextPath() %>/notice_write_ok.do" enctype="multipart/form-data">
	      
	      <div class = "notice_write" align="center">
	     <table class= "table2">
	 		    <h1>공지사항 작성</h1>
	         <tr id = "tr1">
	
	         	<th>공지제목</th>
	         	<td> <input type="text" name="notice_title" size="100px"> </td>
	      	 </tr>
	      	 
	      	   <tr>
	           	<th>첨부파일1</th>
	         	<td> <input type="file" name="notice_image">	         	
	          </td>	  	
	          </tr>			
	          
	           
	       <!--  <tr id = "tr1">  -->
	         <%--  <div class="inputArea">
 				<label for="gdsImg">이미지</label>
 				<input type="file" id="gdsImg" name="notice_image" />
			 <div class="select_img"><img src="" /></div>
	         <script>
 				 $("#gdsImg").change(function(){
  				 if(this.files && this.files[0]) {
  				  var reader = new FileReader;
   				 reader.onload = function(data) {
   				  $(".select_img img").attr("src", data.target.result).width(500);        
  					  }
   					 reader.readAsDataURL(this.files[0]);
  					 }
 					 });
 				</script>	   
 				
 				<%=request.getRealPath("/") %>
 				      
	         </div>  --%>
	        
	      	 
	      	 
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
<div id = "footer_m">
<jsp:include page="siteMap.jsp" />
</div>
</html>