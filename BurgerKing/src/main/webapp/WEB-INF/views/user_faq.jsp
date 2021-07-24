<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link rel="shortcut icon" type="image/x-icon"
	href="resources/img/main/fab.ico">
<!-- <link  href="resources/css/cs/user_faq.css"  rel="stylesheet"  type="text/css"> -->
<link  href="resources/css/cs/user_faq.css"  rel="stylesheet"  type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/cs/user_faq.js" type="text/javascript"></script>
 
</head>
<body>
	<jsp:include page="cs_menu.jsp" />
	${memberSession.getRight()} 
	<div class="faq_category">
		<form method="post" action="faq_home.do">
		<label class="switch01">
			<input type="radio" name="faq_cate" value="all"
				<c:if test="${cate == 'all' }">checked</c:if>>
			<span>전체</span>
		</label>
		<label class="switch01">
			<input type="radio" name="faq_cate" value="product"
				<c:if test="${cate == 'product' }">checked</c:if>>
			<span>제품/품질/서비스</span>
		</label>
		<label class="switch01">
			<input type="radio" name="faq_cate" value="delivery"
				<c:if test="${cate == 'delivery' }">checked</c:if>>
			<span>딜리버리 주문</span>
		</label>
		<label class="switch01">
			<input type="radio" name="faq_cate" value="rental"
				<c:if test="${cate == 'rental' }">checked</c:if>>
			<span>임대/가맹</span>
		</label>
		<label class="switch01">
			<input type="radio" name="faq_cate" value="burgercard"
				<c:if test="${cate == 'burgercard' }">checked</c:if>>
			<span>버거킹카드</span>
		</label>
		<label class="switch01">
			<input type="radio" name="faq_cate" value="etc"
				<c:if test="${cate == 'etc' }">checked</c:if>>
			<span>기타</span>
		</label>
		</form>
	</div>
	<div class="board_list">
		<table class="tlist01 acc_type">
			<colgroup>
				<col style="width: 10%;">
				<col style="width: 20%;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">NO.</th>
					<th scope="col">구분</th>
					<th scope="col">제목</th>			
				</tr>
			</thead>
			<c:set var="list" value="${List }" />
				<c:if test="${!empty list }">
	        	 <c:forEach items="${list }" var="dto">
			<tbody class="acc_body">
				<tr class="acc_tit_tr">
					<td class="WEB">${dto.getFaq_no() }</td>
					<td class="category">
						<span>${dto.getFaq_kind() }</span>
					</td>
					<td>
						<div class="acc_tit">
						<span class="tit">${dto.getFaq_title() }</span>
						<button type="button" class="btn_acc">
							<span>FAQ 내용 보기</span>
						</button>
						</div>
					</td>
				</tr>
				<tr class="acc_cont">
					<td colspan="3">
						<div class="text_area">
						${dto.getFaq_cont() }
						</div>
						<div class="btn_div">
						 <c:if test="${memberSession.getRight() == 'admin1'}">
						<input class="btn_list2 update_btn" type="button" value="수정" onclick="location.href='faq_update.do?category=${cate }&no=${dto.getFaq_no() }&page=${Paging.getPage() }'">
						<input class="btn_list2 del_btn" type="button" value="삭제" onclick="if(confirm('FAQ를 삭제 하시겠습니까?')) {
																							location.href='faq_delete.do?category=${cate }&no=${dto.getFaq_no() }&page=${Paging.getPage() }'
																		}else{return;}"></c:if>
						</div>
					</td>
				</tr>
				 </c:forEach>
	      </c:if>
	      <c:if test="${empty list }">
	      	 <tr>
	            <td colspan="3" align="center">
	               <h3>등록된 FAQ가 없습니다</h3>
	            </td>
	         </tr>
	      </c:if>
			</tbody>
		</table>
		<br><br>
		<%-- 페이징 처리 부분 --%>
	   <div class="text">
	   <c:forEach begin="${Paging.getStartBlock() }"
	       					end="${Paging.getEndBlock() }" var="i">
	      <c:if test="${i == Paging.getPage() }">
	         <%-- <b class="page"><a href="faq_home.do?page=${i }">${i }</a></b> --%>
	         <b class="page"><a href="javascript:paging_faq(${i })">${i }</a></b>
	      </c:if>
	      
	      <c:if test="${i != Paging.getPage() }">
	         <%-- <span class="page"><a href="faq_home.do?page=${i }">${i }</a></span> --%>
	         <span class="page"><a href="javascript:paging_faq(${i })">${i }</a></span>
	      </c:if>
	   </c:forEach>
	   </div>
	   <c:if test="${memberSession.getRight() == 'admin1'}">
	    <input type="button" class="btn_list" value="FAQ작성">
	    </c:if>
	    </div>
	</div>
	<jsp:include page="faq_write.jsp"/>
</body>
</html>