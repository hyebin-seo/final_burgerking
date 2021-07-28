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

	$(document).ready(function() {

		$("ul.item2 li").click(function() {

			$("ul.item2 li").removeClass("on"); //Remove any "active" class
			$(this).addClass("on"); //Add "active" class to selected tab
			$("div.tab_cont").hide(); //Hide all tab content

			var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content

			$(activeTab).fadeIn(); //Fade in the active ID content

			return false;
		});

		if (type == "sepwd") {

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
			<jsp:include page="../user/loginHeader.jsp"></jsp:include>
			<!-- 추가 -->
			
			<!-- 추가 끝  -->
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
													<p class="txt check_phone" style="display: none;">휴대폰
														번호를 모두 입력해 주세요.</p>
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
													<p class="txt email_check" style="display: none;">정확한
														이메일 주소를 입력해 주세요.</p>
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

	<script type="text/javascript" src="resources/js/login/find_id_pwd2.js"></script>
</body>
</html>