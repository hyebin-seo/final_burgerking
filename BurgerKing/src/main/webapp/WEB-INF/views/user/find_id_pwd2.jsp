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
<link rel="stylesheet" href="resources/css/user/find_id_pwd.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

    var type = "<c:out value='${sepwd}' />";
	
	
	
	
	
	$(document).ready(function (){
		
		$("ul.item2 li").click(function() {

			$("ul.item2 li").removeClass("on"); //Remove any "active" class
			$(this).addClass("on"); //Add "active" class to selected tab
			$("div.tab_cont").hide(); //Hide all tab content

			var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
			
			
			$(activeTab).fadeIn(); //Fade in the active ID content
			
			
			return false;
		});
		
		
		 
		 if(type == "sepwd"){

				$("ul.item2 li").eq(0).removeClass("on"); //Remove any "active" class
				$("ul.item2 li").eq(1).addClass("on");

				$("div.tab_cont").hide(); //Hide all tab content

				var activeTab = $("ul.item2 li").eq(1).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
				
				
				$(activeTab).fadeIn(); //Fade in the active ID content

				
			}
		
	})
	
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
								style="display: none;"><span>MY킹</span></a><a href="Login.do"><span>로그인</span></a><a><span>고객센터</span></a>
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
										<a class="btn04" href="move_join.do"><span>회원가입</span></a><a class="btn04" href="Login.do"><span>로그인</span></a>
									</div>
								</div>
							</div>
							<div class="util_logoff">
								<p>
									<strong>WHERE TASTE IS KING</strong><br>버거킹과 함께하는 맛있는 세계!
								</p>
								<div class="btn_area">
									<a class="btn04" href="move_join.do"><span>회원가입</span></a><a class="btn04" href="Login.do"><span>로그인</span></a>
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
			<div class="contentsWrap">
				<div class="WEB locationWrap">
					<div class="web_container">
						<div class="page_navi">
							<a href="#/deliveryHome" class=""><span>딜리버리</span></a><a
								href="Login.do" class=""><span>로그인</span></a><a><span>아이디/비밀번호
									찾기</span></a>
						</div>
					</div>
				</div>

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
						<form action="find_id.do" method="post">
						<input type="hidden" value="seid" name="seid">
							<div class="tab_cont" id="tab1">
								<h3 class="hide">아이디 찾기</h3>
								<p class="MOB txt03">
									가입시 회원정보로 등록한 <br>이름과 휴대폰 번호를 입력해 주세요.
								</p>
								<div class="container02">
									<div class="WEB titbox">
										<p>가입시 회원정보로 등록한 이름과 휴대폰 번호를 입력해 주세요.</p>
									</div>
									<div class="dlist01">
										<dl>
											<dt class="WEB vtop">이름</dt>
											<dd>
												<div class="inpbox">
													<label><input type="text" placeholder="이름"
														class="st02 user_name" name="user_name"
														required="required">
														<button type="button" class="btn_del01"
															style="display: none;">
															<span>입력 텍스트 삭제</span>
														</button></label>
													<p class="txt">이름을 입력해 주세요.</p>
												</div>
											</dd>
										</dl>
										<dl>
											<dt class="WEB vtop">휴대폰 번호</dt>
											<dd>
												<div class="inpbox">
													<label><input type="tel" placeholder="휴대폰 번호"
														class="st02 user_phone" name="user_phone"
														required="required">
														<button type="button" class="btn_del01 "
															style="display: none;">
															<span>입력 텍스트 삭제</span>
														</button></label>
													<p class="txt phone">휴대폰 번호를 입력해 주세요.</p>
													<p class="txt check_phone" style="display: none;">휴대폰 번호를 모두 입력해
														주세요.</p>
												</div>
											</dd>
										</dl>
									</div>
									<ul class="WEB txtlist01">
										<li>가입 시 입력한 이름과 휴대폰번호로 아이디 정보를 찾을 수 있습니다.</li>
										<li>네이버, 카카오톡, 삼성 앱카드, 애플아이디로 가입하신 회원님께서는 해당 서비스에서
											아이디/비밀번호 찾기를 진행해 주세요.</li>
									</ul>
								</div>
								<div class="c_btn">
									<div>
										<button class="btn01 l">
											<span>아이디 찾기</span>
										</button>
									</div>
								</div>
								<ul class="MOB txtlist01">
									<li>가입 시 입력한 이름과 휴대폰번호로 아이디 정보를 찾을 수 있습니다.</li>
									<li>네이버, 카카오톡, 삼성 앱카드, 애플아이디로 가입하신 회원님께서는 해당 서비스에서
										아이디/비밀번호 찾기를 진행해 주세요.</li>
								</ul>
							</div>
						</form>
						<form action="find_pwd.do" method="post">
						<input type="hidden" value="sepwd" name="sepwd">
							<div class="tab_cont" id="tab2">
								<h3 class="hide">비밀번호 찾기</h3>
								<p class="MOB txt03">
									회원님의 정보(이메일)로 <br>비밀번호 재설정을 위한 경로를 보내 드립니다.
								</p>
								<div class="container02">
									<div class="WEB titbox">
										<p>회원님의 정보(이메일)로 비밀번호 재설정을 위한 경로를 보내 드립니다.</p>
									</div>
									<div class="dlist01">
										<dl>
											<dt class="WEB vtop">이름</dt>
											<dd>
												<div class="inpbox">
													<label><input type="text" placeholder="이름"
														name="user_name" class="st02 pwd_name">
														<button type="button" class="btn_del01"
															style="display: none;">
															<span>입력 텍스트 삭제</span>
														</button></label>
													<p class="txt pwd">이름을 입력해 주세요.</p>
												</div>
											</dd>
										</dl>
										<dl>
											<dt class="WEB vtop">이메일 주소</dt>
											<dd>
												<div class="inpbox">
													<label><input type="text" placeholder="이메일 주소"
														name="user_id" class="st02 pwd_email">
														<button type="button" class="btn_del01 "
															style="display: none;">
															<span>입력 텍스트 삭제</span>
														</button></label>
													<p class="txt email">이메일 주소를 입력해 주세요.</p>
													<p class="txt email_check" style="display: none;">정확한 이메일 주소를 입력해
														주세요.</p>
												</div>
											</dd>
										</dl>
									</div>
									<ul class="WEB txtlist01">
										<li>가입시 입력한 이메일로 비밀번호 재설정을 위한 경로가 발송 됩니다.</li>
										<li>네이버, 카카오톡, 삼성 앱카드, 애플아이디로 가입하신 회원님께서는 해당 서비스에서
											아이디/비밀번호 찾기를 진행해 주세요.</li>
									</ul>
								</div>
								<div class="c_btn">
									<div>
										<button class="btn01 l font_s01">
											<span>비밀번호 찾기</span>
										</button>
									</div>
								</div>
							</div>
						</form>
						<ul class="MOB txtlist01">
							<li>비밀번호 찾기 시 이메일로 비밀번호 재설정을 위한 경로가 발송 됩니다.</li>
							<li>네이버, 카카오톡, 삼성 앱카드, 애플아이디로 가입하신 회원님께서는 해당 서비스에서 아이디/비밀번호
								찾기를 진행해 주세요.</li>
						</ul>
					</div>

				</div>
			</div>
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
					<a href="https://www.facebook.com/burgerkingkorea" target="_blank"
						class="facebook">페이스북</a><a
						href="https://www.instagram.com/burgerkingkorea" target="_blank"
						class="insta">인스타그램</a>
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

	<script type="text/javascript" src="resources/js/login/find_id_pwd2.js"></script>
</body>
</html>