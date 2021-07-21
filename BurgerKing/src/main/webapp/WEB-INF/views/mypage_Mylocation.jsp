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
									<input type="radio" name="chk" value="3445249">
									<span>
										기본배달지
									</span>
								</label>
								<div class="option_cont">
									<div class="my_titWrap">
										<p class="tit">
											<strong>${loc.getLoc_nickname() }</strong>
										</p>
										<div class="btn">
											<button type="button" class="btn04">
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

</body>
<jsp:include page="location/locationPopup.jsp" flush="true"/>
<script src="resources/js/mypage/mypage_myLocation.js"></script>
<jsp:include page="footer.jsp" />

</html>