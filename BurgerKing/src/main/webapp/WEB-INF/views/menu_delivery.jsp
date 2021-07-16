<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="resources/css/menu/menu_delivery.css"  rel="stylesheet"  type="text/css">

</head>
<body>

	<!-- 메뉴판 내용 영역 -->
	<div class="contentsWrap">
	
		<!-- 1. 까만 영역 -->
		<div class="locationWrap"></div>
		
		<!-- 2. 메뉴판 영역 -->
		<div class="contentsBox01 bg_w">
			<div class="web_container">
				
				<!-- 2-1. 메뉴/카테고리 -->
				<div class="subtitWrap">
					<h3 class="page_tit">메뉴</h3>
					<!-- 카테고리 -->
					<div class="tab01 m_shadow m_multi">
						<ul class="item3">
							<li class="on">
								<button class="button">
									<span>스페셜&할인팩</span>
								</button>
							</li>
							<li class>
								<button class="button">
									<span>프리미엄</span>
								</button>
							</li>
							<li class>
								<button class="button">
									<span>와퍼</span>
								</button>
							</li>
							<li class>
								<button class="button">
									<span>주니어&버거</span>
								</button>
							</li>
							<li class>
								<button class="button">
									<span>치킨버거</span>
								</button>
							</li>
							<li class>
								<button class="button">
									<span>사이드</span>
								</button>
							</li>
							<li class>
								<button class="button">
									<span>음료&디저트</span>
								</button>
							</li>
						</ul>
					</div>
				</div>
				
				<!-- 2-2. 메뉴판 -->
				<div class="tab_cont">
					<h4 class="hide">프리미엄</h4>
					
					<c:set var="menuList" value="${menuList }" />
					<%-- <c:set var="category" value="${cat }" /> --%>
					<input id="nowcat" type="hidden"
						value="${cat }">
					<c:set var="menuNoList" value="${menuNoList }" />
					
					<!-- 데이터 없을 경우 -->
					<c:if test="${empty menuList }">
						<!-- <div class="nodata" style="display: none;"> -->
						<div class="nodata" style="">
							<p>
								<span>메뉴 준비중 입니다</span>
							</p>
						</div>
					</c:if>
					
					<!-- 데이터 있는 경우 -->
					<c:if test="${!empty menuList }">
						<ul class="prdmenu_list">
							<c:forEach items="${menuList }" var="dto">
								<li>
									<div class="prd_img">
										<c:if test="${dto.getMenu_type() == 'NEW' }">
											<em class=" ico_flag_new"></em>
										</c:if>
										<c:if test="${dto.getMenu_type() == 'BEST' }">
											<em class=" ico_flag_best"></em>
										</c:if>
										
										<span>
											<img src="${dto.getMenu_img() }" alt="제품" class style="display:inline; opacity:1;">
										</span>
									</div>
									<div class="cont">
										<p class="tit">
											<strong>${dto.getMenu_name()}</strong>
										</p>
										<p class="set_info">
											<c:if test="${dto.getMenu_name() == '몬스터Ⅱ팩1' or
															 dto.getMenu_name() == '몬스터Ⅱ팩2' or
															 dto.getMenu_name() == '몬스터Ⅱ팩3'}">
												<span>
													${dto.getMenu_member()}
												</span>
											</c:if>
										</p>
										<p class="price">
											<span>
												<strong>
													<em><span>
														<fmt:formatNumber value="${dto.getMenu_price()}"
																type="currency" />
														<c:forEach items="${menuNoList }" var="no">
															<c:if test="${dto.getMenu_no() == no }">~</c:if>
														</c:forEach>														
													</span></em>
												</strong>
											</span>
										</p>
									</div>
									<a class="btn_detail">
										<input type="hidden" value="${dto.getMenu_no() }"/>
										<span>Details</span>
									</a>
								</li>
							</c:forEach>
						</ul>
					</c:if>
				</div>
				
				<!-- 2-3. 유의사항 -->
				<!-- <div class="order_caution">
					<div class="tit03">
						<h4 class="WEB">유의사항</h4>
						<button type="button" class="btn_infoingredient">
							<strong>
								"원산지, 영양분석, 알레르기 유발성분"
							</strong>
						</button>
					</div>
					<ul class="WEB txtlist01">
						<li>내용</li>
						<li>내용</li>
						<li>내용</li>
						<li>내용</li>
						<li>내용</li>
						<li>내용</li>
						<li>내용</li>
						<li>내용</li>
					</ul>
				</div> -->
			</div>
		</div>
		
		<!-- 3. 모바일 화면 -->
		<div class="contentsBox01 MOB"></div>
		
		<!-- 클릭하면 세트메뉴 선택 팝업창 -->
		<!-- menuPopup -->
		
	</div>

<%-- <jsp:include page="menuPopup.jsp" flush="true" /> --%>
<script src="resources/js/menu/menu_delivery.js"></script>
<!-- <script src="resources/js/menu/menu_popup.js"></script> -->
</body>
</html>