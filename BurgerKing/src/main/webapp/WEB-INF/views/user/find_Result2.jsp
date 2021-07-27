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

<script type="text/javascript">
	$(document).ready(function() {

		$(".btn_head_menu").click(function() {

			$(".headerWrap").addClass("side_open");
			$('div.MOB.m_utliWrap').css('display', 'block');
		});

		$(".btn_head_close").click(function() {
			$(".headerWrap").removeClass("side_open");
		});

		$(".GNBWrap li").click(function() {
			$(this).toggleClass("menu_open");
		});

	});

	function go_brand() {
		location.href = '/burger/';
	}
</script>
</head>
<body>


	<div id="app">
		<div class="subWrap02 header_offtype">
			<div class="headerWrap">
				<div class="head_menuWrap ">
					<div class="web_container">
						<h1 class="WEB logo">
							<span>버거킹</span>
						</h1>
						<div class="WEB utilWrap">
							<a><span>브랜드홈</span></a><a style="display: none;"><span>로그아웃</span></a><a
								style="display: none;"><span>MY킹</span></a><a><span>로그인</span></a><a><span>고객센터</span></a>
						</div>
						<div class="MOB m_utilWrap">
							<div class="m_top">
								<button class="btn_head_close">
									<span>Menu Close</span>
								</button>
								<button class="btn_brandhome">
									<span>브랜드 홈</span>
								</button>
							</div>
							<div class="util_logon">
								<div class="user">
									<p>
										<strong><span> 고객</span>(비회원)</strong> 님
									</p>
									<div class="btn_area">
										<a class="btn04"><span>회원가입</span></a><a class="btn04"><span>로그인</span></a>
									</div>
								</div>
							</div>
							<div class="util_logoff">
								<p>
									<strong>WHERE TASTE IS KING</strong><br>버거킹과 함께하는 맛있는 세계!
								</p>
								<div class="btn_area">
									<a class="btn04"><span>회원가입</span></a><a class="btn04"><span>로그인</span></a>
								</div>
							</div>
						</div>
						<div class="WEB on_cont join">
							<a class="btn_join"><strong>회원가입</strong></a>
						</div>
						<div class="WEB off_cont join">
							<a class="btn_join"><strong>회원가입</strong></a>
						</div>
						<div class="MOB GNBWrap">
							<ul>
								<li class="">
									<!---->
									<ul class="submenu">
										<li><a><span>스탬프</span></a></li>
										<li><a><span>딜리버리 쿠폰</span></a></li>
										<li><a><span>MY세트</span></a></li>
										<li><a><span>MY배달지</span></a></li>
									</ul>
								</li>
								<!---->
								<li class=""><button type="button">
										<span>고객센터</span>
									</button>
									<ul class="submenu">
										<li><a><span>공지사항</span></a></li>
										<li><a><span>버거킹앱이용안내</span></a></li>
										<li><a><span>FAQ</span></a></li>
										<li><a><span>문의</span></a></li>
										<li><a><span>가맹점모집</span></a></li>
										<li><a><span>인재채용</span></a></li>
									</ul></li>
							</ul>
							<!---->
						</div>
					</div>
				</div>
			</div>
			<!-- 추가 -->
			<div class="WEB on_cont head_personalWrap">
				<div class="web_container">
					<div class="personal_logoff" style="display: none;">
						<p>WHERE TASTE IS KING! 버거킹과 함께하는 맛있는 세계!</p>
						<a><strong>회원가입하고 혜택받기</strong></a>
						<div class="btn_area">
							<a href="Login.do"><strong>로그인</strong></a><a><strong>비회원
									주문내역</strong></a>
						</div>
					</div>
					<div class="personal_logon " style="display: none;">
						<a><div class="personal_order">
								<dl>
									<dt>
										<strong>딜리버리 주문내역</strong>
									</dt>
									<dd>주문내역이 없습니다.</dd>
								</dl>
							</div></a><a><div class="personal_cart">
								<dl>
									<dt>
										<strong>카트</strong><em class="count" style="display: none;"><span>0</span></em>
									</dt>
									<dd>카트에 담은 상품이 없습니다</dd>
								</dl>
							</div></a>
					</div>
				</div>
			</div>
			<div class="MOB M_headerWrap">
				<div class="web_container">
					<div class="MOB titleBar st02">
						<h1 class="page_tit logo_type">
							<span>버거킹</span>
						</h1>
						<div class="title_btn">
							<button type="button" class="btn_head_menu">
								<span>All Menu</span>
							</button>
						</div>
						<div class="title_btn right" style="display: none;">
							<button type="button" class="btn_head_cart">
								<span>카트</span><em class="count" style="display: none;"><span>0</span></em>
							</button>
						</div>
					</div>
				</div>
			</div>

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