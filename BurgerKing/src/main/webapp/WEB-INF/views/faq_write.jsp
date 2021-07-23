<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="shortcut icon" type="image/x-icon"
	href="resources/img/main/fab.ico">
<link  href="resources/css/cs/faq_write.css"  rel="stylesheet"  type="text/css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>	
<form method="post" action="<%=request.getContextPath() %>/faqWrite.do"  onsubmit="return dataCheck();">
	<div class="faqWritePopWrap m_Fullpopwrap">
	<div class="popbox01 m_bg_basic">
		<div class="M_headerWrap">
			<div class="titleBar">
				<h1 class="page_tit w_alignL">
					<span>FAQ 작성</span>
				</h1>
				<div class="title_btn">						
					<button type="button" class="btn_close">
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
								<option value="제품/품질/서비스,product">제품/품질/서비스</option>
								<option value="딜리버리 주문,delivery">딜리버리 주문</option>
								<option value="임대/가맹,rental">임대/가맹</option>
								<option value="버거킹카드,burgercard">버거킹카드</option>
								<option value="기타,faq_cate">기타</option>
							</select>
						</dd>
					</dl>
				</div>
				<div class="inpbox">
					<input name="faq_title" type="text" placeholder="제목" class="st02">
					<button type="button" class="btn_del01" style="display: none;">
						<span>입력 텍스트 삭제</span>
					</button>
				</div>
				<div class="inpbox">
					<textarea name="faq_cont" id="text_content" rows="9" cols="50" placeholder="FAQ 내용 입력"  maxlength="1000"></textarea>
					<div class="page_count">
						<span>0</span> / <span>1000</span>
					</div>
				</div>
		</div><!-- container02()문의 내용 -->
		</div>
		<div class="pop_btn full_type">
			<button type="submit" class="btn02">
				<span>FAQ 등록하기</span>
			</button>
		</div> 
	</div>
</div><!-- faqWritePopWrap m_Fullpopwrap end -->
</form>
<script src="resources/js/cs/faqWritePopup.js"></script> 