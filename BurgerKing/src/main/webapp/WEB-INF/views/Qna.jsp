<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의</title>
<script src="resources/js/cs/qna.js"></script>

<link rel="shortcut icon" type="image/x-icon"
	href="resources/img/main/fab.ico">
<link href="resources/css/cs/qna.css"  rel="stylesheet"  type="text/css"> 
 <jsp:include page="header.jsp" /> 
</head>
<body>
	<div class="contentsWrap eventWrap">
		<!-- 1. 까만 영역 -->
		<div class="WEB locationWrap">
			<div class="web_container">
				<div class="page_navi">
					<a href="/burger/" class>
						<span>HOME</span>
					</a>
					<span>고객센터</span>
					<span>문의</span>
				</div>
			</div>
		</div>		<!-- 까만 영역 끝 -->
	
	
	<jsp:include page="cs_menu.jsp" />
	<div class = "tab_cont">
	<h4 class = "hide">문의</h4>
	<div class = "contentsBox01 bg_w CS_intro">
		<div class = "web_container">
		<div class = "help_infotxt">
			<p class="tit">
				<span>고객의 의견에</span>
				<span>귀 기울입니다</span>
			</p>
			<p class = "txt">
				<span>버거킹은 언제나 고객의 의견에 귀 기울이며 더 나은 서비스 이용 경험을 제공하고자 노력하고 있습니다.</span>
				<span>궁금하신 사항이 있거나 문제를 해결하는데 도움이 필요하신 경우
				<a>
					<strong>앱 이용안내 페이지</strong>
				</a>
				와
				<a> 
					<strong>FAQ 페이지</strong>
				</a>
				에서도 도움을 받으실 수 있습니다.
  			 	</span>
  			 	</p>
  			 </div>
  			</div>
  		</div>
  		 <div class = "contentsBox01 CS_contact">
  		 	<div class = "web_container">
  		 		<div class = "help_info">
  		 			<dl>
  		 				<dt>대표 소비자 상담</dt>	
  		 				<dd>
  		 					<div>
  		 						<Strong>080. 022. 8163</Strong>
  		 					</div>
  		 				</dd>
  		 				<dd>
	  		 				<p>
	  		 					상담 가능시간 : 월~일 09:00 ~ 18:00
	  		 					<br>
	  		 					(점심시간 12:00 ~ 13:00)
	  		 				</p>
  		 				</dd>
  		 			</dl>
  		 			<dl class = "cs_email">		 
  		 				<dt class="btn01">온라인 문의</dt> 
  		 					<dd>
  		 						<p>
  		 							서비스를 이용하시면서 궁금하시거나
  		 							<br>
  		 							불편한 사항은 온라인으로 접수 해주세요
  		 						</p>
  		 						<%-- <c:if test="${memberSession.getRight() == 'admin1'}"> --%>
  		 						<input type = "button" value="문의리스트" onclick="location.href='qna_list.do'">
  		 						<%-- </c:if> --%>
  		 						<div class="btn_area">
  		 							<br>
  		 							<br>
  		 						</div>
  		 					</dd>
  		 			</dl>
  		 			<ul>
  		 				<li class="service">
  		 					<span>서비스/제품 관련</span>
  		 					<strong>080. 022. 8163</strong>
  		 				</li>
  		 				<li class = "shop">
  		 					<span></span>
  		 					매장/SITE 개설상담
  		 					<strong>02. 6331. 8335</strong>
  		 				</li>
  		 				<li class = "proposal hide">
  		 					<span>제휴/프로모션 개설상담</span>
  		 					<strong>BurgerKing_media@bkr.co.kr</strong>
  		 				</li>
  		 			</ul>
  		 		</div>
  		 	</div>
  		 </div>
  	</div>
  	
  
  	
  	<!--  -->
<!--   </div> -->
  <jsp:include page="qna_popup.jsp" /> 
</body>
</html>