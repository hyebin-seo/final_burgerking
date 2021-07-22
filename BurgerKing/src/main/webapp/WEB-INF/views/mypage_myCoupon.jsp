<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/mypage/mypage_coupon.css"  rel="stylesheet"  type="text/css">

</head>
<jsp:include page="delivery/deliveryHeader.jsp" flush="true"/>
<jsp:include page="delivery/deliveryCart.jsp"/>
<body>

	<div class="contentsBox01">
		<div class="web_container">
			<div class="subtitWrap m_bg_basic">
				<h2 class="page_tit">딜리버리 쿠폰</h2>
				<div class="r_option txt01">
					<strong>
						<em>${list.size() }</em>
					</strong>
					<span>의 쿠폰이 있습니다.</span>
				</div>
			</div>
			<div class="container01">
				<div class="nodata">
					<p>쿠폰목록이 없습니다.</p>
				</div>
				<ul class="coupon_list"></ul>
				<div class="c_btn">
					<button type="button" class="btn01 more" style="display:none;">
						<span>더보기</span>
					</button>
				</div>
			</div>
		</div>	<!-- .web_container -->
	</div>		<!-- .contentsBox01 -->

</body>
<jsp:include page="footer.jsp" />
</html>