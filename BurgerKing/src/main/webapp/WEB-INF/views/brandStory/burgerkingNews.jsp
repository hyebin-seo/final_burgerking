<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신제품</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/public/favicon.ico">
<link href="resources/css/brandStory/burgerkingNews.css"  rel="stylesheet"  type="text/css">
</head>
<body>
	<jsp:include page="burgerkingNewslocation.jsp"/>
	<jsp:include page="brandStory_menu.jsp"/>
	<div class="web_container">
		<div class="tab_cont">
			<ul class="tab_storyBtn m_shadow">
				<li class="on">
					<button type="button" onclick="location.href='burgerkingNews.do'">
						<span>신제품</span>
					</button>
				</li>
				<li class>
					<button type="button" onclick="location.href='BurgerkingTv.do'">
						<span>광고(TV/Digital)</span>
					</button>
				</li>
			</ul>
			<c:set var="NewMenuList" value="${NewMenuList }" />
			<div class="tab_cont">
				<div class="new_product">
					<h4 class="MOB m_subtit">신제품 소개</h4>
					<ul class="prdmenu_list">
							<c:if test="${!empty NewMenuList }">
							<c:forEach items="${NewMenuList }" var="dto">
							<li>
								<div class="prd_img WEB">
									<span>
										<img src="${dto.getNewMenu_img() }">
									</span>
								</div>
								<div class="prd_img MOB">
									<span>
										<img src="${dto.getNewMenu_mobimg() }">
									</span>
								</div>
								<div class="cont">
									<p class="tit">
										<strong>${dto.getNewMenu_name() }</strong>
									</p>
									<p class="txt_intro">
									${dto.getNewMenu_sentence() }
									</p>
								</div>
							</li>
						</c:forEach>
						</c:if>
					</ul>
				</div><!-- new_product end -->
			</div><!-- tab_cont end -->
		</div><!-- tab_cont end -->
	</div><!-- web_container end 탭 부분의 컨테이너임 -->
</body>
<jsp:include page="../siteMap.jsp"/>
</html>