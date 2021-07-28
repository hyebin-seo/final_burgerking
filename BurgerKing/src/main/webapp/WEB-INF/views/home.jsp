		<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버거킹</title>
</head>
<!-- jsp:header -->
<jsp:include page="header.jsp" />
<link href="resources/css/user/Main.css" rel="stylesheet" type="text/css">
<body>

	<!-- 본문 시작  -->
	<section class="allPage">
		<!-- 이벤트 배너판. 이벤트에 있는 페이지와 연동되어야 합니다. -->
		<div class="slideshow-container">

            <div class="mySlideDiv fade active">
              <img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/banner/93220396-6c46-49d6-bdc2-21cbba672fd7.png" class="WEB"
              onclick="location.href='event_cont.do?no=12&page=2'"> 
              <img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/banner/d80321c3-4f7c-44e7-ae47-3827821dd95a.png" class="MOB"  
             onclick="location.href='event_cont.do?no=12&page=2'"> 
              
            </div>
            
            <div class="mySlideDiv fade">
              <img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/banner/c2ee3f34-bb55-4697-91fd-e79a52dc6281.png" class="WEB"
             onclick="location.href='event_cont.do?no=13&page=1'">
              <img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/banner/a1642a33-d1b1-401b-9e18-c798cc11e0f2.png" class="MOB"
               onclick="location.href='event_cont.do?no=13&page=1'">
              
            </div>
            
            <div class="mySlideDiv fade">
            	<img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/banner/a42dc617-eaff-48a6-aea5-a8436028e8b0.png" class="WEB"
            	onclick="location.href='event_cont.do?no=18&page=1'">
            	<img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/banner/e5539963-0986-4d03-8e31-65aab447f612.png" class="MOB"
            	onclick="location.href='event_cont.do?no=18&page=1'">
            </div>
            
            <div class="mySlideDiv fade">
            	<img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/banner/1ebf501d-b884-4218-9cda-de9e8776f8db.png" class="WEB"
            	onclick="location.href='event_cont.do?no=15&page=1'">
            	<img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/banner/03bb9cd7-4dcd-4344-87ed-3938cbe64919.png" class="MOB"
            	onclick="location.href='event_cont.do?no=15&page=1'">
            </div>
                        
            <div class="mySlideDiv fade">
              <img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/banner/30182210-6be6-4548-8838-2a964788d0d8.png" class="WEB">
              <img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/banner/09ce385b-a2dc-4a16-a0c6-075ed7723254.png" class="MOB">
            </div>
            
            <div class="mySlideDiv fade">
            	<img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/banner/371731a2-3fcb-42dc-bc6b-92cb16cbd6c9.png" class="WEB"
            	onclick="location.href='event_cont.do?no=21&page=1'">
            	<img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/banner/d9c47234-88c6-4e53-864c-83208636eb7e.png" class="MOB"
            	onclick="location.href='event_cont.do?no=21&page=1'">
            </div>
            
            <div class="mySlideDiv fade">
            	<img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/banner/7f123731-b504-47c0-989d-1534b302046b.png" class="WEB"
            	onclick="location.href='event_cont.do?no=22&page=1'" >
            	<img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/banner/04d287cf-fd1c-44f5-95fd-d4bde8a04451.png" class="MOB"
            	onclick="location.href='event_cont.do?no=22&page=1'">
            </div>
            
            
           <a class="prev" onclick="prevSlide()">&#10094;</a>
           <a class="next" onclick="nextSlide()">&#10095;</a>
            
       </div>
           
		<!-- 이벤트 배너판 end. -->


		<!-- youtube video 임베디드 -->
		<div id="carouselExampleControls" class="carousel slide"
			data-bs-ride="carousel" data-bs-interval="false">
			<div class="carousel-inner" style="text-align: center">
				<div class="carousel-item active">
					<iframe width="100%" height="600"
						src="https://www.youtube.com/embed/MbqUVZcpIac" frameborder="0"
						allow="autoplay; encrypted-media" allowfullscreen></iframe>
				</div>
			</div>
		</div>
		<!-- youtube video 임베디드 end -->

		<!-- SNS 이동   -->
		<div class="contentsBox01 home_snsWrap">
			<div class="web_container">
				<ul class="list">
					<li class="youtube"><div class="cont">
							<strong class="tit">YOUTUBE</strong><strong class="status">구독2.3만</strong><a
								href="https://www.youtube.com/channel/UCEKRI0fipK4LEgV98nI2CQA/featured"
								target="_blank" class="btn_detail"><span>Details</span></a>
						</div></li>
					<li class="facebook"><div class="cont">
							<strong class="tit">FACEBOOK</strong><strong class="status">좋아요
								51.8만</strong><a href="https://www.facebook.com/burgerkingkorea"
								target="_blank" class="btn_detail"><span>Details</span></a>
						</div></li>
					<li class="insta"><div class="cont">
							<strong class="tit">INSTAGRAM</strong><strong class="status">팔로워
								413.0K</strong><a href="https://www.instagram.com/burgerkingkorea"
								target="_blank" class="btn_detail"><span>Details</span></a>
						</div></li>
				</ul>
			</div>
		</div>
		<!-- SNS 이동 끝  -->

		<!--app 및 딜리버리 시작 -->

		<div class="app_delivery">
			<div class="app">
				<a href="#"><img alt="app이미지" src="resources/img/main/app.png">
				</a>
			</div>
			<div class="delivery">
				<a href="#"><img alt="app이미지"
					src="resources/img/main/delivery_app.png"> </a>
			</div>
		</div>
		<!--app 및 딜리버리 끝 -->

		<!-- 매장찾기 -->
		<div class="contentsBox01 home_searchshop">
			<div class="web_container">
				<h2 class="titl">매장찾기</h2>
				<p>고객님 주변에 있는 버거킹을 찾아보세요!</p>
				<div class="c_btn">
					<a class="btn01 s red" href="store.do"><span>매장찾기</span></a>
				</div>
				<ul class="shop_categorylist">
					<li class="category_delivery"><span class="WEB">집에서
							편안하게 <br>받을 수 있는
					</span><em>딜리버리</em></li>
					<li class="category_king"><span class="WEB">미리 주문하고 <br>픽업가능한
					</span><em>킹오더 </em></li>
					<li class="category_drive"><span class="WEB">차안에서 빠르게 <br>이용할
							수 있는
					</span><em>드라이브 스루</em></li>
					<li class="category_24"><span class="WEB">24시간 언제든 <br>함께할
							수 있는
					</span><em>24시간</em></li>
					<li class="category_morning"><span class="WEB">든든한 <br>아침을
							도와줄
					</span><em>아침메뉴</em></li>
					<li class="category_parking"><span class="WEB">내 차와 함께
							<br>올 수 있는
					</span><em>주차공간</em></li>
				</ul>
			</div>
		</div>

		<!-- 버거킹 대표번호 나오는 부분 -->
		<div class="phone">
			<img src="resources/img/main/1599.png" class="WEB">
			<img src="resources/img/main/1599_mob.JPG" class="MOB">
		</div>
		<!-- 버거킹 대표번호 나오는 부분  끝(이미지처리)-->

	</section>
	<!-- 본문  -->
    	
      
	<!-- foote(sitemap) 시작 -->
	 <div class="WEB sitemap web_max">
            <div class="web_container">
                <ul class="menu">
                    <li><a><span>메뉴</span></a>
                        <ul class="submenu">
                        	<li><a href="menu_brand.do?category=스페셜%26할인팩"><span>스페셜&amp;할인팩</span></a></li>
                            <li><a href="menu_brand.do?category=프리미엄"><span>프리미엄</span></a></li>
                            <li><a href="menu_brand.do?category=와퍼"><span>와퍼</span></a></li>
                            <li><a href="menu_brand.do?category=주니어%26버거"><span>주니어&amp;버거</span></a></li>
                            <li><a href="menu_brand.do?category=올데이킹%26치킨버거"><span>올데이킹&amp;치킨버거</span></a></li>
                            <li><a href="menu_brand.do?category=사이드"><span>사이드</span></a></li>
                            <li><a href="menu_brand.do?category=음료%26디저트"><span>음료&amp;디저트</span></a></li>
                        </ul></li>
                    <li><a><span>매장</span></a>
                        <ul class="submenu">
                            <li><a href="store.do"><span>매장찾기</span></a></li>
                        </ul></li>
                    <li><a><span>이벤트</span></a>
                        <ul class="submenu">
                            <li><a href="event_list.do"><span>이벤트</span></a></li>
                        </ul></li>
                    <li><a><span>브랜드 스토리</span></a>
                        <ul class="submenu">
                            <li><a href="brandStory.do"><span>버거킹 스토리</span></a></li>
                            <li><a href="whyBurgerking.do"><span>WHY 버거킹</span></a></li>
                            <li><a href="burgerkingNews.do"><span>버거킹 News</span></a></li>
                        </ul></li>
                    <li><a><span>고객센터</span></a>
                        <ul class="submenu">
                            <li><a href="notice_list.do"><span>공지사항</span></a></li>
                            <li><a href="faq_home.do?faq_cate=all"><span>FAQ</span></a></li>
                            <li><a href="Qna.do"><span>문의</span></a></li>
                            <li><a href="Franchise.do"><span>가맹점모집</span></a></li>
                        </ul></li>
                </ul>
            </div>
        </div>
	<!-- foote 끝 -->
      <jsp:include page="footer.jsp" />
      
