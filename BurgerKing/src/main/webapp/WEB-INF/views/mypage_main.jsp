<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="resources/css/mypage/mypage_main.css" type="text/css">

<title>마이킹</title>
</head>

<jsp:include page="deliveryHeader.jsp" flush="true"/>
<jsp:include page="deliveryCart.jsp"/>

<body>
	
	<!-- 내용 영역 -->
	<div class="contentsWrap">
		<!-- 1. 까만 영역 위쪽에 include 해옴. -->
		<!-- <div class="locationWrap">
			<div class="web_container">
				<div class="page_navi">
					<a href="#" class><span>딜리버리</span></a>
					<a><span>MY킹</span></a>
				</div>
	
				<div class="location">
					<span class="addr">
						<span>선택한 배달지 주소</span>
					</span>
					<span class="shop" style>
						<span>매장명</span>
					</span>
					<span class="money" style>
						최소주문금액 : 
						<span>12,000원</span>
						/
						<span>배달팁 : 0원</span>
					</span>
					<span class="no" style="display: none;"></span>
					<span class="btn">
						<a href="mypage_searchAddr.do">
							<span>변경</span>
						</a>
					</span>
				</div>
			</div>		.web_container end 
		</div>		 .locationWrap end(까만영역) -->
		
		<!-- 2. 하얀영역 -->
		<div class="contentsBox01 bg_w">
			<div class="web_container">
				<div class="subtitWrap">
					<h2 class="page_tit st02">MY킹</h2>
				</div>
	
				<div class="myking_info">
					<div class="member_info">
						<p class="user">
							<strong>user 님!</strong>
							<span>반갑습니다</span>
						</p>
						<a>
							<span>정보변경</span>
						</a>
					</div>
		
					<div class="coupon_info">
						<dl class="info_coupon">
							<dt>나의 쿠폰</dt>
							<dd>
								<strong>0장</strong>
								<a href="#" class="btn_detail">
									<span>details</span>
								</a>
							</dd>
						</dl>
						
						<dl class="info_stamp">
							<dt>나의 스탬프</dt>
							<dd>
								<strong>0개</strong>
								<a href="#" class="btn_detail">
									<span>details</span>
								</a>
							</dd>
						</dl>
					</div>
				</div>			<!-- .myking_info end -->
			</div>				<!-- .web_container end -->
		</div>					<!-- .contentsBox01 bg_w end -->
		
		<!-- 3. 베이지색 영역 -->
		<div class="contentsBox01">
			<div class="web_container container01">
				<h3 class="tit01 tit_ico list" style="display: none;">
					<span>최근 주문내역</span>
				</h3>
				<div class="container02 pd02 order_list_sum" style="display: none;">
					<div class="titbox">
						<p class="tit">
							<strong></strong>
							<em class="tag">
								<span></span>
							</em>
						</p>
					</div>
					<div class="cont">
						<div class="info">
							<dl>
								<dt>주문번호</dt>
								<dd>
									<strong></strong>
								</dd>
							</dl>
							<dl>
								<dt>매장</dt>
								<dd>
									<strong></strong>
								</dd>
							</dl>
							<dl>
								<dt>주문시간</dt>
								<dd>
									<strong></strong>
								</dd>
							</dl>
							<dl>
								<dt>결제수단</dt>
								<dd>
									<strong></strong>
								</dd>
							</dl>
							<dl>
								<dt>배달 예상시간</dt>
								<dd>
									<strong></strong>
								</dd>
							</dl>
						</div>
					</div>
				</div>		<!-- container02 pd02 order_list_sum end -->
					
				<div class="c_btn" style="display: none;">
					<a href="#" class="btn01">
						<span>전체보기</span>
					</a>
				</div>
				
				<div class="qmenuWrap02">
					<ul>
						<li class="qmenu_myset">
							<a href="#" class>
								<span>MY세트</span>
							</a>
						</li>
						
						<li class="qmenu_myplace">
							<a href="location_list.do?user_id=홍길동" class>
								<span>MY배달지</span>
							</a>
						</li>
					</ul>
				</div>		<!-- .qmenuWrap02 end -->
			</div>			<!-- .web_container.container01 end -->
		</div>				<!-- .contentsBox01 end -->
	</div>			<!-- .contentsWrap end (내용영역 끝) -->
		
</body>
<!-- 하단 푸터 -->
<jsp:include page="footer.jsp" />

</html>