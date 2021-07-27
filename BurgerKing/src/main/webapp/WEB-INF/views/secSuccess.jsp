<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mypage/secSuccess.css" type="text/css">
<title>Insert title here</title>
</head>
<jsp:include page="delivery/deliveryHeader.jsp" flush="true"/>
<body>
	
	<div class="contentsWrap">
		<div class="locationWrap WEB">
			<div class="web_container">
				<div class="page_navi">
					<a href="delivery_home.do" class><span>딜리버리</span></a>
					<a href="mypage_main.do" class><span>MY킹</span></a>
					<span>회원탈퇴</span>
				</div>
			</div>
		</div>
		
		<div class="contentsBox01 withdrawal_complete">
			<div class="web_container">
				<div class="MOB titleBar">
					<div class="title_btn">
						<button type="button" class="btn_head_close">
							<span>Close</span>
						</button>
					</div>
				</div>
				<h2 class="logo"></h2>
				<div class="cont">
					<p class="tit"><strong>회원탈퇴가 완료되었습니다.</strong></p>
					<p>앞으로 보다 나은 모습으로 다시 만나 뵐 수 있도록 노력하겠습니다.<br>그동안 이용해 주셔서 감사합니다.</p>
				</div>
				<div class="c_btn m_item2">
					<a href="/burger/" class="btn01">
						<span>버거킹 홈으로</span>
					</a>
				</div>
			</div>
		</div>
	</div>

</body>
<!-- 하단 푸터 -->
<jsp:include page="footer.jsp" />
</html>