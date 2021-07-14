<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<style type="text/css">
/* 중복아이디 존재하지 않는경우 */
.id_check_result1 {
	color: green;
	display: none;
}
/* 중복아이디 존재하는 경우 */
.id_check_result2 {
	color: red;
	display: none;
}

.pwd_check_result {
	color: red;
	display: none;
}

.pwd_check_result1 {
	color: green;
	display: green;
}
</style>


<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
	
    alert('${msg}')
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
						멋진 벅킹!<span>버거킹</span>
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
							<h3>
								가입시 회원정보로 등록한 아이디는 <b>${user_id}</b> 입니다.
							</h3>
						</div>
						<form action="find_id.do" method="post">
							<div></div>

						</form>
					</div>

					<div id="tab2" class="tab_content">
						<!--Content-->

						<div>
						<div>
							<h3>
								변경할 비밀번호를 작성해 주세요!!
							</h3>
						</div>
							<form action="auth_pwdOk.do" method="post">
								<div class="mb-3">
									<label for="pwd" class="form-label">비밀번호</label> <input
										type="password" name="user_pwd" required
										class="form-control pwd_check" id="pwd">
								</div>

								<div class="mb-3">
									<label for="pwd_check" class="form-label">비밀번호 확인</label> <input
										type="password" required
										class="form-control pwd_check" id="pwd_check">
									<p>
										<span class="pwd_check_result">비밀번호가 일치하지 않습니다.</span> <span
											class="pwd_check_result1">아주멌진 비밀번호입니다!</span>
									<p>
									<input type="hidden" value="${user_email}" name="user_email">
								</div>
								<input type="submit" value="확인">
							</form>
						</div>
					</div>

				</div>


			</div>
		</div>
	</section>


	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>

	<!-- js파일에 연결  -->
	<script type="text/javascript" src="resources/js/login/join.js"></script>
	
</body>
</html>