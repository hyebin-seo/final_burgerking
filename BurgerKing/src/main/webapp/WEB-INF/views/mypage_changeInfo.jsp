<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mypage/mypage_changeInfo.css" type="text/css">
<title>회원정보변경</title>
</head>
<jsp:include page="delivery/deliveryHeader.jsp" flush="true"/>
<jsp:include page="delivery/deliveryCart.jsp"/>
<body>

<div class="contentsWrap">

	<!-- 1. 까만 영역 -->
	<div class="loc_container">
		<div class="loc">
			<div class="page-navi">
				<a href="delivery_home.do"><span>딜리버리</span></a>
				<a href="mypage_main.do"><span>MY킹</span></a>
				<a><span>회원 정보 변경</span></a>
			</div>
			
			<div class="location">
				<span class="addr">
				   <c:if test="${empty addrSession }">
					<span>배달지를 선택하세요</span>
				   </c:if>
				   <c:if test="${!empty addrSession }">
					<span>${delivery_addr }</span>
				   </c:if>
				</span>
				<span class="shop">
				   <c:if test="${empty addrSession }">
					<span>지점</span>
				   </c:if>
				   <c:if test="${!empty addrSession }">
					<span>${addrSession.store_name }</span>
				   </c:if>
				</span>
				<span class="btn">
					<a href="javascript:locationModify();">
						<span>변경</span>
					</a>
				</span>
			</div>
		</div>
	</div>
		
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
										<span class="phoneNo">${memberSession.user_phone }</span>
									</span>
									<button type="button" class="btn04 h02 m_rcen_btn change">
										<span>변경</span>
									</button>
									<button type="button" class="btn04 h02 m_rcen_btn cancel" style="display:none;">
										<span>취소</span>
									</button>
								</div>
								<div class="auth_numWrap" style="display:none;">
									<div>
										<input type="text" placeholder="휴대폰 번호를 입력해 주세요">
										<button type="button" disabled="disabled" class="btn04 h02 sendSMS">
											<span>인증번호 발송</span>
										</button>
									</div>
									<div style="display: none;">
										<input type="text" placeholder="인증번호 입력">
										<button type="button" disabled="disabled" class="btn04 h02 certify"
												style="display: none;">
											<span>인증</span>
										</button>
										<!-- <button type="button"class="btn04 h02 reset">
											<span>재설정</span>
										</button> -->
										<!-- 3분 시간제한 -->
										<!-- <em class="time"></em> -->
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
				<!-- <h3 class="tit01 tit_ico marketing">
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
				</div> -->
				<div class="bot_btn_area">
					<div class="c_btn m_item2">
						<a href="mypage_main.do" class="btn01 m">
							<span>취소</span>
						</a>
						<a class="btn01 m red submit">
							<span>변경</span>
						</a>
					</div>
					<div class="withdrawal">
						<a class="btn_withdrawal" href="secession.do">
							<span>회원탈퇴</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>

</body>
<script src="resources/js/mypage/mypage_changeInfo.js"></script>
<!-- 하단 푸터 -->
<jsp:include page="footer.jsp" />
</html>