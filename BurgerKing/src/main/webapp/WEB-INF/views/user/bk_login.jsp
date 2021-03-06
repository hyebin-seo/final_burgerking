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
<link rel="icon" href="resources/img/public/favicon.ico">

<!-- 눈 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- Lgoin.css 연결 -->
<link rel="stylesheet" href="resources/css/user/Login2.css">



	<script type="text/javascript" src="resources/js/login/bk_login.js"></script>
	
	
	
	
	<script type="text/javascript">
	var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;	
	
	$(document).ready(function () {
		
		if(!isMobile) {
			$(".GNBWrap ul").mouseover(function(){
				$(".head_menuWr	ap").addClass("GNB_open");
			});
			
			$(".GNBWrap ul").mouseleave(function(){
				$(".head_menuWrap").removeClass("GNB_open");
			});
		}
		
		
		$(".btn_head_menu").click(function() {
			
			$(".headerWrap").addClass("side_open");
			$('div.MOB.m_utliWrap').css('display','block');
		});
		
		$(".btn_head_close").click(function() {
			$(".headerWrap").removeClass("side_open");
		});
		
		$(".GNBWrap li").click(function() {
			$(this).toggleClass("menu_open");
		});
		
		
	});
		
		
	function go_brand(){
		location.href='/burger/';
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
							<a href="/burger/"><span>브랜드홈</span></a><a style="display: none;"><span>로그아웃</span></a><a
								style="display: none;"><span>MY킹</span></a><a><span>로그인</span></a><a><span>고객센터</span></a>
						</div>
						<div class="MOB m_utilWrap">
							<div class="m_top">
								<button class="btn_head_close">
									<span>Menu Close</span>
								</button>
								<button class="btn_brandhome" onclick="go_brand()">
									<span>브랜드 홈</span>
								</button>
							</div>
							<div class="util_logon">
								<div class="user">
									<p>
										<strong><span> 고객</span>(비회원)</strong> 님
									</p>
									<div class="btn_area">
										<a class="btn04" href="move_join.do"><span>회원가입</span></a><a
											class="btn04"><span>로그인</span></a>
									</div>
								</div>
							</div>
							<div class="util_logoff">
								<p>
									<strong>WHERE TASTE IS KING</strong><br>버거킹과 함께하는 맛있는 세계!
								</p>
								<div class="btn_area">
									<a class="btn04" href="move_join.do"><span>회원가입</span></a><a
										class="btn04"><span>로그인</span></a>
								</div>
							</div>
						</div>
						<div class="WEB on_cont join">
							<a class="btn_join" href="move_join.do"><strong>회원가입</strong></a>
						</div>
						<div class="WEB off_cont join">
							<a class="btn_join" href="move_join.do"><strong>회원가입</strong></a>
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
			<div class="WEB on_cont head_personalWrap">
				<div class="web_container">
					<div class="personal_logoff" style="display: none;">
						<p>WHERE TASTE IS KING! 버거킹과 함께하는 맛있는 세계!</p>
						<a><strong>회원가입하고 혜택받기</strong></a>
						<div class="btn_area">
							<a><strong>로그인</strong></a><a><strong>비회원 주문내역</strong></a>
						</div>
					</div>
					<div class="personal_logon " style="display: none;">
						<a>
							<div class="personal_order">
								<dl>
									<dt>
										<strong>딜리버리 주문내역</strong>
									</dt>
									<dd>주문내역이 없습니다.</dd>
								</dl>
							</div>
						</a><a>
							<div class="personal_cart">
								<dl>
									<dt>
										<strong>카트</strong><em class="count" style="display: none;"><span>0</span></em>
									</dt>
									<dd>카트에 담은 상품이 없습니다</dd>
								</dl>
							</div>
						</a>
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
				<div class="WEB locationWrap">
					<div class="web_container">
						<div class="page_navi">
							<a href="/burger/" class=""><span>HOME</span></a><a><span>로그인</span></a>
						</div>
					</div>
				</div>
				<div class="contentsBox01 loginWrap">
					<div class="web_container">
						<h2 class="page_tit02 bg_w">
							<em>WHERE TASTE IS KING</em><span>어서오세요! 버거킹입니다.</span>
						</h2>
						<div class="weblogin_ui">
							<fieldset class="login">
								<legend>로그인</legend>
								<h3 class="tit01 tit_ico key02">일반 로그인</h3>
								<div class="cont">
									<!-- 7/23 form 태그 추가(s에서 안먹힘) -->
									<form action="login_Ok.do" name="form" method="post">
										<div class="inpbox">
											<label><span class="hide">ID</span><input type="text"
												placeholder="아이디 (이메일)" name="user_id" class="user_id" autocomplete="off">
												<button type="button" tabindex="-1" class="btn_del01 "
													style="display: none;">
													<span>입력 텍스트 삭제</span>
												</button></label>
										</div>
										<div class="inpbox">
											<label><span class="hide">Password</span><input
												placeholder="비밀번호" type="password" name="user_pwd" autocomplete="off"
												class="user_pwd">
												<button type="button" tabindex="-1" class="btn_view01">
													<span>입력 텍스트 보기</span>
												</button></label>
										</div>

										<div class="login_option">
											<label class="checkbox"><input type="checkbox"><span>아이디
													저장</span></label><label class="checkbox"><input type="checkbox"><span>자동
													로그인</span></label>
										</div>
										<div class="c_btn item2">
											<a class="btn01 m red" onclick="go()"><span class="jun">로그인</span></a>
											<a href="move_join.do" class="btn01 m"><span>회원가입</span></a>
										</div>
									</form>
									<!-- 7/23 form 태그 추가(s에서 안먹힘) -->
									<div class="login_menu">
										<a href="find_id_pwd.do" class=""><span>아이디 찾기</span></a><a
											href="move_pwd.do?sepwd=sepwd" class=""><span>비밀번호
												찾기</span></a>
									</div>
								</div>
							</fieldset>
							<div class="simple_login">
								<h3 class="tit01 tit_ico lock">간편 로그인</h3>
								<ul class="list">
									<li class="naver"><a href="${url }"><span>네이버
												로그인</span></a></li>
									<li class="kakao"><a
										href="https://kauth.kakao.com/oauth/authorize?client_id=af5dfe1033cca6782a64794f4eb1554c&redirect_uri=http://localhost:8585/burger/oauth&response_type=code"><span>카카오톡
												로그인</span></a></li>
									<li class="apple"><a
										href="https://accounts.google.com/o/oauth2/auth?client_id=105052386417-99g5i64m0bql3kehp3o3ubh8a5moq8e0.apps.googleusercontent.com&response_type=code&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fplus.login&redirect_uri=http%3A%2F%2Flocalhost%3A8585%2Fburger%2Fgooglecallback.do">
											<span>구글 로그인</span>
									</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!---->
				</div>
				<div class="contentsBox01 nonmember_order">
					<div class="web_container container01">
						<div class="tab01">
							<ul class="item2">
								<li class="on"><a href="#tab1"> <span>비회원 주문</span>
								</a></li>
								<li class=""><a href="#tab2"> <span>비회원 주문내역</span>
								</a></li>
							</ul>
						</div>
						<div class="tab_cont" id="tab1">
							<h3 class="hide">비회원 주문</h3>
							<div class="container02 order">
								<p>회원가입 없이 비회원으로 주문이 가능합니다.</p>
							</div>
							<div class="c_btn">
								<a href="guestLogin.do" class="btn01 l"><span>비회원 주문</span></a>
							</div>
						</div>
						<jsp:include page="pop4.jsp" />
						<div class="tab_cont" id="tab2">
							<h3 class="hide">비회원 주문내역</h3>
							<div class="container02">
								<dl>
									<dt>주문번호</dt>
									<dd>
										<div class="inpbox">
											<input type="tel" placeholder="주문번호 입력" class="order_no">
											<button type="button" class="btn_del01 "
												style="display: none;">
												<span>입력 텍스트 삭제</span>
											</button>
										</div>
									</dd>
									<dt>비밀번호</dt>
									<dd>
										<div class="inpbox">
											<input type="password" placeholder="비밀번호" class="order_pwd">
											<button type="button" class="btn_view01">
												<span>입력 텍스트 보기</span>
											</button>
										</div>
									</dd>
								</dl>
							</div>
							<div class="c_btn">
								<a class="btn01 l inquiry"><span>조회하기</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="footerWrap">
				<div class="WEB sitemap web_max">
					<div class="web_container">
						<ul class="menu">
							<li><a><span>메뉴</span></a>
								<ul class="submenu"></ul></li>
							<li><a><span>매장</span></a>
								<ul class="submenu">
									<li><a><span>매장찾기</span></a></li>
								</ul></li>
							<li><a><span>이벤트</span></a>
								<ul class="submenu">
									<li><a><span>이벤트</span></a></li>
								</ul></li>
							<li><a><span>브랜드 스토리</span></a>
								<ul class="submenu">
									<li><a><span>버거킹 스토리</span></a></li>
									<li><a><span>WHY 버거킹</span></a></li>
									<li><a><span>버거킹 News</span></a></li>
								</ul></li>
							<li><a><span>고객센터</span></a>
								<ul class="submenu">
									<li><a><span>공지사항</span></a></li>
									<li><a><span>버거킹앱이용안내</span></a></li>
									<li><a><span>FAQ</span></a></li>
									<li><a><span>문의</span></a></li>
									<li><a><span>가맹점모집</span></a></li>
									<li><a><span>인재채용</span></a></li>
								</ul></li>
						</ul>
					</div>
				</div>
				<jsp:include page="../footer.jsp"></jsp:include>
			</div>
			<!---->
		</div>
		<!---->
		<!---->
		<a href="#app" class="btn_top" style="display: none;">Top</a>
	</div>

</body>
</html>