<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link  href="resources/css/cs/event.css"  rel="stylesheet"  type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<jsp:include page="header.jsp" />	
</head>
<body>

	<!-- 1. 까만 영역 -->
		<div class="WEB locationWrap">
			<div class="web_container">
				<div class="page_navi">
					<a href="/burger/" class>
						<span>HOME</span>
					</a>
					<span>신규매장</span>
					<span>상세</span>
				</div>
			</div>
		</div>		<!-- 까만 영역 끝 -->

	<div id = "menu_m">
		<jsp:include page="store_menu.jsp" />	
	  	</div>
	  	
	<hr class="hr1">
	  
  
	   <br> <br>
	
	   <form method="post" 
	      action="<%=request.getContextPath() %>/store_write_ok.do" enctype="multipart/form-data">
	      
	      <div class = "store_write" align="center">
	     <table class= "table2">
	 		    <h1>매장 작성</h1>
	         <tr id = "tr1">
	
	         	<th>매장제목</th>
	         	<td> <input type="text" name="store_title" size="100px"> </td>
	      	 </tr>
	      	 
	      	 <tr>
	           	<th>스토어 상세사진</th>
	         	<td> <input type="file" name="store_image" ></td>	 
	         </tr>
	         
	         <tr>
	           	<th>스토어 썸네일</th>
	         	<td> <input type="file" name="store_thum" ></td>	 
	         </tr>
	           				
	          
	       <!--  <tr id = "tr1">  -->
	        <%--  <div class="inputArea">
 				<label for="gdsImg">이미지</label>
 				<input type="file" id="gdsImg" name="store_image" />
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
 				      
	         </div> --%>
	         
	      	 
	      	 
	      	 <tr id = "tr1">
	      	 	<th>매장내용</th>
	      	 	<td>
	      	 		<textarea rows="30" cols="100" name="store_cont"></textarea>
	      	 	</td>
	      	 </tr>
	      	 
	      
	      	 
	      	 	      
	      </table>
	       <hr class="hr1">
	       	 <tr>
	      	 	<td colspan="2" align="center">
	      	 	
	      	       <input type="submit" class="btn_list" value="매장작성">&nbsp;&nbsp;
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