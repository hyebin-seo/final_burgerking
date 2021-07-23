<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/brandStory/brandStory_menu.css"  rel="stylesheet"  type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/brandStory/brandStory_menu.js"></script>
</head>
<body>
	<!-- 메뉴판 내용 영역 -->
	<div class="contentsWrap eventWrap">
		<input type="hidden" id="nowcat" value="${cat }">
		<!-- 1. 까만 영역 -->
		<div class="locationWrap WEB"></div>
			<div class="contentsBox01 bg_w">
				<div class="web_container">
					<!-- 2-1. 메뉴/카테고리 -->
					<div class="subtitWrap">
						<h3 class="page_tit">브랜드 스토리</h3>
							<!-- 카테고리 -->
							<div class="tab01 m_shadow">
								<ul class="item3">
								<li class="on">
									<button type="button">
										<span>버거킹 스토리</span>
									</button>
								</li>
								<li class>
									<button type="button">
										<span>WHY 버거킹</span>
									</button>
								</li>
								<li class>
									<button type="button">
										<span>버거킹 NEWS</span>
									</button>
								</li>
							</div><!--tab01 m_shadow  -->
					</div><!-- subtitWrap end -->
				</div><!-- web_container end -->
			<!-- </div>contentsBox01 bg_w 
	</div>contentsWrap eventWrap end -->
</body>
</html>