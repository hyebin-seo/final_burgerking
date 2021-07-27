<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
<title>버거킹</title>

<!-- 파비콘 -->
<link rel="shortcut icon" type="image/x-icon"
	href="resources/img/main/fab.ico">

<!-- Lgoin.css 연결 -->
<link rel="stylesheet" href="resources/css/user/join.css">



<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

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
								style="display: none;"><span>MY킹</span></a><a href="Login.do"><span>로그인</span></a><a><span>고객센터</span></a>
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
							<a class="btn_join"  href="move_join.do"><strong>회원가입</strong></a>
						</div>
						<div class="WEB off_cont join">
							<a class="btn_join"  href="move_join.do"><strong>회원가입</strong></a>
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
							<a href="Login.do"><strong>로그인</strong></a><a><strong>비회원 주문내역</strong></a>
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
			<!-- 추가 끝  -->
			<div class="contentsWrap">
				<div class="WEB locationWrap">
					<div class="web_container">
						<div class="page_navi">
							<a href="#/deliveryHome" class=""><span>딜리버리</span></a><a
								href="Login.do" class=""><span>로그인</span></a><a  href="move_join.do"><span>회원가입
							</span></a>
						</div>
					</div>
				</div>
				<div class="contentsBox01 loginWrap joinWrap">
					<div class="web_container">
						<div class="MOB subtitWrap">
							<h2 class="page_tit">버거킹 회원가입</h2>
						</div>
						<div class="welcomeBox bg_w">
							<h3 class="page_tit02">환영합니다!</h3>
							<div class="txt_welcome">
								<p>
									<span class="br"><strong>이메일 주소</strong> 혹은 <strong>SNS
											계정</strong>으로</span> 간편하게 <strong><em>회원가입</em></strong> 하세요!
								</p>
								<p class="info">버거킹 서비스는 만 14세 이상부터 이용 하실 수 있습니다.</p>
							</div>
						</div>
						<div class="weblogin_ui">
							<div class="login bg_w">
								<h3 class="tit01 tit_ico key02">이메일 회원가입</h3>
								<div class="c_btn">
									<a class="btn02 st03" href="join_info_service.do"><span>버거킹
											회원가입</span></a>
								</div>
							</div>
							<div class="simple_login">
								<h3 class="tit01 tit_ico lock">간편 회원가입</h3>
								<ul class="list">
									<li class="naver"><a><span>네이버</span></a></li>
									<li class="kakao"><a><span>카카오톡</span></a></li>
									<li class="apple"><a><span>애플 로그인</span></a></li>
								</ul>
							</div>
						</div>
					</div>
					<!---->
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