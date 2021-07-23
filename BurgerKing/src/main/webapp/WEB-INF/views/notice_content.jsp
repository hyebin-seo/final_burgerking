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
	
	<div id = "menu_m">
	<jsp:include page="cs_menu.jsp" />
	</div>
	<hr class="hr1">
		
	  
	  	<div class="notice_content" align="center">	   
	    <table class= "table2">
	    
	      <c:set var="dto" value="${Cont }" />
	      <c:if test="${!empty dto }">	         
	      	 <tr id = "tr1">            
	            <td id = "td1"> ${dto.getNotice_title() } </td>	            	               	 
	      	 </tr>	      	 
	      	 
	      	  
	      	 <tr id = "tr2">	           
	            <td id = "td2" colspan="5"> <fmt:formatDate value="${dto.getNotice_regdate() }"
	            				pattern="yyyy-MM-dd HH:mm" /> </td>     	            	      			        					            		      	 			
	      	 </tr>
	      	<tr id = "tr2">
	      	 <td id = "td2-2">조회수ㅣ${dto.getNotice_hit() }</td> 
	      	</tr> 
	      	
	      	<tr id ="tr3">	           
	            <td id = "td3"> 	    	            		        	 
 	           		 <img src="../../burger/resources/img/notice/${dto.getNotice_image() }"  alt="이미지없음" width="800px;" height="800px;" style="margin-left: 10%"   readonly>  	            			            
	            </td>
	      	 </tr>
 
	      	 <tr id ="tr3">	           
	            <td id = "td3"> 
	            	${dto.getNotice_cont() } 
	            	 
	            </td>
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
	      	 </table>
	      	 <hr class="hr1">
	         <td colspan="2" align="center">
	         
	            <input type="button" class="btn_list" value="공지수정"
	                onclick="location.href='notice_update.do?no=${dto.getNotice_no() }&page=${page }'">
	                 
	            <input type="button" class="btn_list" value = "목록보기"	                
	                onclick="location.href='notice_list.do?page=${page }'">
	            
	            <input type="button" class="btn_list" value="공지삭제"
	                onclick="if(confirm('공지사항을 삭제 하시겠습니까?')) {
	                				location.href='notice_delete.do?no=${dto.getNotice_no() }&page=${page }'
	                		 }else {return; }">
	          
	            
	         </td>
	         
	      </tr>
	   
	
	   </div>
	
	

</body>
<div id = "footer_m">
<jsp:include page="footer.jsp" />
</div>
</html>