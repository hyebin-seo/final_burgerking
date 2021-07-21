<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버거킹</title>
</head>

<!-- jsp:header -->
<jsp:include page="header.jsp" />

<!-- 부트스트랩 적용하면 css가 다 깨지는데 방법을 찾아야할거같아요-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>

<link href="resources/css/user/Main.css" rel="stylesheet"
	type="text/css">
<body>


	<!-- 본문 시작  -->
	<section class="allPage">
		<!-- 이벤트 배너판. 이벤트에 있는 페이지와 연동되어야 합니다. -->
		<div id="carouselExampleDark" class="carousel slide"
			data-bs-ride="carousel" style="text-align: center">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="3" aria-label="Slide 4"></button>

			</div>
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="10000">
					<img src="resources/img/main/6.png" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item" data-bs-interval="2000">
					<img src="resources/img/main/7.png" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="resources/img/main/1.png" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="resources/img/main/2.png" class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleDark" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleDark" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
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
						<li><a><span>버거킹 스토리</span></a></li>
						<li><a><span>WHY 버거킹</span></a></li>
						<li><a><span>버거킹 News</span></a></li>
					</ul></li>
				<li><a><span>고객센터</span></a>
					<ul class="submenu">
						<li><a href="notice_list.do"><span>공지사항</span></a></li>
						<li><a><span>버거킹앱이용안내</span></a></li>
						<li><a href="faq_home.do?faq_cate=all"><span>FAQ</span></a></li>
						<li><a href="qna.do"><span>문의</span></a></li>
						<li><a><span>가맹점모집</span></a></li>
						<li><a><span>인재채용</span></a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	<!-- foote 끝 -->

</body>
<!-- jsp:footer -->
<jsp:include page="footer.jsp" />
</html>
