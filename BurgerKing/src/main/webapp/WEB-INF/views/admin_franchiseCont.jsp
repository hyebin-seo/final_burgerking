<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가맹점모집:Admin</title>
<link  href="resources/css/cs/admin_franchiseCont.css"  rel="stylesheet"  type="text/css">
</head>
<body>
	<jsp:include page="franchiselocation.jsp" />
	<jsp:include page="cs_menu.jsp" />
	<div class="tab_cont">
		 <c:set var="dto" value="${franchiseCont }" />
		  <c:if test="${!empty dto }">	   
		<h4 class="hide">${dto.getFran_name() }님의 신청 상세 내역</h4><br><br>
		<!-- 서치 부분 -->
		<div class="board_searchWrap">
		</div><!-- 서치 부분 end -->
		<div class="board_list">
			<table class="tlist01">
				<colgroup>
					<col style="width: 40%;">
					<col style="">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">신청 내용</th>
						<th scope="col">신청자 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>NO.</td>
						<td>${dto.getFran_no() }</td>
					</tr>
					<tr>
						<td>신청자 이름</td>
						<td>${dto.getFran_name() }</td>
					</tr>
					<tr>
						<td>신청자 생년월일</td>
						<td>${dto.getFran_birth() }</td>
					</tr>
					<tr>
						<td>신청자 전화번호</td>
						<td>${dto.getFran_phone().substring(0,3) }-${dto.getFran_phone().substring(3,7) }-${dto.getFran_phone().substring(7,11) }</td>
					</tr>
					<tr>
						<td>가맹신청 지역</td>
						<td>${dto.getFran_city() } ${dto.getFran_gu() }</td>
					</tr>
					<tr>
						<td>임대차 보유 유무</td>
						<td>${dto.getFran_possession() }</td>
					</tr>
					<tr>
						<td>임대차 보유 면적</td>
						<td>
							<c:if test="${dto.getFran_area()  == 'null㎡'}">
								보유 면적 없음
							</c:if>
							<c:if test="${dto.getFran_area()  != 'null㎡'}">
								${dto.getFran_area()}
							</c:if>
						</td>
					</tr>
					<tr>
						<td>신청자 직업</td>
						<td>${dto.getFran_job() }</td>
					</tr>
					<tr>
						<td>추가 의견</td>
						<td>
							<c:if test="${dto.getFran_opinion()  == null}">
								추가 의견 없음 
							</c:if>
							<c:if test="${dto.getFran_opinion() != null}">
								${dto.getFran_opinion()}
							</c:if> 
						</td>
					</tr>
					<tr>
						<td>가맹 문의 날짜</td>
						<td>${dto.getFran_regdate().substring(0,10) }</td>
					</tr>
					<tr>
						<td>신청 상태</td>
						<td>${dto.getFran_status() }</td>
					</tr>
				</tbody>
			</table>
			<br><br><br>
			</c:if>
			<div class="btn_flock">
				 <input type="button" class="btn_list" value="가맹 신청 승인"
	                onclick="location.href='FranchiseUpdate.do?no=${dto.getFran_no() }&page=${page }'">
	             <input type="button" class="btn_list" value = "목록 보기"	                
	                onclick="location.href='AdminFranchise.do?page=${page }'">
	             <input type="button" class="btn_list" value="신청서 삭제"
	                onclick="if(confirm('가맹 신청서를 삭제 하시겠습니까?')) {
	                				location.href='FranchiseDelete.do?no=${dto.getFran_no() }&page=${page }'
	                		 }else {return; }">
	      	</div>
		</div><!-- board_list end -->
	</div><!-- tab_cont end -->
	<jsp:include page="footer.jsp"/>
</body>
</html>