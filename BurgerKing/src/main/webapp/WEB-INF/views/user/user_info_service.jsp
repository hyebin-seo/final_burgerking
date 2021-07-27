<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="resources/css/user/user_info.css">
<script type="text/javascript"
	src="resources/js/login/user_info_service.js">
	
</script>
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
								href="Login.do" class=""><span>로그인</span></a><a href="move_join.do"><span>회원가입</span></a><a><span>약관동의
									및 본인인증</span></a>
						</div>
					</div>
				</div>
				<div class="contentsBox01">
					<div class="web_container">
						<div class="subtitWrap m_bg_basic">
							<h2 class="page_tit">회원가입</h2>
						</div>
						<!-- <form action="join.do" id="joinForm"> -->
						<div class="container01">
							<h3 class="tit01 tit_ico noti">
								<span>이용약관</span>
							</h3>
							<div class="container02 auth_list">
								<div class="titbox">
									<p>회원가입 약관 동의 및 본인인증을 진행합니다.</p>
								</div>
								<div>
									<label><input type="checkbox" class="check02" id="chk1"
										value="1" name="chk"><span>버거킹 이용약관(필수)</span></label>
									<button type="button">
										<span class="pop1">상세보기</span>
									</button>
								</div>
								<div>
									<label><input type="checkbox" class="check02" id="kch2"
										value="2" name="chk"><span>개인정보처리방침(필수)</span></label>
									<button type="button">
										<span class="pop2">상세보기</span>
									</button>
								</div>
								<div>
									<label><input type="checkbox" class="check02" value="3"
										name="chk"><span>E-mail 광고성 정보 동의(선택)</span></label>
								</div>
								<div class="st02">
									<label><input type="checkbox" class="check02" value="4"
										name="chk"><span>SMS 광고성 정보 동의(선택)</span></label><span
										class="info">다양한 이벤트와 주문 정보를 보내 드립니다.</span>
								</div>
								<div class="divide">
									<label><input type="checkbox" class="check02"
										id="chkAll"><span>약관 전체 동의</span></label>
								</div>
							</div>
							<h3 class="MOB tit01 tit_ico man">
								<span>본인인증</span>
							</h3>
							<div class="container02 auth_list">
								<div class="titbox">
									<p style="font-family: 'S-CoreDream-9Black';	">약관 동의 후 메일인증을 진행해 주세요.</p>
								</div>
								<ul class="txtlist01">
									<li>반드시 회원님의 본인명의로 된 메일로 인증을 진행해 주세요.</li>
									<li>타인의 개인정보를 도용하여 가입 후 적발 시 서비스 이용에 제한을 받으며, 법적 제재를 받을 수
										있습니다.</li>
								</ul>
							</div>
							<div class="c_btn">
								<a class="btn01 auth"><button>
										<span style="color: white;  font-family: 'S-CoreDream-9Black';">메일 인증하기</span>
									</button></a>
							</div>
						</div>
						<!-- </form> -->
					</div>
				</div>
				<jsp:include page="pop1.jsp" />
				<jsp:include page="pop2.jsp" />
				<jsp:include page="pop3.jsp" />
			</div>
			<jsp:include page="../footer.jsp" />
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