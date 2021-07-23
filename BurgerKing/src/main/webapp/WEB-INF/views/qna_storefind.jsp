<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link  href="resources/css/cs/qna_storefind.css"  rel="stylesheet"  type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<title>문의</title>
</head>
<body>
<div class="contentsWrap eventWrap">
	<div class="qnaStorepopWrap m_FullpopWrap">
		<div class="popbox01 m_bg_basic">
			<div class="M_headerWrap">
				<div class="titleBar">
					<h1 class="page_tit w_alignL">
						<span>매장검색</span>
					</h1>
					<div class="title_btn">	
						<button type="button" class="btn_close storefindclose">
							<span>Close</span>
						</button>
					</div>
				</div><!-- titleBar end -->
			</div><!-- M_headerWrap -->
			<div class="popcont nopadding">
				<div class="map_searchWrap">
					<div class="map_search_head">
						<div class="searchWrap">
							<div class="container01">
								<div class="r_srch01 st02">
									<div class="inpbox">
										<input type="text" class="searchName">
										<button type="button" class="btn_del01">
											<span>입력 텍스트 삭제</span>
										</button>
									</div><!-- inpbox end  -->
									<button type="button" class="btn_search02">
										<span>Search</span>
									</button>
								</div><!-- r_srch01 st02 end -->
							</div><!-- container01 end -->
						</div><!-- searchWrap end -->
					</div><!-- map_search_head end -->
					<div class="container01 search_result">
						<div class="tit_result">
							<p>
								<em>
									<span>0</span>
									개
								</em>
								의 검색 결과가 있습니다
							</p>
						</div><!-- tit_result end -->
						<!-- <ul class="list02">
							   <li>
								<div class="shop_detail02">
									<p class="tit">
										<strong>신정네거리역점</strong>
										<em class="km">
											<span></span>
										</em>
									</p>
									<div class="subinfo">
										<p class="addr">
											<span>서울특별시 양천구 중앙로 275</span>
										</p>
										<p>
											<span>070-7438-6521</span>
										</p>
									</div>subinfo end
									<ul class="shoptype_list ico_type">
										<li>
											<span class="shop_type delivery">
												딜리버리
											</span>
										</li>
										<li>
											<span class="shop_type king">
												킹오더
											</span>
										</li>
										<li style="">
											<span class="shop_type allday">
												24시간매장
											</span>
										</li>
										<li>
											<span class="shop_type morning">
												아침메뉴
											</span>
										</li>
										<li>
											<span class="shop_type parking">
												주차가능
											</span>
										</li>
										<li>
											<span class="shop_type drive">
												드라이브스루
											</span>
										</li>   
									</ul>shoptype_list ico_type end
								</div>shop_detail02 end
								<a class="btn_detail">
									<span>Details</span>
								</a>
							</li>
						</ul> -->
					</div><!-- container01 search_result end -->
				</div><!--map_searchWrap end -->
				<div class="pop_btn full_type">
					<button type="button" class="btn02">
						<span>확인</span>
					</button>
				</div><!-- pop_btn full_type end -->
			</div><!-- popcont nopadding end -->
		</div><!-- popbox01 m_bg_basic -->
	</div><!-- qnaStorepopWrap m_FullpopWrap end -->
</div><!-- 잠깐 넣었음 css때문에 -->
<script src="resources/js/cs/qna_storefind.js"></script>
</body>
