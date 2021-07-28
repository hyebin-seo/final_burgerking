<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버거킹</title>
<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/public/favicon.ico">
<link href="resources/css/public/header.css"  rel="stylesheet"  type="text/css">
<script type="text/javascript">

$(document).ready(function () {
	
	var windowWidth = $(window).width();
	
	//창크기 변화 감지
	$(window).resize(function() {
		windowWidth = $(window).width();
	});
	
	$(".GNBWrap ul").mouseover(function(){
		if(windowWidth > 768)
			$(".head_menuWrap").addClass("GNB_open");
	});
	
	$(".GNBWrap ul").mouseleave(function(){
		if(windowWidth > 768)
			$(".head_menuWrap").removeClass("GNB_open");
	});
	
	$(".btn_head_menu").click(function() {
		$(".headerWrap").addClass("side_open");
	});
	
	$(".btn_head_close").click(function() {
		$(".headerWrap").removeClass("side_open");
	});
	
	$(".GNBWrap li").click(function() {
		$(this).toggleClass("menu_open");
	});
});

function goDelivery() {
	location.href="delivery_home.do";
}
</script>

<!-- pc -->
<div id="app">
<div class="subWrap01">

<div class="headerWrap">
    <div class="head_menuWrap">
        <div class="web_container">
        	<a href="/burger/" class="router-link-exact-active router-link-active">
                <h1 class="WEB logo">버거킹 Logo</h1>
            </a>
            
            <div class="MOB m_utilWrap">
                <div class="m_top">
                	<button class="btn_head_close"><span>Menu Close</span></button>
                </div>
            </div>
            <div class="GNBWrap">
                <ul>
                    <li class=""><button type="button"><span>메뉴소개</span></button>
                        <ul class="submenu">
                            <li><a href="menu_brand.do?category=스페셜%26할인팩"><span>스페셜&amp;할인팩</span></a></li>
                            <li><a href="menu_brand.do?category=프리미엄"><span>프리미엄</span></a></li>
                            <li><a href="menu_brand.do?category=와퍼"><span>와퍼</span></a></li>
                            <li><a href="menu_brand.do?category=주니어%26버거"><span>주니어&amp;버거</span></a></li>
                            <li><a href="menu_brand.do?category=올데이킹%26치킨버거"><span>올데이킹&amp;치킨버거</span></a></li>
                            <li><a href="menu_brand.do?category=사이드"><span>사이드</span></a></li>
                            <li><a href="menu_brand.do?category=음료%26디저트"><span>음료&amp;디저트</span></a></li>
                        </ul>
                    </li>
                    <li class=""><button type="button"><span>매장소개</span></button>
                        <ul class="submenu">
                            <li><a href="store.do"><span>매장찾기</span></a></li>
                        </ul>
                    </li>
                    <li class=""><button type="button"><span>이벤트</span></button>
                        <ul class="submenu">
                            <li><a href="event_list.do"><span>이벤트</span></a></li>
                            <li class="MOB"><a><span>신규매장</span></a></li>
                        </ul>
                    </li>
                    <li class=""><button type="button"><span>브랜드스토리</span></button>
                        <ul class="submenu">
                            <li><a href="brandStory.do"><span>버거킹 스토리</span></a></li>
                            <li><a href="whyBurgerking.do"><span>WHY 버거킹</span></a></li>
                            <li><a href="burgerkingNews.do"><span>버거킹 NEWS</span></a></li>
                        </ul>
                    </li>
                    <li class="MOB"><button type="button"><span>고객센터</span></button>
                        <ul class="submenu">
                            <li><a href="notice_list.do"><span>공지사항</span></a></li>
                            <li><a href="faq_home.do?faq_cate=all"><span>FAQ</span></a></li>
                            <li><a href="qna.do"><span>문의</span></a></li>
                            <li><a href="Franchise.do"><span>가맹점모집</span></a></li>
                        </ul>
                    </li>
                </ul>
                
                <button type="button" class="btn_order" onclick="goDelivery()"><strong>딜리버리주문</strong></button>
            </div> 
        </div>
    </div>
</div>

<!-- 모바일 -->
<div class="MOB M_headerWrap">
	<div class="web_container">
		<div class="titleBar noborder">
			<a href="/burger/" class="router-link-exact-active router-link-active">
				<h2 class="page_tit logo">Burger King</h2>
			</a>
			<div class="title_btn">
				<button type="button" class="btn_head_menu">
					<span>All Menu</span>
				</button>
			</div>
			<div class="title_btn right">
				<button type="button" class="btn_order" onclick="goDelivery()">
					<strong>딜리버리주문</strong>
				</button>
			</div>
		</div>
	</div>
</div>

