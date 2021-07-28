<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ수정</title>
<link  href="resources/css/cs/faq_updateForm.css"  rel="stylesheet"  type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/cs/faq_updateForm.js" type="text/javascript"></script>
</head>
<form method="post" action="<%=request.getContextPath() %>/faq_updateOk.do">
	<c:set var="dto" value="${faqUpdate }" />
	<input type="hidden" name="faq_no" value="${dto.getFaq_no() }">   
	<input type="hidden" name="faq_cate" value="${dto.getFaq_cate() }">   
	<input type="hidden" name="category" value="${category }">   
	<input type="hidden" name="page" value="${page }">	
	<div class="faqWritePopWrap m_Fullpopwrap">
	<div class="popbox01 m_bg_basic">
		<div class="M_headerWrap">
			<div class="titleBar">
				<h1 class="page_tit w_alignL">
					<span>FAQ 수정</span>
				</h1>
				<div class="title_btn">						
					<button type="button" class="btn_close" onclick="location.href='faq_home.do?faq_cate=all'">
					<span>Close</span>
					</button>
				</div>
			</div><!-- titleBar end -->
		</div><!-- M_headerWrap -->
		<div class="popcont">
			<div class="container02">
				<div class="dlist01 st03">
					<dl>
						<dt class="f_normal">FAQ종류</dt>
						<dd>
							<select class="st03" name="faq_kind">
								<option value="${dto.getFaq_kind() }">${dto.getFaq_kind() }</option>
							</select>
						</dd>
					</dl>
				</div>
				<div class="inpbox">
					<input name="faq_title" type="text" placeholder="제목" class="st02" value="${dto.getFaq_title() }">
					<button type="button" class="btn_del01" style="display: none;">
						<span>입력 텍스트 삭제</span>
					</button>
				</div>
				<div class="inpbox">
					<textarea name="faq_cont" id="text_content" rows="9" cols="50" placeholder="FAQ 내용 입력"  maxlength="1000">${dto.getFaq_cont() }</textarea>
					<div class="page_count">
						<span>0</span> / <span>1000</span>
					</div>
				</div>
		</div><!-- container02()문의 내용 -->
		</div>
		<div class="pop_btn full_type">
			<button type="submit" class="btn02">
				<span>FAQ 수정하기</span>
			</button>
		</div> 
	</div>
</div><!-- faqWritePopWrap m_Fullpopwrap end -->
</form>
</html>