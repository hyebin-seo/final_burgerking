<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/menu/menu_popup.css"  rel="stylesheet"  type="text/css">

</head>
<body>

	<!-- 딜리버리 메뉴에서 세트 있는 메뉴 클릭시 팝업 -->
	<div class="popWrap m_FullpopWrap">
		<div class="popbox01 nobtn">
			<div class="M_headerWrap">
				<div class="titleBar">
					<h1 class="page_tit w_alignL">
						<span>메뉴 선택</span>
					</h1>
					<div class="title_btn">
						<button type="button" class="btn_close btn_head_close">
							<span>Close</span>
						</button>
					</div>
				</div>
			</div>
			<div class="popcont nopadding">
				<div class="prd_intro">
					<div class="prd_img">
						<em class="prd_img"></em>
						<span>
							이미지
						</span>
					</div>
					<div class="intro_txt">
						<h3 class="tit">
							<span>메뉴이름</span>
						</h3>
						<p class="subtxt">
							<span>멘트</span>
						</p>
					</div>
				</div>
				<ul class="menu_sub_list02">
					<!-- 세트메뉴 수만큼 for문으로 li 생성 -->
					<li>
						<div class="prd_img">
							<em class></em>
							<span>이미지1</span>
						</div>
						<div class="cont">
							<p class="tit">
								<strong>세트이름1</strong>
							</p>
							<p class="set">
								<span>구성</span>
							</p>
							<p class="price">
								<strong>
									<em>
										<span>가격</span>
									</em>
								</strong>
							</p>
						</div>
						<button type="button" class="btn_detail">
							<span>Details</span>
						</button>
					</li>
				</ul>
			</div>
		</div>
	</div>

<!-- <script src="resources/js/menu/menu_popup.js"></script> -->

</body>
</html>