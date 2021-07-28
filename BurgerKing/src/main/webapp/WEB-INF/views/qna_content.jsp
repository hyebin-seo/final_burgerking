<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
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
					<span>문의</span>
				</div>
			</div>
		</div>		<!-- 까만 영역 끝 -->
	
	<div id = "menu_m">
	<jsp:include page="qna_menu.jsp" />
	</div>
	<hr class="hr1">
		
	  
	  	<div class="qna_content" align="center">	   
	    <table class= "table2">
	    
	      <c:set var="dto" value="${Cont }" />
	      <c:if test="${!empty dto }">	         
	      	 <tr id = "tr1">            
	            <td id = "td1"> ${dto.getQna_title() } </td>	            	               	 
	      	 </tr>	      	 
	      	 
	      	  
	      	 <tr id = "tr2">	           
	            <td id = "td2" colspan="5">${dto.getQna_regdate() }
	            				 </td>     	            	      			        					            		      	 			
	      	 </tr>
	      	 
	      	<tr id ="tr3">	           
	            <td id = "td3"> 
	                            고객 : &emsp; ${dto.getQna_name() }  
	                            <br>
	                            번호 : &emsp; ${dto.getQna_phone() }
	                            <br> 
	            	메일 : &emsp; ${dto.getQna_mail() }
	            				<br> 
	            	분류 : &emsp; ${dto.getQna_field() }
	            				<br> 	            				
	            	지점 : &emsp; ${dto.getQna_store() }
	            				<br> 
	            	파일 : &emsp; <img src="../../burger/resources/img/qna/${dto.getQna_file() }"  alt="이미지없음" width="500px;" height="500px;" style="margin-left: 10%"   readonly>  	  
	            	 			<br> 
	            </td>
	      	 </tr>
	      	
	      	 
	      	 <tr id ="tr3">	           
	            <td id = "td3"> 
	            	${dto.getQna_cont() } 
	            	 
	            </td>
	      	 </tr>
	      	 	<br>
	      	 
	      	 
	      	  <tr id ="tr3">	           
	            <td id = "td3"> 
	            	문의 상태 :	 &emsp; ${dto.getQna_status() } 
	            	 
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
	      	 
	      	 
	         <td colspan="1" align="center">
	         
	         	
	             
	            <input type="button" class="btn_list" value = "목록보기"	                
	                onclick="location.href='qna_list.do?page=${page }'">
	            
	            <input type="button" class="btn_list" value = "확인"	                
	               onclick="location.href='qna_update.do?no=${dto.getQna_no() }&page=${page }'">
	        
	            
	              
	         </td>
	         
	      </tr>
	   
	
	   </div>
	
	

</body>
<div id = "footer_m">
<jsp:include page="siteMap.jsp" />
</div>
</html>