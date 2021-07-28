<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
<div class="contentsWrap">
	
	<!-- 페이지 넘어올 때 컨트롤러에서 전달한 데이터들 -->
	<c:set var="couponList" value="${couponList }" />
	<c:set var="menu5" value="${menu5 }" />
	<c:set var="menu10" value="${menu10 }" />
	
	<!-- 1. 까만 영역 -->
	<div class="loc_container">
		<div class="loc">
			<div class="page-navi">
				<a href="delivery_home.do"><span>딜리버리</span></a>
				<a href="mypage_main.do"><span>MY킹</span></a>
				<span>딜리버리쿠폰</span>
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
		<div class="web_container">
			<div class="subtitWrap m_bg_basic">
				<h2 class="page_tit">딜리버리 쿠폰</h2>
				<div class="r_option txt01">
					<strong>
						<em>${couponList.size() }개</em>
					</strong>
					<span>의 쿠폰이 있습니다.</span>
				</div>
			</div>
			
			<div class="container01">
				<c:if test="${empty couponList }">
					<div class="nodata">
						<p>쿠폰목록이 없습니다.</p>
					</div>
				</c:if>
				<c:if test="${!empty couponList }">
					<ul class="coupon_list">
						<c:forEach items="${couponList }" var="coupon">
							<c:if test="${coupon.getCoupon_type() == 'coupon5' }">
								<li class="couponLi">
									<div class="mycoupon">
										<div class="coupon_detail">
											<div class="coupon_img">
												<span>
													<img src="${menu5.getSet_img()}">
												</span>
											</div>
											<div class="coupon_cont">
												<p>${menu5.getSet_name() }</p>
												<p>${coupon.getCoupon_date().substring(0,10) }</p>
											</div>
										</div>
										<div class="coupon_price">
											<p>${menu5.getSet_price() }원</p>
											<p>0원</p>
										</div>
									</div>
								</li>
							</c:if>
							<c:if test="${coupon.getCoupon_type() == 'coupon10' }">
								<li>
									<div>
										<div>
											<span>
												<img src="${menu10.getSet_img()}">
											</span>
										</div>
										<div>
											<p>${menu10.getSet_name() }</p>
											<p>${coupon.getCoupon_date().substring(0,10) }</p>
										</div>
										<div>
											<p>${menu10.getSet_price() }원</p>
											<p>0원</p>
										</div>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
					<div class="c_btn">
						<button type="button" class="btn01 more" style="display:none;">
							<span>더보기</span>
						</button>
					</div>
				</c:if>
			</div>
		</div>	<!-- .web_container -->
	</div>		<!-- .contentsBox01 -->

</div>

</body>
<jsp:include page="footer.jsp" />
</html>