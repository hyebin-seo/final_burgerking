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

</head>
<body>
	<div id="app">
		<div class="subWrap02 header_offtype">
			<jsp:include page="../user/loginHeader.jsp"></jsp:include>
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