<script type="text/javascript">

$(document).ready(function () {
	$(".mySlideDiv").not(".active").hide();
	
	setInterval(nextSlide, 4000);
});

function prevSlide() {
	$(".mySlideDiv").hide();
	var allSlide = $(".mySlideDiv");
	var currentIndex = 0;
	
	$(".mySlideDiv").each(function(index,item){
		if($(this).hasClass("active")) {
			currentIndex = index;
		}
        
    });
	
	var newIndex = 0;
	
	if(currentIndex <= 0) {
		newIndex = allSlide.length-1;
	} else {
		newIndex = currentIndex-1;
	}
	
	console.log("currentIndex:"+currentIndex);
	console.log("newIndex:"+newIndex);
	
	$(".mySlideDiv").removeClass("active");
	$(".mySlideDiv").eq(newIndex).addClass("active");
	$(".mySlideDiv").eq(newIndex).show();
	
}

function nextSlide() {
	$(".mySlideDiv").hide();
	var allSlide = $(".mySlideDiv");
	var currentIndex = 0;
	
	$(".mySlideDiv").each(function(index,item){
		if($(this).hasClass("active")) {
			currentIndex = index;
		}
        
    });
	
	var newIndex = 0;
	
	if(currentIndex >= allSlide.length-1) {
		newIndex = 0;
	} else {
		newIndex = currentIndex+1;
	}
	
	console.log("currentIndex:"+currentIndex);
	console.log("newIndex:"+newIndex);
	
	$(".mySlideDiv").removeClass("active");
	$(".mySlideDiv").eq(newIndex).addClass("active");
	$(".mySlideDiv").eq(newIndex).show();
	
}

</script>
</body>
<!-- jsp:footer -->

</html>
