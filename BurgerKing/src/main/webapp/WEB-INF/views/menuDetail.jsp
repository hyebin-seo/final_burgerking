<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1" /> 
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/menu/menuDetail.css"  rel="stylesheet"  type="text/css">
</head>
<!-- 메인헤더 -->
<jsp:include page="header.jsp" flush="true"/>
<body>

	<!-- 이 페이지 넘어올 때 컨트롤러에서 같이 보낸 데이터들 -->
	<c:set var="dto" value="${dto }" />
	<c:set var="setList" value="${setList }" />
	<c:set var="catMenuList" value="${catMenuList }" />
	<c:set var="cat" value="${dto.getMenu_cat() }" />
	
	<input type="hidden" class="catMenuListSize" value="${catMenuList.size() }">
	
	<div class="contentsWrap">
		<div class="WEB locationWrap">
			<div class="web_container">
				<div class="page_navi">
					<a href="/burger/" class>
						<span>HOME</span>
					</a>
					<a href="menu_brand.do?category=${fn:replace(cat, '&', '%26')}" class>
						<span>메뉴소개</span>
					</a>
					<a href="menu_brand.do?category=${fn:replace(cat, '&', '%26')}" class>
						<span>${dto.getMenu_cat() }</span>
					</a>
					<span>
						${dto.getMenu_name() }
					</span>
				</div>
			</div>
		</div>
		<div class="contentsBox02 prd_intro">
			<div class="web_container">
				<div class="intro_txt">
					<strong class="tit">
						<span>${dto.getMenu_name() }</span>
					</strong>
					<p class="subtxt">
						<span>${dto.getMenu_sentence() }</span>
					</p>
				</div>
				<div id="prdImg" class="prd_img detail">
					<em class=" ico_flag_new"></em>
					<span>
						<img src="${dto.getMenu_img() }">
					</span>
				</div>
			</div>
		</div>
		<div class="contentsBox02 menu_subinfoWrap">
			<div class="web_container">
				<a class="btn_back" href="menu_brand.do?category=${fn:replace(cat, '&', '%26')}">
					<span>메뉴 목록으로 돌아가기</span>
				</a>
				<div class="nutrition_info">
					<button type="button" class="btn_nutrition">
						<span>영양분석표, 알레르기 유발성분</span>
					</button>
				</div>
			</div>
		</div>
		<div class="contentsBox01 bg_w">
			<div class="web_container">
				<div class="txt_menudetail_intro m_bg_basic" style="display: none;">
					<span></span>
				</div>
				<ul class="prdmenu_list prd_submenu m_bg_basic">
					<c:if test="${empty setList }">
						<li>
							<div class="prd_img">
								<em class></em>
								<span>
									<img src="${dto.getMenu_img() }" alt="제품">
								</span>
							</div>
							<div class="cont">
								<p class="tit">
									<strong>${dto.getMenu_name() }</strong>
								</p>
								<p class="set">
									<span>${dto.getMenu_sentence()}</span>
								</p>
							</div>
						</li>
					</c:if>
					<c:if test="${!empty setList }">
						<c:forEach items="${setList }" var="set">
							<li>
								<div class="prd_img">
									<em class></em>
									<span>
										<img src="${set.getSet_img() }" alt="제품">
									</span>
								</div>
								<div class="cont">
									<p class="tit">
										<strong>${set.getSet_name() }</strong>
									</p>
									<p class="set">
										<span>${set.getSet_member()}</span>
									</p>
								</div>
							</li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
		</div>
		<div class="contentsBox01 other_menuWrap">
			<div class="web_container">
				<div class="titbox">
					<h3>${dto.getMenu_cat() }의 다른 메뉴</h3>
				</div>
				<div class="othermenu_list">
					<div class="slick-initialized slick-slider slick-dotted">
						<!-- < 화살표 -->
						<c:if test="${catMenuList.size() > 4 }">
							<button class="btn_swiper btn_prev slick-arrow slick-disabled" aria-disabled="true" style>
								<span>Previous contents</span>
							</button>
						</c:if>
						
						<!-- 안쪽 메뉴 리스트 -->
						<div class="slick-list draggable">
							<div class="slick-track" style="opacity: 1; width: 1554px; transform: translate3d(0px, 0px, 0px);">
								<c:if test="${catMenuList.size()%4 != 0}">
									<c:forEach begin="1" end="${catMenuList.size()/4 + 1}" var="i">
										<c:if test="${i==1 }">
										<div class="div${i }" style="display: block;">
										</c:if>
										<c:if test="${i!=1 }">
										<div class="div${i }" style="display: none;">
										</c:if>
											<c:forEach items="${catMenuList}" begin="${4*(i-1) }" end="${4*i - 1 }" var="cat" varStatus="status">
												<div class="slick-slide slick-current slick-active" style="width: 259px;">
													<div>
														<div style="width: 100%; display: inline-block;">
															<div class="prd_img">
																<c:if test="${cat.getMenu_type() == 'NEW' }">
																	<em class="ico_flag_new"></em>
																</c:if>
																<c:if test="${cat.getMenu_type() == 'BEST' }">
																	<em class="ico_flag_best"></em>
																</c:if>
																<span>
																	<img src="${cat.getMenu_img() }">
																</span>
															</div>
															<div class="cont">
																<p class="tit">
																	<strong>${cat.getMenu_name() }</strong>
																</p>
															</div>
															<a class="btn_detail">
																<input type="hidden" value="${cat.getMenu_no() }">
																<span>Details</span>
															</a>
														</div>
													</div>
												</div>	
											</c:forEach>
										</div>
									</c:forEach>
								</c:if>
								
								<c:if test="${catMenuList.size()%4 == 0}">
									<c:forEach begin="1" end="${catMenuList.size()/4}" var="i">
										<c:if test="${i==1 }">
										<div class="div${i }" style="display: block;">
										</c:if>
										<c:if test="${i!=1 }">
										<div class="div${i }" style="display: none;">
										</c:if>
											<c:forEach items="${catMenuList}" begin="${4*(i-1) }" end="${4*i - 1 }" var="cat" varStatus="status">
												<div class="slick-slide slick-current slick-active" style="width: 259px;">
													<div>
														<div style="width: 100%; display: inline-block;">
															<div class="prd_img">
																<c:if test="${cat.getMenu_type() == 'NEW' }">
																	<em class="ico_flag_new"></em>
																</c:if>
																<c:if test="${cat.getMenu_type() == 'BEST' }">
																	<em class="ico_flag_best"></em>
																</c:if>
																<span>
																	<img src="${cat.getMenu_img() }">
																</span>
															</div>
															<div class="cont">
																<p class="tit">
																	<strong>${cat.getMenu_name() }</strong>
																</p>
															</div>
															<a class="btn_detail">
																<input type="hidden" value="${cat.getMenu_no() }">
																<span>Details</span>
															</a>
														</div>
													</div>
												</div>	
											</c:forEach>
										</div>
									</c:forEach>
								</c:if>
								
								<%-- <c:forEach items="${catMenuList }" var="cat" varStatus="status">
									<div class="slick-slide slick-current slick-active" style="width: 259px;">
										<div>
											<div style="width: 100%; display: inline-block;">
												<div class="prd_img">
													<c:if test="${cat.getMenu_type() == 'NEW' }">
														<em class="ico_flag_new"></em>
													</c:if>
													<c:if test="${cat.getMenu_type() == 'BEST' }">
														<em class="ico_flag_best"></em>
													</c:if>
													<span>
														<img src="${cat.getMenu_img() }">
													</span>
												</div>
												<div class="cont">
													<p class="tit">
														<strong>${cat.getMenu_name() }</strong>
													</p>
												</div>
												<a class="btn_detail">
													<span>Details</span>
												</a>
											</div>
										</div>
									</div>	
								</c:forEach> --%>
							</div>
						</div>
						
						<!-- > 화살표 -->
						<c:if test="${catMenuList.size() > 4 }">
							<button class="btn_swiper btn_next slick-arrow" style aria-disabled="false">
								<span>Next contents</span>
							</button>
						</c:if>
						
						<!-- 하단 ... 표시 -->
						<!-- <ul class="swiper-pagination" style role="tablist">
							<li class="slick-active" role="presentation">
								<button type="button" role="tab" id="slick-slide-control400"
								aria-controls="slick-slide400"
								aria-label="1 of 4" tabindex="0" aria-selected="true">
									1
								</button>
							</li>
							<li class role="presentation">
								<button type="button" role="tab" id="slick-slide-control401"
								aria-controls="slick-slide404"
								aria-label="2 of 4" tabindex="-1">
									2
								</button>
							</li>
							<li class role="presentation">
								<button type="button" role="tab" id="slick-slide-control402"
								aria-controls="slick-slide408"
								aria-label="3 of 4" tabindex="-1">
									3
								</button>
							</li>
							<li role="presentation">
								<button type="button" role="tab" id="slick-slide-control403"
								aria-controls="slick-slide4012"
								aria-label="4 of 4" tabindex="-1">
									4
								</button>
							</li>
						</ul> -->
					</div>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="ingredient/ingredientPopup.jsp" />
<script src="resources/js/menu/menuDetail.js"></script>
</body>
<!-- 감자 인클루드하기 -->
<!-- 여기 감자 자리 -->
<!-- 푸터 -->
<jsp:include page="footer.jsp" />
</html>