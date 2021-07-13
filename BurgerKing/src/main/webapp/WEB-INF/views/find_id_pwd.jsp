<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>로그인</title>
<!-- 파비콘 -->
<link rel="shortcut icon" type="image/x-icon"
	href="resources/img/main/fab.ico">

<!-- 눈 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- Lgoin.css 연결 -->
<link rel="stylesheet" href="resources/css/user/find.css">




<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		//When page loads...
		$(".tab_content").hide(); //Hide all content
		$("ul.tabs li:first").addClass("active").show(); //Activate first tab
		$(".tab_content:first").show(); //Show first tab content

		//On Click Event
		$("ul.tabs li").click(function() {

			$("ul.tabs li").removeClass("active"); //Remove any "active" class
			$(this).addClass("active"); //Add "active" class to selected tab
			$(".tab_content").hide(); //Hide all tab content

			var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
			$(activeTab).fadeIn(); //Fade in the active ID content
			return false;
		});

	});
</script>
</head>
<body>
	<div class="app">
		<!-- 로그인페이지 header 및 상단고정 필수 -->
		<header class="head_main">
			<div class="head_menuWrap">
				<div style="margin-left: 10%; margin-right: 10%">

					<a style=""><span>브랜드홈</span></a> <a style=""><span>로그인</span></a>

					<a style=""><span>고객센터</span></a>

				</div>

				<div style="margin-left: 10%; margin-right: 10%">

					<h1>
						ㅁㄴㅇ<span>버거킹</span>
					</h1>

				</div>
			</div>

		</header>
		<div class="head_nav">
			<div class="page_navi">
				<a href="#/home" class=""><span>HOME</span></a> <a><span>로그인</span></a>
				<a><span>아이디 / 비밀번호찾기</span></a>

			</div>
		</div>


	</div>


	<!-- 아이디/비밀번호 입력하는 공간 -->

	<section class="login_section">

		<!-- 비회원 주문  -->
		<div>
			<h1>아이디 / 비밀번호 찾기</h1>
		</div>
		<div class="noid_order">

			<div id="wrapper">
				<!--탭 메뉴 영역 -->

				<ul class="tabs">
					<li><a href="#tab1">아이디 찾기</a></li>
					<li><a href="#tab2">비밀번호 찾기</a></li>
				</ul>

				<!--탭 콘텐츠 영역 -->
				<div class="tab_container">

					<div id="tab1" class="tab_content">
						<!--Content-->
						<div>
							<h3>가입시 회원정보로 등록한 이름과 휴대폰 번호를 입력해 주세요.</h3>
						</div>
						<form action="find_id.do" method="post">
							<div>
								<dl>
									<dt>이름</dt>
									<dd>
										<div class="inpbox">
											<label><input type="text" placeholder="이름을 입력해주세요"
												name="user_name" class="st02" required="required">
												<button type="button" class="btn_del01" style=""></button></label>
											<p class="txt" style="display: none;">이름을 입력해 주세요.</p>
										</div>
									</dd>
									<dt>휴대폰번호</dt>
									<dd>
										<div class="inpbox">
											<label><input type="text"
												placeholder="휴대폰번호를 입력해주세요." name="user_phone" class="st02"
												required="required">
												<button type="button" class="btn_del02" style=""></button></label>
											<p class="txt" style="display: none;">핸드폰 번호를 입력해 주세요.</p>
										</div>
									</dd>
								</dl>
							</div>
							<div class="transform_btn" align="center">
								<input type="submit" value="아이디찾기">
							</div>
						</form>
					</div>

					<div id="tab2" class="tab_content">
						<div>
							<h3>회원님의 정보(이메일)로 비밀번호 재설정을 위한 경로를 보내 드립니다.</h3>

						</div>
						<form action="find_pwd.do" method="post">
							<div>
								<dl>
									<dt>이름</dt>
									<dd>
										<div class="inpbox">
											<label><input type="text" placeholder="이름을 입력해주세요"
												name="user_name" class="st02">
												<button type="button" class="btn_del01" style=""></button></label>
											<p class="txt" style="display: none;">이름을 입력해 주세요.</p>
										</div>
									</dd>
									<dt>이메일주소</dt>
									<dd>
										<div class="inpbox">
											<label><input type="email"
												placeholder="휴대폰번호를 입력해주세요." name="user_email" class="st02"
												required="required">
												<button type="button" class="btn_del02" style=""></button></label>
											<p class="txt" style="display: none;">핸드폰 번호를 입력해 주세요.</p>
										</div>
									</dd>
								</dl>
							</div>
							<div class="transform_btn" align="center">
								<input type="submit" value="비밀번호찾기">
							</div>
						</form>
					</div>
				</div>
	</section>


	<footer>
		<jsp:include page="footer.jsp" />
	</footer>

	<!-- js파일에 연결  -->
	<script type="text/javascript" src="resources/js/login/login.js"></script>
	</div>
</body>
</html>