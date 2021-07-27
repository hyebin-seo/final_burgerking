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
<link rel="stylesheet" href="resources/css/user/guest_login.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>



<script type="text/javascript" src="resources/js/login/guest_login.js">

</script>
<script type="text/javascript">

$(document).ready(function () {
	
	
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
			<div class="contentsWrap">
				<div class="WEB locationWrap">
					<div class="web_container">
						<div class="page_navi">
							<a href="#/deliveryHome" class=""><span>딜리버리</span></a><a
								href="Login.do" class=""><span>로그인</span></a><a><span>비회원
									주문</span></a>
						</div>
					</div>
				</div>
				<div class="contentsBox01">
				<form action="guest_order.do" method="post" name="guest">
					<div class="web_container02 container01">
						<h2 class="tit02 WEB">비회원 주문</h2>
						<h2 class="tit01 tit_ico man">
							<span>개인정보 수집</span>
						</h2>
						<div class="accWrap01">
							<div class="container02 auth_list acc_list toggle">
								<div class="acc_tit ">
									<label><input type="checkbox" class="check02 auth"><span>버거킹
											이용약관</span></label>
									<button type="button" class="btn_acc">
										<span>상세보기</span>
									</button>
								</div>
								<div class="acc_cont">
									<p>
										<strong>수집하는 개인정보 항목</strong><br> - 전화번호, 성명, 주소
									</p>
									<br>
									<p>
										<strong>수집 목적 </strong><br> ① 성명, 주소: 제품의 전달, 청구서, 정확한 제품
										배송지의 확보.
									</p>
									<br>
									<p>
										<strong>개인정보 보유기간 </strong><br> ① 계약 또는 청약철회 등에 관한 기록 :
										6개월<br> ② 대금결제 및 재화 등의 공급에 관한 기록 : 1년<br> ③ 소비자의 불만
										또는 분쟁처리에 관한 기록 : 1년
									</p>
									<br>
									<p>
										<strong>비회원 주문 시 제공하신 모든 정보는 상기 목적에 필요한 용도 이외로는 사용되지
											않습니다. 기타 자세한 사항은 '개인정보처리방침'을 참고하여주시기 바랍니다.</strong>
									</p>
								</div>
							</div>
						</div>
						<h2 class="tit01 tit_ico setting">
							<span>비회원 설정</span>
						</h2>
						<div class="container02">
						 
							<div class="dlist01">
								<dl>
									<dt class="WEB">이름</dt>
									<dd>
										<div class="inpbox st02">
											<input type="text" placeholder="받는 분의 이름을 입력해 주세요."
												class="st02 name" name="user_name">
											<button type="button" class="btn_del01 "
												style="display: none;">
												<span>입력 텍스트 삭제</span>
											</button>
										</div>
									</dd>
								</dl>
								<dl class="WEB phone">
									<dt>휴대폰 번호</dt>
									<dd>
										<div class="inpbox st02">
											<input type="text" placeholder="핸드폰 번호를 입력해 주세요"
												class="st02 phone" name="user_phone">
										</div>
									</dd>
								</dl>
								<dl class="WEB auth" id="authNumber">
									<dt class="WEB auth">인증번호</dt>
									<dd>
										<div class="inpbox st02">
											<input type="text" placeholder="인증번호를 입력하세요."
												class="st02 auth"><em class="time"></em>
												<em class="tag st02"><span>인증완료</span></em>
										</div>
									</dd>
								</dl>
							</div>
							
						</div>
						<div class="c_btn">
							<div class="move">
								<button type="button" class="btn01 l m_btn01 move">
									<span>인증번호 발송</span>
								</button>
							</div>

							<div style="display: none;" class="check">
								<button type="button" class="btn01 l m_btn01 check">
									<span>인증번호 확인</span>
								</button>
							</div>
							<div style="display: none;" class="rerrange">
								<button type="button" class="btn01 l m_btn01 rerrange">
									<span>재설정</span>
								</button>
							</div>
						</div>
						<h2 class="tit01 tit_ico key">
							<span>주문서 비밀번호</span>
						</h2>
						<div class="container02">
							<div class="WEB titbox">
								<p>주문 내역 확인을 위한 비밀번호를 입력하세요.</p>
							</div>
							<div class="dlist01">
								<dl>
									<dt class="WEB vtop">비밀번호</dt>
									<dd>
										<div class="inpbox">
											<input placeholder="4~6자리 이내의 숫자로만 입력하세요." maxlength="6"
												type="password" class="st02 pwd" name="user_pwd">
											<button type="button" tabindex="-1" class="btn_view01">
												<span>입력 텍스트 보기</span>
											</button>
										</div>
										<div class="inpbox">
											<input placeholder="비밀번호를 다시 입력하세요." maxlength="6"
												type="password" class="st02 pwd_check">
											<button type="button" tabindex="-1" class="btn_view01">
												<span>입력 텍스트 보기</span>
											</button>
										</div>
									</dd>
								</dl>
							</div>
						</div>
						<p class="MOB txt04">주문 내역 확인을 위한 비밀번호를 입력하세요.</p>
						<div class="c_btn">
							<div>
								<button type="button" class="btn01 l m_btn01 guest_order" onclick="go()">
									<span>비회원 주문</span>
								</button>
							</div>
						</div>
					</div>
					<input type="hidden" value="guest" name="right">
					</form>
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