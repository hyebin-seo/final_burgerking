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
	<jsp:include page="header.jsp"/>
	<div class="tab_cont">
		<h4 class="hide">김지선님의 신청 상세 내역</h4><br><br>
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
						<td>1</td>
					</tr>
					<tr>
						<td>신청자 이름</td>
						<td>김지선</td>
					</tr>
					<tr>
						<td>신청자 생년월일</td>
						<td>1999-01-01</td>
					</tr>
					<tr>
						<td>신청자 전화번호</td>
						<td>010-1234-2345</td>
					</tr>
					<tr>
						<td>가맹신청 지역</td>
						<td>인천시 남동구</td>
					</tr>
					<tr>
						<td>임대차 보유 유무</td>
						<td>Y</td>
					</tr>
					<tr>
						<td>신청자 직업</td>
						<td>백수</td>
					</tr>
					<tr>
						<td>추가 의견</td>
						<td>의견 따로 없습니다.의견 따로 없습니다.의견 따로 없습니다.의견 따로 없습니다.의견 따로 없습니다.의견 따로 없습니다.의견 따로 없습니다.의견 따로 없습니다.의견 따로 없습니다.의견 따로 없습니다.의견 따로 없습니다.의견 따로 없습니다.의견 따로 없습니다.의견 따로 없습니다.의견 따로 없습니다.의견 따로 없습니다.의견 따로 없습니다.의견 따로 없습니다.의견 따로 없습니다.의견 따로 없습니다.의견 따로 없습니다.의견 따로 없습니다.의견 따로 없습니다.v</td>
					</tr>
					<tr>
						<td>가맹 문의 날짜</td>
						<td>2021-03-21</td>
					</tr>
					<tr>
						<td>신청 상태</td>
						<td>접수 완료</td>
					</tr>
				</tbody>
			</table>
			<br><br><br>
			
	      </div>
		</div><!-- board_list end -->
	</div><!-- tab_cont end -->
	<jsp:include page="footer.jsp"/>
</body>
</html>