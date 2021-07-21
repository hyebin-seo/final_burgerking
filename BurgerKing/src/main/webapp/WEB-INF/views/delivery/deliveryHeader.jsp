<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/img/public/favicon.ico">
<link rel="icon" href="resources/img/public/favicon.ico">
<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- 아이콘 CDN 링크 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
<!-- 글꼴 CDN 링크 -->
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="resources/css/delivery/deliveryHeader.css"  rel="stylesheet"  type="text/css">



<div class="delivery_navbar">
	 <div class="delivery_navbar_right_menu">
	  	<ul style="padding-left: 70%;">
	        <li><a href="/burger/">브랜드홈</a></li>
	        <c:if test="${!empty memberSession }">
	        	<li class="border_li"><a href="logout.do">로그아웃</a></li>
	        </c:if>
	        <c:if test="${empty memberSession }">
	        	<li class="border_li"><a href="Login.do">로그인</a></li>
	        </c:if>
	        <li class="border_li"><a href="">고객센터</a></li>
	    </ul>
	</div>
	
	<div class="logo_myinfo_all_div">
      <div class="delivery_navbar_logo">
        <h1 class="king_logo"><a href="delivery_home.do"><span><b>딜리버리</b></span></a></h1>
      </div>
      
      <div class="delivery_navbar_myinfo">
      	<a href="mypage_main.do">
	      <div class="my_info_icon"><i class="fas fa-user-circle"></i></div>
	      <div class="my_info_span_div">
	        <div class="span_div"><span id="user_name_span">${memberSession.user_name}</span> 님 안녕하세요.</div>
	      	<div class="span_div"><Strong>MY킹 바로가기 ></Strong></div>
	      </div>
	    </a> 
	  </div>
	</div>
	 
	<div class="mob_header_center_div">
	  <a href="#" class="delivery_navbar_toggleBtn">
        <i class="fas fa-bars"></i>
      </a>
      
      <div class="mob_delivery_navbar_logo">
        <h1 class="mob_king_logo"><a href="delivery_home.do"><span>딜리버리</span></a></h1>
      </div>
      
      <a href="#" class="delivery_navbar_cartBtn">
      	<i class="fas fa-shopping-cart"></i>
      </a>
   </div>
</div>


      
<div class="delivery_navbar_menu_div">
	<div class="menu_div_close"><i class="fas fa-times"></i></div>
	<div class="brand_home_div"><i class="fas fa-home"></i>브랜드홈</div>
	<div class="info_div">(비회원)님 안녕하세요.</div>
	<div class="delivery_navbar_menu">
	   	<ul class="menu_all_ul">
	   		<li class="menu_li">MY킹
			   	<ul class="menu_ul">
			       <li><a href="">스탬프</a></li>
			       <li><a href="">딜리버리 쿠폰</a></li>
			       <li><a href="">MY세트</a></li>
			       <li><a href="">MY배달지</a></li>
			   	</ul>
		   	</li>
		   	<li class="menu_li">주문내역</li>
		   	<li class="menu_li">고객센터
			   	<ul class="menu_ul">
			       <li><a href="">공지사항</a></li>
			       <li><a href="">FAQ</a></li>
			       <li><a href="">문의</a></li>
			       <li><a href="">가맹점모집</a></li>
			   	</ul>
		   	</li>
	   	</ul>
   	</div>
</div>

<script src="resources/js/delivery/deliveryHeader.js"></script>





