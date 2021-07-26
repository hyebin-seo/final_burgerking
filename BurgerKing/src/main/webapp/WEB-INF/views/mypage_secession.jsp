<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mypage/mypage_secession.css" type="text/css">
<title>Insert title here</title>
</head>
<jsp:include page="delivery/deliveryHeader.jsp" flush="true"/>
<jsp:include page="delivery/deliveryCart.jsp"/>
<body>

	<div class="contentsBox01">
		<div class="web_container02">
			<div class="subtitWrap m_bg_basic">
				<h2 class="page_tit">회원탈퇴</h2>
			</div>
			<div class="container01">
				<h3 class="tit01 tit_ico noti">
					<span>회원 탈퇴시 유의사항</span>
				</h3>
				<div class="container02">
					<div class="titbox">
						아래 유의사항을 반드시 확인하세요.
					</div>
					<ol class="txtlist01">
						<li>
							<span>
							탈퇴 시 고객님의 정보는 전자상거래 상에서의 소비자 보호 법률에 의거한 버거킹의 개인정보보호정책에 따라 관리됩니다.
							</span>
						</li>
						<li>
							<span>
							탈퇴 시 보유한  쿠폰 정보는 모두 초기화 되며, 재가입 시 복구가 불가합니다.
							</span>
						</li>
						<li>
							<span>
							탈퇴 후 어떠한 방법으로도 기존의 개인정보를 복원할 수 없습니다.(단 결제 내역은 5년까지 보관)
							</span>
						</li>
						<li>
							<span>
							삭제되는 기록은 다음과 같습니다.
							</span>
							<p>- 아이디(이메일), 휴대폰 번호, MY 배달지, MY 매장, 마이 세트, 쿠폰, 주문 이력</p>
						</li>
					</ol>
				</div>
				<h2 class="tit01 tit_ico withdrawal">
					<span>
						탈퇴 사유
					</span>
				</h2>
				<div class="container02">
					<div>
						<select class="st02" id="selectBox">
							<option disabled="disabled" value selected>탈퇴 사유를 선택해주세요.</option>
							<option value="01"> 개인정보보호 </option>
							<option value="02"> 아이디변경 </option>
							<option value="03"> 사이트이용불만 </option>
							<!-- <option value="99"> 직접입력 </option> -->
						</select>
					</div>
					<div class="inpbox textarea_type" style="display:none;">
						<div>
							<textarea rows="5" cols="50" placeholder="탈퇴하시려는 이유에 대해서 입력해 주세요.(최대 1,000자)">
							</textarea>
						</div>
						<div class="page_count">0/1,000자</div>
					</div>
				</div>
				<h2 class="tit01 tit_ico man">
					<span>계정확인</span>
				</h2>
				<div class="container02">
					<div class="dlist01">
						<dl>
							<dt class="WEB">이메일</dt>
							<dd>
								<span>${memberSession.user_id }</span>
							</dd>
						</dl>
						<dl style="display: none;"></dl>
					</div>
				</div>
				<div class="bot_btn_area">
					<p class="txt_chk">
						<label>
							<input type="checkbox" class="check02">
							<span>
								위 내용을 확인하였으며, 버거킹 탈퇴를 합니다.
							</span>
						</label>
					</p>
					<div class="c_btn">
						<button type="button" class="btn01 m" onclick="location.href='change_info.do'">
							<span>취소</span>
						</button>
						<button type="button" class="btn01 m submit" disabled="disabled">
							<span>회원 탈퇴</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script src="resources/js/mypage/mypage_secession.js"></script>
<!-- 하단 푸터 -->
<jsp:include page="footer.jsp" />
</html>