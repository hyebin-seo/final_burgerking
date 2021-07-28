<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가맹점모집:Admin</title>
<link  href="resources/css/cs/admin_franchise.css"  rel="stylesheet"  type="text/css">
</head>
<body>
	<jsp:include page="franchiselocation.jsp" />
	<jsp:include page="cs_menu.jsp" />
	<div class="tab_cont">
		<h4 class="hide">가맹점모집 신청현황</h4>
		<!-- 서치 부분 -->
		<div class="board_searchWrap">
		</div><!-- 서치 부분 end -->
		<div class="board_list">
			<table class="tlist01">
				<colgroup>
					<col style="width: 10%;">
					<col style="width: 10%;">
					<col style="width: 20%;">
					<col style="width: 20%;">
					<col style="width: 10%;">
					<col style="width: 20%;">
					<col style="width: 10%;">
				</colgroup>
				<thead>
					<th scope="col">NO.</th>
					<th scope="col">신청자 이름</th>
					<th scope="col">신청자 전화번호</th>
					<th scope="col">신청자 이메일</th>
					<th scope="col">임대차 보유유무</th>
					<th scope="col">가맹 문의 날짜</th>
					<th scope="col">신청 상태</th>
				</thead>
				<tbody>
					<c:set var="list" value="${List }" />
	      			<c:if test="${!empty list }">
	         		<c:forEach items="${list }" var="dto">
						<tr>
							<td><span>${dto.getFran_no() }</span></td>
							<td><a href="<%=request.getContextPath()%>/AdminFranchiseCont.do?no=${dto.getFran_no() }&page=${Paging.getPage()}">${dto.getFran_name() }</a></td>
							<td><span>${dto.getFran_phone() }</span></td>
							<td><span>${dto.getFran_email() }</span></td>
							<td><span>${dto.getFran_possession() }</span></td>
							<td><span>${dto.getFran_regdate().substring(0,10) }</span></td>
							<td><span>${dto.getFran_status() }</span></td>
						</tr>
					</c:forEach>
	      			</c:if>
	      			
	      			<c:if test="${empty list }">
						<tr>
							<td colspan="7">
								<div class="nodata">
									<span>검색 결과가 없습니다.</span>
								</div>
							</td>
						</tr>
					 </c:if>
				</tbody>
			</table>
			<br><br><br>
			<%-- 페이징 처리 부분 --%>
	      	<div class="text">
	      	<c:forEach begin="${Paging.getStartBlock() }"
	                         end="${Paging.getEndBlock() }" var="i">
	         <c:if test="${i == Paging.getPage() }">
	            <b class="page"><a href="AdminFranchise.do?page=${i }">${i }</a></b>
	         </c:if>
	         
	         <c:if test="${i != Paging.getPage() }">
	            <span class="page"><a href="AdminFranchise.do?page=${i }">${i }</a></span>
	         </c:if>
	      	</c:forEach>
	      </div>
		</div><!-- board_list end -->
	</div><!-- tab_cont end -->
</body>
</html>