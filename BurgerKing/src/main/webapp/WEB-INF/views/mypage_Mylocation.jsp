<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="resources/css/mypage/mypage_myLocation.css" type="text/css">

<title>Insert title here</title>
</head>

<jsp:include page="delivery/deliveryHeader.jsp" flush="true"/>
<jsp:include page="delivery/deliveryCart.jsp"/>

<body>

	<c:set var="list" value="${myLocList }" />
	
	<div class="contentsBox01">
		<div class="web_container">
			<div class="subtitWrap m_bg_basic">
				<h2 class="page_tit">MY배달지</h2>
				<p class="r_option st02">
					<strong>
						전체
						<em>${list.size() }</em>
					</strong>
				</p>
			</div>
			<div class="container01">
				<div class="nodata st03" style="display:none;">
					<p>등록된 MY배달지가 없습니다</p>
				</div>
				<ul class="cart_list01 my_list">
				
					<c:forEach items="${list }" var="loc">
						<li>
							<div class="cont">
								<label class="option_chk">
									<!-- <input type="radio" name="chk" value="3445249"> -->
									<c:if test="${loc.getLoc_default() == 'y'}">
									<input type="radio" checked="checked" name="chk" value="${loc.getLoc_no() }">
									</c:if>
									<c:if test="${loc.getLoc_default() == 'n'}">
									<input type="radio" name="chk" value="${loc.getLoc_no() }">
									</c:if>
									<span>
										기본배달지
									</span>
								</label>
								<div class="option_cont">
									<div class="my_titWrap">
										<p class="tit cls${loc.getLoc_no() }">
											<strong>${loc.getLoc_nickname() }</strong>
										</p>
										<div class="btn">
											<button type="button" class="btn04 change_nick" id="change_nick"
													value="${loc.getLoc_nickname() },${loc.getLoc_no() }">
												<span>별칭변경</span>
											</button>
										</div>
									</div>
									<p class="addr">
										<span>${loc.getLoc_addr1() } ${loc.getLoc_nickname() }</span>
									</p>
								</div>
							</div>
							<button type="button" class="btn_del02" value="${loc.getLoc_no() }">
								<span>Delete</span>
							</button>
						</li>
					</c:forEach>
				</ul>
				<div class="info_command_UI">
					<ul class="txtlist01">
						<li>
							평소에 자주 배달받는 주소를 등록하시면 보다 쉽고 빠르게 주문하실 수 있어요.
						</li>
						<li>
							MY배달지는 5개까지 등록 가능합니다.
						</li>
					</ul>
					<div class="c_btn m_mt02">
						<button type="button" class="btn01 red ico add bg_m_dark">
							<span>
								MY배달지 추가
							</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 별칭변경 팝업 -->
	<div class="popWrap02" id="change_nick_pop" style="display: none;">
		<div class="popbox01">
			<div class="popcont">
				<p class="poptxt01">
					<strong>별칭을 지정해보세요.</strong>
				</p>
				<div class="inpbox">
					<input type="text" maxlength="10">
					<button type="button" class="btn_del01 " style>
						<span>입력 텍스트 삭제</span>
					</button>
				</div>
				<div class="page_count">
					<span>2</span> / <span>10</span>
				</div>
			</div>
			<div class="pop_btn c_btn item2">
				<a class="btn02 m_btn01_s dark cancel">
					<span>취소</span>
				</a>
				<a class="btn02 m_btn01_s red changeOk">
					<span>등록</span>
				</a>
			</div>
		</div>
	</div>

</body>
<jsp:include page="location/locationPopup.jsp" flush="true"/>
<script src="resources/js/mypage/mypage_myLocation.js"></script>
<jsp:include page="footer.jsp" />

</html>