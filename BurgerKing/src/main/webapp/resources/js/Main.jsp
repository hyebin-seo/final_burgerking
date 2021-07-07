<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버거킹</title>
<link rel="shortcut icon" type="image/x-icon"
	href="resources/images/fab.ico">
<!-- top nav부분 css -->

<!-- top nav부분 css end-->
<script src="https://kit.fontawesome.com/6584921572.js"
	crossorigin="anonymous">
	
</script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous">
	
</script>

</head>
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<body>
	<header id="header1">
		<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
			<div class="container-fluid">
				<img src="resources/images/buger2.png" width="110" height="100"
					class="bugerLog">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">

						<!--  <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li> -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								메뉴소개 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">스폐셜&할인팩</a></li>
								<li><a class="dropdown-item" href="#">프리미엄</a></li>
								<li><a class="dropdown-item" href="#">와퍼</a></li>
								<li><a class="dropdown-item" href="#">주니어&버거</a></li>
								<li><a class="dropdown-item" href="#">올데이&치킨버거</a></li>
								<li><a class="dropdown-item" href="#">사이드</a></li>
								<li><a class="dropdown-item" href="#">음료&디저트</a></li>
								<!-- 선넣기  <li><hr class="dropdown-divider"></li> -->
							</ul></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								매장소개 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">매장찾기</a></li>

							</ul></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								이벤트 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">이벤트</a></li>

							</ul></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								브랜드스토리 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">버거킹 스토리</a></li>
								<li><a class="dropdown-item" href="#">why 버거킹</a></li>
								<li><a class="dropdown-item" href="#">버거킹 News</a></li>
							</ul></li>

						<li class="nav-item"><a class="nav-link dropdown-toggle"
							href="#" id="navbarDropdown" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> <img
								src="resources/images/delivery.png" width="150">
						</a></li>
						<!-- disabled 메뉴가 왜 필요할까? 근데 그냥 냅둬봐야지 ㅋㅋㅋ<li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
        </li> -->
					</ul>

				</div>
				<div></div>
			</div>
		</nav>
	</header>
	<!-- header 마무리 -->
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
					<img src="resources/images/6.png" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item" data-bs-interval="2000">
					<img src="resources/images/7.png" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="resources/images/1.png" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="resources/images/2.png" class="d-block w-100" alt="...">
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
		<div class="sns">
			<ul>
				<li><a
					href="https://www.youtube.com/channel/UCEKRI0fipK4LEgV98nI2CQA/featured"
					target="_blank"><img alt="youtube"
						src="resources/images/youtube1.png" style="width: 70%"></a></li>
				<li><a href="https://www.facebook.com/burgerkingkorea"
					target="_blank"> <img alt="youtube"
						src="resources/images/facebook.png" style="width: 70%"></a></li>
				<li><a href="https://www.instagram.com/burgerkingkorea"
					target="_blank"> <img alt="instargram"
						src="resources/images/insta.png" style="width: 70%"></a></li>
			</ul>
		</div>
		<!-- SNS 이동 끝  -->

		<!--app 및 딜리버리 시작 -->

		<div class="app_delivery">
			<div class="app">
				<a href="#"><img alt="app이미지" src="resources/images/app.png">
				</a>
			</div>
			<div class="delivery">
				<a href="#"><img alt="app이미지"
					src="resources/images/delivery_app.png"> </a>
			</div>
		</div>
		<!--app 및 딜리버리 끝 -->

		<!-- 버거킹 대표번호 나오는 부분 -->
		<div class="phone">
			<img src="resources/images/1599.png">
		</div>
		<!-- 버거킹 대표번호 나오는 부분  끝(이미지처리)-->







	</section>
	<!-- 본문   -->


	<!-- foote 시작 -->
	<footer class="footer">
		<div class="info">
		
		  <div class="info_div">
		     <ul class="info_ul1">
		       <li>메뉴</li>
		       <li>매장</li>
		       <li>이벤트</li>
		       <li>브랜드 스토리</li>
		       <li>고객센터</li>
		     </ul>
		  </div>
		
		
		</div>
		

	</footer>
	<!-- foote 끝 -->




</body>
</html>