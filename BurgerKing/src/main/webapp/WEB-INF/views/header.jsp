<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버거킹</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/public/favicon.ico">
<!-- top nav부분 css -->

<!-- top nav부분 css end-->
<script src="https://kit.fontawesome.com/6584921572.js" crossorigin="anonymous"> </script>
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
<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
</head>
<body>
	<header id="header1">
		<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
			<div class="container-fluid">
				<img src="resources/img/main/buger2.png" width="110" height="100"
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
								<li><a class="dropdown-item" href="Login.do">스폐셜&할인팩</a></li>
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
								<li><a class="dropdown-item" href="store.do">매장찾기</a></li>

							</ul></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								이벤트 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="faq_home.do?faq_cate=all">이벤트</a></li>

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
                         <!-- Login.jsp로 이동! -->
						<li class="nav-item"><a class="nav-link " href="Login.do"
							role="button"> <img src="resources/img/main/delivery.png"
								width="150">
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

</body>
</html>