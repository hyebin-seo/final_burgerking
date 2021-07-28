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
<link rel="stylesheet" href="resources/css/user/findResult.css">




<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>

<script type="text/javascript">
	var type = "<c:out value='${sepwd}' />";
	var idtype = "<c:out value='${seid}' />";

	$(document).ready(function() {

		if (type == "sepwd") {

			$("ul.item2 li").eq(0).removeClass("on"); //Remove any "active" class
			$("ul.item2 li").eq(1).addClass("on");

			$("div.tab_cont").hide(); //Hide all tab content

			var activeTab = $("ul.item2 li").eq(1).find("a").attr("href"); //Find the href attribute value to identify the active tab + content

			$(activeTab).fadeIn(); //Fade in the active ID content

		}

		$('ul.item2 li:first').click(function() {

			if (type = "sepwd") {

				location.href = "find_id_pwd.do";

			}
		})

		$('ul.item2 li:nth-child(2)').click(function() {

			if (idtype = "seid") {

				location.href = "move_pwd.do?sepwd=sepwd";

			}
		})

	});
</script>


</head>
<body>


	<div id="app">
		<div class="subWrap02 header_offtype">
			<jsp:include page="../user/loginHeader.jsp"></jsp:include>

			<div class="contentsWrap">
				<div class="contentsBox01">
					<div class="web_container02">
						<div class="subtitWrap">
							<h2 class="page_tit">아이디/비밀번호 찾기</h2>
						</div>
						<div class="tab01 m_shadow">
							<ul class="item2">
								<li class="on"><a href="#tab1"> <span>아이디 찾기</span>
								</a></li>
								<li><a href="#tab2"> <span>비밀번호 찾기</span>
								</a></li>
							</ul>
						</div>
						<div class="tab_cont" id="tab1">
							<div class="container02 idpw_find_result">
								<div class="msgBox">
									<p class="tit">
										<strong>아이디 찾기 완료</strong>
									</p>
									<p>
										<strong>회원님</strong>의 아이디는 다음과 같습니다
									</p>
								</div>
								<div class="msgBox" style="display: none;">
									<p class="tit">
										<strong>비밀번호 재설정 경로 발송 완료</strong>
									</p>
									<p>
										<strong>회원님</strong>의 이메일로 비밀번호 재설정 경로를 발송하였습니다.
									</p>
								</div>
								<div class="result">
									<div>
										<span>${user_id} 버거킹(으)로 회원가입 하셨습니다.</span>
									</div>
								</div>
							</div>
							<div class="c_btn m_item2">
								<a class="btn01" href="move_pwd.do?sepwd=sepwd"><span>비밀번호
										찾기</span></a><a href="Login.do" class="btn01 red"><span>로그인</span></a>
							</div>

						</div>
						<div class="tab_cont" id="tab2">
							
							<div class="container02 idpw_find_result">
								<div class="msgBox" style="display: none;">
									<p class="tit">
										<strong>아이디 찾기 완료</strong>
									</p>
									<p>
										<strong>회원님</strong>의 아이디는 다음과 같습니다
									</p>
								</div>
								<div class="msgBox">
									<p class="tit">
										<strong>비밀번호 재설정 경로 발송 완료</strong>
									</p>
									<p>
										<strong>회원님</strong>의 이메일로 비밀번호 재설정 경로를 발송하였습니다.
									</p>
								</div>
								<div class="result">
									<div>
										<span>${user_id } (으)로 회원가입 하셨습니다.</span>
									</div>
								</div>
							</div>
							<div class="c_btn m_item2">
								<a class="btn01" href="/burger/"><span>홈바로가기</span></a><a
									href="#/logout" class="btn01 red"><span>로그인</span></a>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="../footer.jsp"></jsp:include>
			</div>
		</div>
	</div>

	<!---->
	</div>
	<!---->
	<!---->
	<a href="#app" class="btn_top" style="display: none;">Top</a>
	</div>


	<!-- js파일에 연결  -->
	<script type="text/javascript" src="resources/js/login/find_id_pwd2.js"></script>
</body>
</html>