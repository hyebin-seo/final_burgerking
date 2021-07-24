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
	<jsp:include page="header.jsp" />	
<body>
	
	<div id = "menu_m">
		<jsp:include page="event_menu.jsp" />	
	 </div>
	  	
	<hr class="hr1">	
	  
	  	<div class="event_content" align="center">	   
	    <table class= "table2">
	    
	      <c:set var="dto" value="${Cont }" />
	      <c:if test="${!empty dto }">	         
	      	 <tr id = "tr1">            
	            <td id = "td1"> ${dto.getEvent_title() } </td>	            	               	 
	      	 </tr>	      	 
	      	 
	      	  
	      	 <tr id = "tr2">	           
	            <td id = "td2" colspan="5"> <fmt:formatDate value="${dto.getEvent_regdate() }"
	            				pattern="yyyy-MM-dd HH:mm" /> </td>     	            	      			        					            		      	 			
	      	 </tr>
	      
	      	
	      	<tr id ="tr3">	           
	            <td id = "td3"> 	    	            		        	 
 	           		 <img src="../../burger/resources/img/event/${dto.getEvent_image() }"  alt="이미지없음" width="800px;" height="800px;" style="margin-left: 10%"   readonly>  	            			            
	            </td>
	      	 </tr>
 
	      	 <tr id ="tr3">	           
	            <td id = "td3"> 
	            	${dto.getEvent_cont() } 
	            	 
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
	         
	         	<c:if test="${memberSession.getRight() == 'admin1'}">
	            
	            <input type="button" class="btn_list" value="이벤트수정"
	                onclick="location.href='event_update.do?no=${dto.getEvent_no() }&page=${page }'">
	            </c:if>  
	            <input type="button" class="btn_list" value = "목록보기"	                
	                onclick="location.href='event_list.do?page=${page }'">
	            
	            <c:if test="${memberSession.getRight() == 'admin1'}">
	            <input type="button" class="btn_list" value="이벤트삭제"
	                onclick="if(confirm('이벤트를 삭제 하시겠습니까?')) {
	                				location.href='event_delete.do?no=${dto.getEvent_no() }&page=${page }'
	                		 }else {return; }">
	          </c:if>
	            
	         </td>
	         
	      </tr>
	   
	
	   </div>
	
	

</body>

<div id = "footer_m">
<jsp:include page="footer.jsp" />
</div>
</html>