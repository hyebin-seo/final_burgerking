<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/cs/cs_menu.css"  rel="stylesheet"  type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/cs/event_menu.js"></script>
</head>
<body>
	<!-- 메뉴판 내용 영역 -->
	<div class="contentsWrap eventWrap">
		
		<input type="hidden" id="nowcat" value="${cat }">
		
		<!-- 1. 까만 영역 -->
		<div class="locationWrap WEB"></div>

		<!-- 2. 메뉴판 영역 -->
			<div class="contentsBox01 bg_w">
				<div class="web_container">
					
					<!-- 2-1. 메뉴/카테고리 -->
					<div class="subtitWrap">
						<h3 class="page_tit">이벤트</h3>
						<!-- 카테고리 -->
						<div class="tab01 m_shadow">
							<ul class="item3">
								<li class="on">
									<button type="button" >
										<span>전체</span>
									</button>
								</li>
								<li class>
									<button type="button">
										<span>진행중</span>
									</button>
								</li>
								<li class>
									<button type="button">
										<span>종료</span>
									</button>
								</li>
								
							</ul>
						</div>
					</div>
		