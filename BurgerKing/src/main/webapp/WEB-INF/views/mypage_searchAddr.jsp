<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="resources/css/mypage/mypage_searchAddr.css" type="text/css">

<title>배달지설정</title>
</head>
<body>

	<div class="order_container">
		<div class="order">
			<div class="order_wrapper">
				<div class="my-delivery">
					<dl>
						<dt>딜리버리 주문내역</dt>
						<dd>주문내역이 없습니다.</dd>
					</dl>
				</div>
				
				<div class="my-cart">
					<dl>
						<dt>카트</dt>
						<dd>카트에 담은 상품이 없습니다.</dd>
					</dl>
				</div>
			</div>
		</div>
	</div>
	
	<div class="loc_container">
		<div class="loc">
			<div class="page-navi">
				<a><span>딜리버리</span></a>
				<a><span>MY킹</span></a>
			</div>
			
			<div class="location">
				<span class="addr">
					<span>배달지를 선택하세요</span>
				</span>
				<span class="btn">
					<a href="mypage_searchAddr.do"><span>변경</span></a>
				</span>
			</div>
		</div>
	</div>
	
	<div class="search_box">
		<div class="search_container">
			<div class="search_title">
				<h2>배달지 검색</h2>
			</div>
			
			<div class="search_wrap">
				<div class="search">
					<div class="search_inp">
						<input type="text" maxlength="50"
							placeholder="'주소찾기'를 선택해주세요.">
					</div>
					
					<button class="search_btn" type="button">
						<span>주소찾기</span>
					</button>
				</div>
			</div>
		</div>
	</div>

	<div class="contents_box">
		<div class="contents_container">
			<div class="contents_wrap">
				<div class="tab_tit">
					<ul>
						<li class="on">
							<button type="button">
								<span>최근 배달지</span>
							</button>
						</li>
						<li>
							<button type="button">
								<span>MY배달지</span>
							</button>
						</li>
					</ul>
				</div>
				<div class="tab_cont"></div>
				<div class="tab_cont"></div>
			</div>
		</div>
	</div>
	
</body>
</html>