<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/cs/cs_menu.css"  rel="stylesheet"  type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/cs/cs_menu.js"></script>
</head>
<body>
	<!-- 메뉴판 내용 영역 -->
	<div class="contentsWrap eventWrap">
		
		<input type="hidden" id="nowcat" value="${cat }">
		
		<!-- 1. 까만 영역 -->
		<div class="locationWrap"></div>

		<!-- 2. 메뉴판 영역 -->
			<div class="contentsBox01 bg_w">
				<div class="web_container">
					
					<!-- 2-1. 메뉴/카테고리 -->
					<div class="subtitWrap">
						<h3 class="page_tit">고객센터</h3>
						<!-- 카테고리 -->
						<div class="tab01 m_shadow m_multi">
							<ul class="item3">
								<li class="on">
									<button class="button">
										<span>공지사항</span>
									</button>
								</li>
								<li class>
									<button class="button">
										<span>FAQ</span>
									</button>
								</li>
								<li class>
									<button class="button">
										<span>문의</span>
									</button>
								</li>
								<li class>
									<button class="button">
										<span>가맹점모집</span>
									</button>
								</li>
							</ul>
						</div>
					</div>