<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버거킹</title>
<script type="text/javascript">
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {  
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}

</script>
</head>

<!-- jsp:header -->
<jsp:include page="header.jsp" />

<!-- 부트스트랩 적용하면 css가 다 깨지는데 방법을 찾아야할거같아요-->
	

<link href="resources/css/user/Main.css" rel="stylesheet"
	type="text/css">
<body>


	<!-- 본문 시작  -->
	<section class="allPage">
		<!-- 이벤트 배너판. 이벤트에 있는 페이지와 연동되어야 합니다. -->
		<div class="slideshow-container">

            <div class="mySlides fade first">
              <div class="numbertext">1 / 3</div>
              <img src="resources/img/main/2.png" style="width:100%">
              
            </div>
            
            <div class="mySlides fade second">
              <div class="numbertext">2 / 3</div>
              <img src="resources/img/main/3.png" style="width:100%">
              
            </div>
            
            <div class="mySlides fade third">
              <div class="numbertext">3 / 3</div>
              <img src="resources/img/main/4.png" style="width:100%">
              
            </div>
            
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
            
            </div>
            <br>
            
            <div style="text-align:center">
              <span class="dot" onclick="currentSlide(1)"></span> 
              <span class="dot" onclick="currentSlide(2)"></span> 
              <span class="dot" onclick="currentSlide(3)"></span> 
            </div>
		<!-- 이벤트 배너판 end. -->


		<!-- youtube video 임베디드 -->
		<div id="carouselExampleControls" class="carousel slide"
			data-bs-ride="carousel" data-bs-interval="false">
			<div class="carousel-inner" style="text-align: center">
				<div class="carousel-item active">
					<iframe width="100%" height="600"
						src="https://www.youtube.com/embed/MbqUVZcpIac" frameborder="0"
						allow="autoplay; encrypted-media" allowfullscreen></iframe>
				</div>
			</div>
		</div>
		<!-- youtube video 임베디드 end -->

		<!-- SNS 이동   -->
		<div class="contentsBox01 home_snsWrap">
			<div class="web_container">
				<ul class="list">
					<li class="youtube"><div class="cont">
							<strong class="tit">YOUTUBE</strong><strong class="status">구독2.3만</strong><a
								href="https://www.youtube.com/channel/UCEKRI0fipK4LEgV98nI2CQA/featured"
								target="_blank" class="btn_detail"><span>Details</span></a>
						</div></li>
					<li class="facebook"><div class="cont">
							<strong class="tit">FACEBOOK</strong><strong class="status">좋아요
								51.8만</strong><a href="https://www.facebook.com/burgerkingkorea"
								target="_blank" class="btn_detail"><span>Details</span></a>
						</div></li>
					<li class="insta"><div class="cont">
							<strong class="tit">INSTAGRAM</strong><strong class="status">팔로워
								413.0K</strong><a href="https://www.instagram.com/burgerkingkorea"
								target="_blank" class="btn_detail"><span>Details</span></a>
						</div></li>
				</ul>
			</div>
		</div>
		<!-- SNS 이동 끝  -->

		<!--app 및 딜리버리 시작 -->

		<div class="app_delivery">
			<div class="app">
				<a href="#"><img alt="app이미지" src="resources/img/main/app.png">
				</a>
			</div>
			<div class="delivery">
				<a href="#"><img alt="app이미지"
					src="resources/img/main/delivery_app.png"> </a>
			</div>
		</div>
		<!--app 및 딜리버리 끝 -->

		<!-- 매장찾기 -->
		<div class="contentsBox01 home_searchshop">
			<div class="web_container">
				<h2 class="titl">매장찾기</h2>
				<p>고객님 주변에 있는 버거킹을 찾아보세요!</p>
				<div class="c_btn">
					<a class="btn01 s red" href="store.do"><span>매장찾기</span></a>
				</div>
				<ul class="shop_categorylist">
					<li class="category_delivery"><span class="WEB">집에서
							편안하게 <br>받을 수 있는
					</span><em>딜리버리</em></li>
					<li class="category_king"><span class="WEB">미리 주문하고 <br>픽업가능한
					</span><em>킹오더 </em></li>
					<li class="category_drive"><span class="WEB">차안에서 빠르게 <br>이용할
							수 있는
					</span><em>드라이브 스루</em></li>
					<li class="category_24"><span class="WEB">24시간 언제든 <br>함께할
							수 있는
					</span><em>24시간</em></li>
					<li class="category_morning"><span class="WEB">든든한 <br>아침을
							도와줄
					</span><em>아침메뉴</em></li>
					<li class="category_parking"><span class="WEB">내 차와 함께
							<br>올 수 있는
					</span><em>주차공간</em></li>
				</ul>
			</div>
		</div>

		<!-- 버거킹 대표번호 나오는 부분 -->
		<div class="phone">
			<img src="resources/img/main/1599.png">
		</div>
		<!-- 버거킹 대표번호 나오는 부분  끝(이미지처리)-->

	</section>
	<!-- 본문   -->


	<!-- foote(sitemap) 시작 -->
	<div class="WEB sitemap web_max">
		<div class="web_container">
			<ul class="menu">
				<li><a><span>메뉴</span></a>
					<ul class="submenu"></ul></li>
				<li><a><span>매장</span></a>
					<ul class="submenu">
						<li><a href="store.do"><span>매장찾기</span></a></li>
					</ul></li>
				<li><a><span>이벤트</span></a>
					<ul class="submenu">
						<li><a href="event_list.do"><span>이벤트</span></a></li>
					</ul></li>
				<li><a><span>브랜드 스토리</span></a>
					<ul class="submenu">
						<li><a href="brandStory.do"><span>버거킹 스토리</span></a></li>
						<li><a href="whyBurgerking.do"><span>WHY 버거킹</span></a></li>
						<li><a href="burgerkingNews.do"><span>버거킹 News</span></a></li>
					</ul></li>
				<li><a><span>고객센터</span></a>
					<ul class="submenu">
						<li><a href="notice_list.do"><span>공지사항</span></a></li>
						<li><a href="faq_home.do?faq_cate=all"><span>FAQ</span></a></li>
						<li><a href="Qna.do"><span>문의</span></a></li>
						<li><a href="Franchise.do"><span>가맹점모집</span></a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	<!-- foote 끝 -->

</body>
<!-- jsp:footer -->
<jsp:include page="footer.jsp" />
</html>
