<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>광고</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/public/favicon.ico">
<link href="resources/css/brandStory/burgerkingTv.css"  rel="stylesheet"  type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/brandStory/burgerkingTv.js"></script>
</head>
<body>
	<jsp:include page="burgerkingNewslocation.jsp"/>
	<jsp:include page="brandStory_menu.jsp"/>
	<div class="web_container">
	<div class="tab_cont">
			<ul class="tab_storyBtn m_shadow">
				<li class>
					<button type="button" onclick="location.href='burgerkingNews.do'">
						<span>신제품</span>
					</button>
				</li>
				<li class="on">
					<button type="button" onclick="location.href='BurgerkingTv.do'">
						<span>광고(TV/Digital)</span>
					</button>
				</li>
			</ul>	
			<div class="tab_cont container01">
				<div class="TV_movie">
					<!-- ajax로 처리해야할 부분 -->
					<strong class="tit">부드러운 소불고기에 매콤함을 더하다! 고추장소불고기버거 출시</strong>
					<div class="movie">
						<iframe src="https://www.youtube.com/embed/5T-TGBVJNIw?rel=0&showinfo=0&autoplay=0"
						width="100%" height="605" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="allowfullscreen">
						#document
						</iframe>
					</div>
					<!-- ajax로 처리해야할 부분 end -->
				</div><!-- TV_movie end -->
				<div class="movie_list">
					<div class="tab01">
						<ul>
							<li class="on">
								<button type="button">
									<span>2021</span>
								</button>
							</li>
						</ul>
					</div>
					<c:set var="tvList" value="${tvList }" />
					<ul class="list">
						<c:if test="${!empty tvList }">
						<c:forEach items="${tvList }" var="dto">
						<li>
							<input type="radio" name="rdoBanner" value="${dto.getTv_no() }" class="tv_btn">
							<div class="thumb">
								<img src="${dto.getTv_img() }">
							</div>
							<div class="tit">${dto.getTv_name() }</div>
						</li>
						</c:forEach>
						</c:if>
					</ul>
				</div><!-- movie_list end -->		
			</div><!-- tab_cont container01 end tv광고 부분 -->
	</div>
</div>
<jsp:include page="../siteMap.jsp"/>
</body>
