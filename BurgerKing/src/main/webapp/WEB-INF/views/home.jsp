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
		<div class="sns">
			<ul>
				<li><a
					href="https://www.youtube.com/channel/UCEKRI0fipK4LEgV98nI2CQA/featured"
					target="_blank"><img alt="youtube"
						src="resources/img/main/youtube1.png" style="width: 70%"></a></li>
				<li><a href="https://www.facebook.com/burgerkingkorea"
					target="_blank"> <img alt="youtube"
						src="resources/img/main/facebook.png" style="width: 70%"></a></li>
				<li><a href="https://www.instagram.com/burgerkingkorea"
					target="_blank"> <img alt="instargram"
						src="resources/img/main/insta.png" style="width: 70%"></a></li>
			</ul>
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

		<!-- 버거킹 대표번호 나오는 부분 -->
		<div class="phone">
			<img src="resources/img/main/1599.png">
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

     <!-- footer:include -->
     <jsp:include page="footer.jsp" />
	</footer>
	<!-- foote 끝 -->




</body>
</html>