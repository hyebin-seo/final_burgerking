<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mypage/mypage_changeInfo.css" type="text/css">
<title>Insert title here</title>
</head>
<jsp:include page="delivery/deliveryHeader.jsp" flush="true"/>
<jsp:include page="delivery/deliveryCart.jsp"/>
<body>

	<div class="contentsBox01">
		<div class="web_container02">
			<div class="subtitWrap m_bg_basic">
				<h2 class="page_tit">회원 정보 변경</h2>
			</div>
			<div class="container01">
				<h3 class="tit01 tit_ico man">
					<span>기본정보</span>
				</h3>
				<div class="container02">
					<div class="dlist01 st03">
						<dl>
							<dt>이메일</dt>
							<dd>
								<span>${memberSession.user_id }</span>
							</dd>
						</dl>
						<dl>
							<dt>이름</dt>
							<dd>
								<span>${memberSession.user_name }</span>
							</dd>
						</dl>
					</div>
					<div>
						<dl class="dlist01 st03">
							<dt class="vtop">핸드폰</dt>
							<dd>
								<div class="vtop m_rbtnWrap">
									<span>
										<span>핸드폰번호</span>
									</span>
									<button type="button" class="btn04 h02 m_rcen_btn">
										<span>변경</span>
									</button>
									<button type="button" class="btn04 h02 m_rcen_btn" style="display:nont;">
										<span>취소</span>
									</button>
								</div>
								<div class="auth_numWrap" style="display:none;">
									<div>
										<input type="text" placeholder="휴대폰 번호를 입력해 주세요">
										<button type="button" disabled="disabled" class="btn04 h02">
											<span>인증번호 발송</span>
										</button>
									</div>
									<div style="display: none;">
										<input type="text" placeholder="인증번호 입력">
										<button type="button" disabled="disabled" class="btn04 h02"
												style="display: none;">
											<span>인증</span>
										</button>
										<button type="button"class="btn04 h02">
											<span>재설정</span>
										</button>
										<em class="time"></em>
									</div>
								</div>
							</dd>
						</dl>
					</div>
				</div>
				<h3 class="tit01 tit_ico key" style="display:none;">
					<span>비밀번호</span>
				</h3>
				<div class="c_btn" style="display: none;">
					<a class="btn02 dark st03 btn01_m">
						<span>비밀번호 변경</span>
					</a>
				</div>
				<h3 class="tit01 tit_ico marketing">
					<span>마케팅 정보 수신동의</span>
				</h3>
				<div class="container02 auth_list">
					<div>
						<label>
							<input type="checkbox" class="check02">
							<span>
								이메일을 통한 이벤트/ 주문 정보의 수신에 동의합니다.
							</span>
						</label>
					</div>
					<div>
						<label>
							<input type="checkbox" class="check02">
							<span>
								SMS를 통한 이벤트/ 주문 정보의 수신에 동의합니다.
							</span>
						</label>
					</div>
				</div>
				<div class="bot_btn_area">
					<div class="c_btn m_item2">
						<a href="#" class="btn01 m">
							<span>취소</span>
						</a>
						<a class="btn01 m red">
							<span>변경</span>
						</a>
					</div>
					<div class="withdrawal">
						<a class="btn_withdrawal">
							<span>회원탈퇴</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<!-- 하단 푸터 -->
<jsp:include page="footer.jsp" />
</html>