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
<link rel="stylesheet" href="resources/css/user/Login2.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="resources/js/login/bk_login.js"></script>




<script type="text/javascript">
	
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
										<a class="btn04" href="move_join.do"><span>회원가입</span></a><a class="btn04"><span>로그인</span></a>
									</div>
								</div>
							</div>
							<div class="util_logoff">
								<p>
									<strong>WHERE TASTE IS KING</strong><br>버거킹과 함께하는 맛있는 세계!
								</p>
								<div class="btn_area">
									<a class="btn04" href="move_join.do"><span>회원가입</span></a><a class="btn04"><span>로그인</span></a>
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
											placeholder="아이디 (이메일)" name="user_id" class="user_id">
											<button type="button" tabindex="-1" class="btn_del01 "
												style="display: none;">
												<span>입력 텍스트 삭제</span>
											</button></label>
									</div>
									<div class="inpbox">
										<label><span class="hide">Password</span><input
											placeholder="비밀번호" type="password" name="user_pwd"
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
										<a class="btn01 m red" onclick="go()"><span class="jun">로그인</span></a> <a
											href="move_join.do" class="btn01 m"><span>회원가입</span></a>
									</div>
									</form>
									<!-- 7/23 form 태그 추가(s에서 안먹힘) -->
									<div class="login_menu">
										<a href="find_id_pwd.do" class=""><span>아이디 찾기</span></a><a
											href="move_pwd.do?sepwd=sepwd" class=""><span>비밀번호 찾기</span></a>
									</div>
								</div>
							</fieldset>
							<div class="simple_login">
								<h3 class="tit01 tit_ico lock">간편 로그인</h3>
								<ul class="list">
									<li class="naver"><a
										href="${url }"><span>네이버
												로그인</span></a></li>
									<li class="kakao"><a
										href="https://kauth.kakao.com/oauth/authorize?client_id=af5dfe1033cca6782a64794f4eb1554c&redirect_uri=http://localhost:8585/burger/oauth&response_type=code"><span>카카오톡
												로그인</span></a></li>
									<li class="apple"><a
										href="https://accounts.google.com/o/oauth2/auth?client_id=105052386417-99g5i64m0bql3kehp3o3ubh8a5moq8e0.apps.googleusercontent.com&response_type=code&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fplus.login&redirect_uri=http%3A%2F%2Flocalhost%3A8585%2Fburger%2Fgooglecallback.do">
										    <span>구글 로그인</span></a></li>
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
								<li class="on"><a href="#tab1">
										<span>비회원 주문</span>
									</a></li>
								<li class=""><a href="#tab2">
										<span>비회원 주문내역</span>
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
						<div class="tab_cont" id="tab2">
							<h3 class="hide">비회원 주문내역</h3>
							<div class="container02">
								<dl>
									<dt>주문번호</dt>
									<dd>
										<div class="inpbox">
											<input type="tel" placeholder="주문번호 입력">
											<button type="button" class="btn_del01 "
												style="display: none;">
												<span>입력 텍스트 삭제</span>
											</button>
										</div>
									</dd>
									<dt>비밀번호</dt>
									<dd>
										<div class="inpbox">
											<input type="password" placeholder="비밀번호">
											<button type="button" class="btn_view01">
												<span>입력 텍스트 보기</span>
											</button>
										</div>
									</dd>
								</dl>
							</div>
							<div class="c_btn">
								<a class="btn01 l"><span>조회하기</span></a>
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
				<div class="footer">
					<div class="web_container">
						<div class="footer_menu">
							<ul>
								<li><a><span>이용약관</span></a></li>
								<li><a><span>개인정보취급방침</span></a></li>
								<li><a><span>법적고지</span></a></li>
							</ul>
							<div class="c_btn">
								<a><span>인재채용</span></a><a><span>가맹점모집</span></a>
							</div>
						</div>
						<div class="copyright">
							<h2 class="logo">
								<img
									src="data:image/gif;base64,R0lGODlhuAAUAOYAAENDQ1tbWy0tLWJiYktLS11dXUBAQEdHR2lpaTExMTg4ODw8PEZGRiwsLFhYWCsrK2hoaGdnZyoqKl5eXj09PTY2NmNjY0FBQTIyMlVVVVpaWjs7O0RERDAwMFdXV1lZWWRkZDU1NS8vL2BgYElJSU5OTi4uLlFRUU1NTTQ0NFZWVkxMTEVFRVBQUFNTU2ZmZl9fX0JCQkpKSjc3Nzo6OlxcXGFhYTMzMzk5OUhISE9PTz8/P1JSUj4+PlRUVGVlZSkpKWpqagAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4zLWMwMTEgNjYuMTQ1NjYxLCAyMDEyLzAyLzA2LTE0OjU2OjI3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo4RDM1MTY5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"
									alt="BKR Logo">
							</h2>
							<p>서울 종로구 삼봉로 71 G 타워 2층 주식회사 비케이알 | 전화주문 1599-0505</p>
							<p>
								<a>사업자 등록번호 101-86-76277</a> | (주)BKR 대표이사 문영주
							</p>
							<p>Copyright 2019 BKR Co., Ltd. All right Reserved</p>
							<div class="sns">
								<a href="https://www.facebook.com/burgerkingkorea"
									target="_blank" class="facebook">페이스북</a><a
									href="https://www.instagram.com/burgerkingkorea"
									target="_blank" class="insta">인스타그램</a>
							</div>
						</div>
					</div>
					<!---->
				</div>
			</div>
			<!---->
		</div>
		<!---->
		<!---->
		<a href="#app" class="btn_top" style="display: none;">Top</a>
	</div>
	
</body>
</html>