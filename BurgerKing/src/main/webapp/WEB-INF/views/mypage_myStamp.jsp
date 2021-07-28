<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mypage/mypage_stamp.css" type="text/css">
<title>MY스탬프</title>
</head>
<jsp:include page="delivery/deliveryHeader.jsp" flush="true"/>
<jsp:include page="delivery/deliveryCart.jsp"/>
<body>
	
<!-- 내용 영역 -->
<div class="contentsWrap">
	
	<!-- 페이지 이동시 컨트롤러에서 전달한 데이터들 -->
	<c:set var="stampList" value="${myStampList }" />
		
	<!-- 1. 까만 영역 -->
	<div class="loc_container">
		<div class="loc">
			<div class="page-navi">
				<a href="delivery_home.do"><span>딜리버리</span></a>
				<a><span>스탬프</span></a>
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
		
	<!-- 배너 이미지 -->
	<div class="contentsBox02">
		<div class="web_container">
			<div class="MOB subtitWrap">
				<h2 class="page_tit st02">스탬프</h2>
			</div>
		</div>
		<div class="stamp_banner">
			<div class="WEB">
				<img src="https://www.burgerking.co.kr/dist/img/@img_stamp_event.9571b5fe.png" alt="스탬프 Banner">
			</div>
			<div class="MOB">
				<img src="https://www.burgerking.co.kr/dist/img/@img_stamp_event_m.7df2d55e.png" alt="스탬프 Banner">
			</div>
		</div>
	</div>
	
	<!-- 스탬프 판 -->
	<div class="contentsBox01">
		<div class="web_container">
			<div class="stamp_status">
				<h2 class="tit">
					<strong>
						나의 스탬프
						<em><span>${stampList.size() }</span>개</em>
					</strong>
				</h2>
				<p class="info">
					<span class="m_block">
						메뉴 주문 시
						<strong><em>스탬프 1개</em></strong>
					</span>
					를 드립니다.
				</p>
				<ol class="stamp_list">
					<!-- stamp가 10개 이하일때 -->
					<c:if test="${stampList.size() <= 10 }">
						<c:forEach begin="1" end="${stampList.size() }" var="i">
							<li class>
								<div class="stamp on">
									<span>스탬프</span>
									<c:if test="${i != 5 && i != 10 }">
										<em class="coupon" style="display:none;">쿠폰</em>
									</c:if>
									<c:if test="${i == 5 || i == 10 }">
										<em class="coupon">쿠폰</em>
									</c:if>
								</div>
							</li>
						</c:forEach>
						<c:forEach begin="${stampList.size()+1 }" end="10" var="j">
							<li class>
								<div class="stamp">
									<span>스탬프</span>
									<c:if test="${j != 5 && j != 10 }">
										<em class="coupon" style="display:none;">쿠폰</em>
									</c:if>
									<c:if test="${j == 5 || j == 10 }">
										<em class="coupon">쿠폰</em>
									</c:if>
								</div>
							</li>
						</c:forEach>
					</c:if>
					<!-- stamp가 10개 초과일때 -->
					<c:if test="${stampList.size() > 10 }">
						<c:forEach begin="1" end="${stampList.size() - 10 }" var="i">
							<li class>
								<div class="stamp on">
									<span>스탬프</span>
									<c:if test="${i != 5 && i != 10 }">
										<em class="coupon" style="display:none;">쿠폰</em>
									</c:if>
									<c:if test="${i == 5 || i == 10 }">
										<em class="coupon">쿠폰</em>
									</c:if>
								</div>
							</li>
						</c:forEach>
						<c:forEach begin="${stampList.size()-10 + 1 }" end="10" var="j">
							<li class>
								<div class="stamp">
									<span>스탬프</span>
									<c:if test="${j != 5 && j != 10 }">
										<em class="coupon" style="display:none;">쿠폰</em>
									</c:if>
									<c:if test="${j == 5 || j == 10 }">
										<em class="coupon">쿠폰</em>
									</c:if>
								</div>
							</li>
						</c:forEach>
					</c:if>				
				</ol>
				<!-- 적립내역 기능 삭제 -->
				<!-- <div class="c_btn">
					<button type="button" class="btn04 btn01_m02 red">
						<span>적립내역</span>
					</button>
				</div> -->
			</div>
			
			<!-- 쿠폰 발급가능할때만 보여줌 -->
			<c:if test="${stampList.size() > 5}">
				<div class="stamp_couponWrap">
					<div class="stamp_titWrap">
						<p class="tit">
							<strong>쿠폰을 선택해주세요</strong>
						</p>
						<div class="txt">
							<p>
								<strong>
									<em><span>1</span>개</em>
								</strong>
								의 쿠폰이 있습니다
							</p>
							<p>
								<span class="ico_i02 WEB">ⓘ</span>
								쿠폰은 받으신 날로 부터 30일 동안 유효합니다 
							</p>
						</div>
					</div>
					<ul class="stamp_coupon_list">
						<li class="mycoupon">
							<div class="coupon_tit">
								<strong>1번</strong>
								<span>&nbsp;&nbsp;쿠폰 받기를 선택해 쿠폰을 받으세요</span>
							</div>
							<c:if test="${stampList.size() > 5 && stampList.size() < 10}">
								<div class="mycoupon_img">
									<span>
										<img src="https://d1cua0vf0mkpiy.cloudfront.net/images/menu/normal/0e25fe9d-25c1-40a2-b273-3076b2bb4470.png" alt="쿠폰" class style>
									</span>
								</div>
								<div class="mycoupon_name">
									<p>와퍼주니어세트</p>
								</div>
								<div  class="mycoupon_btn">
								<button type="button" class="btn01 getCoupon"
										value="coupon5">
									<span>쿠폰받기</span>
								</button>
							</div>
							</c:if>
							<c:if test="${stampList.size() >= 10}">
								<div class="mycoupon_img">
									<span>
										<img src="https://d1cua0vf0mkpiy.cloudfront.net/images/menu/normal/ccf7bc1f-a4c1-4d41-bd3f-74552918196f.png" alt="쿠폰" class style>
									</span>
								</div>
								<div  class="mycoupon_name">
									<p>기네스와퍼세트</p>
								</div>
								<div  class="mycoupon_btn">
								<button type="button" class="btn01 getCoupon"
										value="coupon10">
									<span>쿠폰받기</span>
								</button>
							</div>
							</c:if>
						</li>
					</ul>
				</div>
			</c:if>
		</div>
	</div>
	
	<!-- 사용설명 -->
	<div class="contentsBox01 bg_w">
		<div class="web_container">
			<!-- 쿠폰 발급 가능할 때는 안 보여줌 -->
			<c:if test="${stampList.size() <= 5}">
				<div class="stamp_introWrap">
					<h3 class="tit">
						아직 스탬프가<em>부족</em>해요
					</h3>
					<p>
						스탬프를 <strong>5개 이상</strong> 모으면 쿠폰이 지급됩니다.<br>
						팩 또는 세트 메뉴를 <strong>버거킹 웹/앱에서 주문</strong>해 보세요.
					</p>
					<p>
						※단품, 콤보 및 쿠폰, 전자상품권을 통한 할인 구매 시 스탬프 적립이 되지 않습니다. 그 외 할인 프로모션의 경우 정책에 따라 적립되지 않을 수 있습니다.
					</p>
					<div class="c_btn">
						<a href="delivery_home.do" class="btn01 red">
							<span>지금 주문하기</span>
						</a>
					</div>
				</div>
			</c:if>
			<div class="stemp_guide">
				<h3 class="tit">스탬프 적립 및 쿠폰 사용 방법</h3>
				<ol class="WEB step_guide">
					<li>
						<div class="guide_img">
							<img src="https://www.burgerking.co.kr/dist/img/img_guide_stamp01.9ccae460.png" alt="guide image">
						</div>
						<p class="step_txt">
							<strong class="num">Step 1.</strong>
							<span>버거킹 웹, 앱 딜리버리에서 세트/팩 주문</span>
						</p>
					</li>
					<li>
						<div class="guide_img">
							<img src="https://www.burgerking.co.kr/dist/img/img_guide_stamp02.a81c340c.png" alt="guide image">
						</div>
						<p class="step_txt">
							<strong class="num">Step 2.</strong>
							<span>버거킹 웹, 앱의 "MY킹" 메뉴 선택</span>
						</p>
					</li>
					<li>
						<div class="guide_img">
							<img src="https://www.burgerking.co.kr/dist/img/img_guide_stamp03.8c8f53b8.png" alt="guide image">
						</div>
						<p class="step_txt">
							<strong class="num">Step 3.</strong>
							<span>스탬프 메뉴에서 스탬프 적립을 확인!</span>
						</p>
					</li>
					<li>
						<div class="guide_img">
							<img src="https://www.burgerking.co.kr/dist/img/img_guide_stamp04.c9017ab1.png" alt="guide image">
						</div>
						<p class="step_txt">
							<strong class="num">Step 4.</strong>
							<span>스탬프 적립 후 쿠폰 받기!</span>
						</p>
					</li>
					<li>
						<div class="guide_img">
							<img src="https://www.burgerking.co.kr/dist/img/img_guide_stamp05.e306cbb6.png" alt="guide image">
						</div>
						<p class="step_txt">
							<strong class="num">Step 5.</strong>
							<span>받은 쿠폰을 매장에서 사용하기! </span>
						</p>
					</li>
				</ol>
				
				<!-- 모바일 가이드 전체 div -->
				<div class="MOB guide_swipe">
					<div class="list slick-initialized slick-slider slick-dotted">
						
						<!-- 왼쪽 버튼(<) -->
						<button class="btn_swiper btn_prev slick-arrow" style>
							<span>Previous contents</span>
						</button>
						
						<!-- 사용 가이드 내용(이미지+텍스트) 영역 -->
						<div class="slick-list draggable">
							<!-- <div class="slick-track" style="opacity: 1; width: 6754px; transform: translate3d(-1842px, 0px, 0px);"> -->
							<div class="slick-track" style="opacity: 1; width: 6754px;">
								<div class="slick-slide div1" style="width: 660px; display: block;">
									<div>
										<div style="width: 100%; display: inline-block;">
											<div class="guide_img">
												<img src="https://www.burgerking.co.kr/dist/img/img_guide_stamp01_m.b5de10ca.png" alt="guide image">
											</div>
											<p class="step_txt">
												<strong class="num">Step 1.</strong>
												<span>버거킹 웹, 앱 딜리버리에서 세트/팩 주문</span>
											</p>
										</div>
									</div>
								</div>
								<div class="slick-slide div2" style="width: 660px; display: none;">
									<div>
										<div style="width: 100%; display: inline-block;">
											<div class="guide_img">
												<img src="https://www.burgerking.co.kr/dist/img/img_guide_stamp02_m.e02349e4.png" alt="guide image">
											</div>
											<p class="step_txt">
												<strong class="num">Step 2.</strong>
												<span>버거킹 웹, 앱의 "스탬프" 메뉴 선택</span>
											</p>
										</div>
									</div>
								</div>
								<div class="slick-slide div3" style="width: 660px; display: none;">
									<div>
										<div style="width: 100%; display: inline-block;">
											<div class="guide_img">
												<img src="https://www.burgerking.co.kr/dist/img/img_guide_stamp03_m.601adee9.png" alt="guide image">
											</div>
											<p class="step_txt">
												<strong class="num">Step 3.</strong>
												<span>스탬프 메뉴에서 스탬프 적립을 확인!</span>
											</p>
										</div>
									</div>
								</div>
								<div class="slick-slide div4" style="width: 660px; display: none;">
									<div>
										<div style="width: 100%; display: inline-block;">
											<div class="guide_img">
												<img src="https://www.burgerking.co.kr/dist/img/img_guide_stamp04_m.5ed8eaae.png" alt="guide image">
											</div>
											<p class="step_txt">
												<strong class="num">Step 4.</strong>
												<span>스탬프 적립 후 쿠폰 받기!</span>
											</p>
										</div>
									</div>
								</div>
								<div class="slick-slide div5" style="width: 660px; display: none;">
									<div>
										<div style="width: 100%; display: inline-block;">
											<div class="guide_img">
												<img src="https://www.burgerking.co.kr/dist/img/img_guide_stamp05_m.65209d3f.png" alt="guide image">
											</div>
											<p class="step_txt">
												<strong class="num">Step 5.</strong>
												<span>받은 쿠폰을 매장에서 사용하기!</span>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- 오른쪽 버튼(>) -->
						<dutton class="btn_swiper btn_next slick-arrow" style>
							<span>Next contents</span>
						</dutton>
						
						<!-- 하단 ... 부분 생략 -->
						<!-- <ul class="swiper-pagination" style role="tablist"></ul> -->
					</div>
				</div>
				
				<div class="guide_txt">
					<h2 class="tit04">꼭 알아두세요.</h2>
					<ul class="txtlist01">
						<li>
							버거킹의 APP, WEB를 통한 구매로만 스탬프가 적립 됩니다. (외부채널을 통한 적립 불가)
						</li>
						<li>
							딜리버리, 킹오더를 통해 세트구매시 1개, 팩 메뉴 구매시 2개의 스탬프가 적립 됩니다.
						</li>
						<li>
							스탬프를 5개 또는 10개 적립 후 다음 날 오전 9시 이후에 쿠폰이 발급 됩니다.
						</li>
						<li>
							단품, 콤보 및 쿠폰, 전자상품권을 통한 할인 구매 시 스탬프 적립이 되지 않습니다. 그외 할인 프로모션의 경우 정책에 따라 적립되지 않을 수 있습니다.
						</li>
						<li>
							쿠폰의 유효기간은 발급일로부터 1개월 입니다.
						</li>
						<li>
							쿠폰의 발급일은 쿠폰 받기를 한 날을 기준으로 합니다.
						</li>
						<li>
							쿠폰을 통해 지급 받은 무료 교환권으로는 스탬프 적립이 되지 않습니다.
						</li>
						<li>
							쿠폰다운로드는 이벤트가 종료된 다음날 까지만 가능합니다.
						</li>
						<li>
							유효기간이 지난 경우 쿠폰 발급 및 사용이 불가함 유의 부탁 드립니다.
						</li>
						<li>
							일부 매장의 경우 스탬프의 적립과 사용이 제한될 수 있습니다.
						</li>
						<li>
							스탬프 제외매장(가나다 순)<br>
							<strong style="word-break: break-all;">
								거제고현점, 거제수월점, 거제옥포점, 경기양평점, 경남대점, 경북상주점, 경북영주가흥점, 경산사동점, 광양LF스퀘어점, 광양중동점, 광주경안점, 광주매곡점, 광주봉선점, 광주상무점, 광주수완점, 광주월계점, 광주일곡점, 광주첨단2지구점, 광주터미널점, 구미신평점, 구미인의점, 군산나운FS점, 군산수송점, 김천혁신도시점, 김포현대아울렛, 김해삼계점, 나주빛가람점, 당진읍내점, 대구대명FS점, 대구대점, 대구이시아폴리스점, 대구죽전네거리DT, 대구지산점, 대구칠곡3지구점, 대구테크노폴리스점, 대명비발디점, 대전관평점, 대전도안점, 대전시청점, 대전현대아울렛점, 마산합성점, 목포하당점, 방배카페골목, 보령동대점, 부산괴정역점, 부산망미SK점, 부산안락DT점, 삼성라이온즈파크점, 서산호수공원점, 세종반곡점, 세종행복새롬점, 수원매탄점, 수원정자점, 순천법원점, 숭례문점, 여수웅천점, 연희점, 오산궐동점, 오션월드점, 오창호수공원점, 용인동백점, 울산신정FS점, 원광대점, 의정부HP점, 익산영등점, 인제대점, 인천공항1점, 인천공항교통센터1점, 인천송도센트럴파크점, 인천연수HP점, 인천연수점, 전남도청점, 전북대점, 전북도청점, 전주중앙점, 정읍중앙점, 지산리조트점, 진주경상대점, 천안두정점, 천안성성점, 천안쌍용대로DT점, 청담주성점, 청주복대점, 청주산남점, 청주오송점, 청주율량점, 충남대병원DT점, 충남도청점, 충북대점, 충북진천점, 평택비전점, 평택청북점, 포항공대점, 한동대점, 해운대비치점, 해운대우동점, 호남대점, 
							</strong>
						</li>
						<li>
							이벤트 종료 시, 적립된 스탬프는 초기화 됩니다.
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<!--  -->
	<div class="popWrap" style="display:none;">
		<div class="popbox01">
			<div class="popcont">
				<h1 class="tit_coupon">
					<em>쿠폰</em>을 받았습니다!
				</h1>
				<p class="txt02">
					받으신 쿠폰은 버거킹 앱에서<br>
					확인 가능합니다.<br>
					(쿠폰은 매장에서만 사용가능합니다.)
				</p>
			</div>
			<div class="pop_btn full_type c_btn ">
				<button type="button" class="btn02 dark">
					<span>닫기</span>
				</button>
			</div>
		</div>
	</div>

</div>

</body>
<script src="resources/js/mypage/mypage_myStamp.js"></script>
<jsp:include page="footer.jsp" />
</html>