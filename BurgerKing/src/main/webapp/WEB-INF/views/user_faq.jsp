<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link  href="resources/css/cs/user_faq.css"  rel="stylesheet"  type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="resources/js/cs/user_faq.js" type="text/javascript">
<script type="text/javascript">
$( document ).ready( function() {
    $( '.btn_acc' ).click( function() {
      $('.btn_acc').addClass("on");
      $( '.text_area' ).toggle();
    } );
  } );

</script>
</head>
<body>
	<div class="faq_category">
		<label class="switch01">
			<input type="radio" name="faq_kind" checked="checked">
			<span>전체</span>
		</label>
		<label class="switch01">
			<input type="radio" name="faq_kind">
			<span>제품/품질/서비스</span>
		</label>
		<label class="switch01">
			<input type="radio" name="faq_kind">
			<span>딜리버리 주문</span>
		</label>
		<label class="switch01">
			<input type="radio" name="faq_kind">
			<span>임대/가맹</span>
		</label>
		<label class="switch01">
			<input type="radio" name="faq_kind">
			<span>버거킹카드</span>
		</label>
		<label class="switch01">
			<input type="radio" name="faq_kind">
			<span>기타</span>
		</label>
	</div>
	<div class="faq_list">
		<table class="flist01 acc_type">
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
			<tbody>
				<tr class="acc_tit_tr">
					<td class="no">1</td>
					<td class="kind">
						<span>딜리버리 주문</span>
					</td>
					<td>
						<div class="acc_tit">
						<span class="tit">대량주문에 대한 제한이 있는지요?</span>
						<button type="button" class="btn_acc">
							<span>FAQ 내용 보기</span>
						</button>
						</div>
					</td>
				</tr>
				<tr class="acc_cont">
					<td colspan="3">
						<div class="text_area">
						대량주문의 경우 매장 상황을 파악한 후 버거킹 딜리버리 콜센터에서 확인전화를 드리며 
						확인 전화가 완료되어야 주문이 접수됩니다. 
						원재료 및 제품의 생산시간을 고려하여 가능 여부를 안내해드립니다.
						</div>
					</td>
				</tr>
				<tr class="acc_tit_tr">
					<td class="no">2</td>
					<td class="kind">
						<span>딜리버리 주문</span>
					</td>
					<td>
						<div class="acc_tit">
						<span class="tit">대량주문에 대한 제한이 있는지요?</span>
						<button type="button" class="btn_acc">
							<span>FAQ 내용 보기</span>
						</button>
						</div>
					</td>
				</tr>
				<tr class="acc_cont">
					<td colspan="3">
						<div class="text_area">
						대량주문의 경우 매장 상황을 파악한 후 버거킹 딜리버리 콜센터에서 확인전화를 드리며 
						확인 전화가 완료되어야 주문이 접수됩니다. 
						원재료 및 제품의 생산시간을 고려하여 가능 여부를 안내해드립니다.
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>