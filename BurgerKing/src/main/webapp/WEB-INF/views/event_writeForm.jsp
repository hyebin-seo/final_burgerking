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

</head>
<body>

	<hr class="hr1">
	  
  
	   <br> <br>
	
	   <form method="post" 
	      action="<%=request.getContextPath() %>/event_write_ok.do" enctype="multipart/form-data">
	      
	      <div class = "event_write" align="center">
	     <table class= "table2">
	 		    <h1>이벤트 작성</h1>
	         <tr id = "tr1">
	        	
	         <th>이벤트제목</th>
	         	<td> <input type="text" name="event_title" size="100px"> </td>
	      	 </tr>
	      	 
	      	  <tr>
	           	<th>이벤트 상세이미지</th>
	         	<td> <input type="file" name="event_image"></td>	         	
	         </tr>		  				
	          
	         <tr>
	          <th>썸네일</th>
	         	<td> <input type="file" name="event_thum" > </td>
	      	 </tr>
	          
	          
	       <!--  <tr id = "tr1">  -->
	        <%--  <div class="inputArea">
 				<label for="gdsImg">이미지</label>
 				<input type="file" id="gdsImg" name="event_image" />
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
	      	 	<th>이벤트내용</th>
	      	 	<td>
	      	 		<textarea rows="30" cols="100" name="event_cont"></textarea>
	      	 	</td>
	      	 </tr>
	      	 
	      
	      	 
	      	 	      
	      </table>
	       <hr class="hr1">
	       	 <tr>
	      	 	<td colspan="2" align="center">
	      	 	
	      	       <input type="submit" class="btn_list" value="이벤트작성">&nbsp;&nbsp;
	      	 	   <input type="reset" class="btn_list" value="다시작성">
	      	    </td>
	      	 </tr>
	      	
	   	  </div>
	   </form>
	</div>

</body>
</html>