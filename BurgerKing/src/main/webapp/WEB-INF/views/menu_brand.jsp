<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/menu/menu_brand.css"  rel="stylesheet"  type="text/css">
</head>
<!-- 메인헤더 -->
<jsp:include page="header.jsp" flush="true"/>
<body>

	<!-- 이 페이지 넘어올 때 컨트롤러에서 같이 보낸 데이터들 -->
	<c:set var="list" value="${menuList }" />
	<c:set var="cat" value="${category }" />
	<c:set var="size" value="${size }" />

	<!-- 전체 내용 영역 -->
	<div class="contentsWrap">
	
		<!-- 1. 까만 영역 -->
		<div class="WEB locationWrap">
			<div class="web_container">
				<div class="page_navi">
					<a href="/burger/" class>
						<span>HOME</span>
					</a>
					<span>메뉴소개</span>
				</div>
			</div>
		</div>		<!-- 까만 영역 끝 -->
		
		<!-- 2. 메뉴판 영역 -->
		<div class="contentsBox01 bg_w">
			<div class="web_container">
				<div class="subtitWrap">
					<h3 class="page_tit">메뉴소개</h3>
					<div class="tab01 w_st02 m_shadow m_multi">
						<ul>
							<li class="on">
								<button type="button">
									<span>스페셜&할인팩</span>
								</button>
							</li>
							<li class>
								<button type="button">
									<span>프리미엄</span>
								</button>
							</li>
							<li class>
								<button type="button">
									<span>와퍼</span>
								</button>
							</li>
							<li class>
								<button type="button">
									<span>주니어&버거</span>
								</button>
							</li>
							<li class>
								<button type="button">
									<span>올데이킹&치킨버거</span>
								</button>
							</li>
							<li class>
								<button type="button">
									<span>사이드</span>
								</button>
							</li>
							<li class>
								<button type="button">
									<span>음료&디저트</span>
								</button>
							</li>
						</ul>
					</div>
				</div>
				<div class="tab_cont">
					<h4 class="hide">프리미엄</h4>
					<input id="nowcat" type="hidden" value="${cat }">
					<ul class="prdmenu_list">
						<c:forEach items="${list }" var="menu">
							<li>
								<div class="prd_img">
									<c:if test="${menu.getMenu_type() == 'NEW' }">
										<em class='ico_flag_new'></em>
									</c:if>
									<c:if test="${menu.getMenu_type() == 'BEST' }">
										<em class='ico_flag_best'></em>
									</c:if>
									<span>
										<img src="${menu.getMenu_img() }" class style="display:inline; opacity:1;">
									</span>
								</div>
								<div class="cont">
									<p class="tit">
										<strong>${menu.getMenu_name() }</strong>
									</p>
								</div>
								<a class="btn_detail">
									<input type='hidden' value='${menu.getMenu_no() }'>
									<span>Details</span>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>		<!-- 메뉴판 영역 끝 -->
		
	</div> <!-- 전체 내용 영역 end -->

<script src="resources/js/menu/menu_brand.js"></script>
</body>
<!-- 감자 인클루드하기 -->
<!-- 여기 감자 자리 -->
<!-- 푸터 -->
<jsp:include page="footer.jsp" />
</html>