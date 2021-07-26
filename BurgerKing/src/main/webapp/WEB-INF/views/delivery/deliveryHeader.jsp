<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/img/public/favicon.ico">
<link rel="icon" href="resources/img/public/favicon.ico">
<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- 아이콘 CDN 링크 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
<!-- 글꼴 CDN 링크 -->
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="resources/css/delivery/deliveryHeader.css"  rel="stylesheet"  type="text/css">

<input type="hidden" id="head_delivery_addr" value="${addrSession.store_name }">

<div class="addrPopWrap">
	<div class="popbox01">
		<button type="button" class="btn_close" style="z-index: 100;" onclick="addrWrapHide();"></button>
		<div class="popcont pd02">
			<dl class="addr_chk">
				<dt>배달지 주소</dt>
				<dd>
					<strong><span> 선택된 주소가 없습니다 </span></strong>
				</dd>
			</dl>
			<p class="txt02">배달받을 주소를 검색해보세요!</p>
		</div>
		<div class="pop_btn c_btn item2">
			<a class="addrbtn m_btn01_s dark" href="javascript:addrWrapHide();"><span>취소</span></a>
			<a class="addrbtn m_btn01_s red" href="location.do"><span>배달지 검색</span></a>
		</div>
	</div>
</div>

<div class="headerWrap">
    <div class="head_menuWrap ">
        <div class="web_container">
            <h1 class="WEB logo">
             <a href="delivery_home.do">
            	<span>딜리버리</span>
             </a>
            </h1>
            <div class="WEB utilWrap">
            	<a href="/burger/"><span>브랜드홈</span></a>
            	<c:if test="${!empty memberSession }">
		        	<a href="logout.do"><span>로그아웃</span></a>
		        </c:if>
            	<a href="mypage_main.do"><span>MY킹</span></a>
            	<c:if test="${empty memberSession }">
		        	<a href="Login.do"><span>로그인</span></a>
		        </c:if>
            	<a href="notice_list.do"><span>고객센터</span></a></div>
            <div class="MOB m_utilWrap">
                <div class="m_top">
                	<button class="btn_head_close ham_close" >
                		<span>Menu Close</span>
                	</button>
                	<button class="btn_brandhome" onclick="location.href='/burger/'">
                		<span>브랜드 홈</span>
                	</button>
                </div>
                <c:if test="${!empty memberSession }">
	                <div class="util_logon">
	                    <div class="user">
	                        <p><strong><span> ${memberSession.user_name}</span></strong>님 안녕하세요</p>
	                    </div>
	                </div>
                </c:if>
                <c:if test="${empty memberSession }">
	                <div class="util_logoff">
	                    <p><strong>WHERE TASTE IS KING</strong><br>버거킹과 함께하는 맛있는 세계!</p>
	                    <div class="btn_area">
	                    	<a class="btn04" href="move_join.do"><span>회원가입</span></a>
	                    	<a class="btn04" href="Login.do"><span>로그인</span></a>
	                    </div>
	                </div>
                </c:if>
            </div>
            <c:if test="${!empty memberSession }">
	            <div class="WEB on_cont user">
	                <p><span>${memberSession.user_name}</span> 님 안녕하세요</p>
	                <a href="mypage_main.do"><strong>MY킹 바로가기</strong></a>
	            </div>
            </c:if>
            <c:if test="${empty memberSession }">
	            <div class="WEB off_cont join">
	            	<a class="btn_join" href="move_join.do"><strong>회원가입</strong></a>
	            </div>
            </c:if>
            <div class="MOB GNBWrap">
                <ul>
                    <li class="">
                    	<button type="button">
                    		<span>MY킹</span>
                    	</button>
                        <ul class="submenu">
                            <li><a href="myStamp.do"><span>스탬프</span></a></li>
                            <li><a href="myCoupon.do"><span>딜리버리 쿠폰</span></a></li>
                            <li><a href="myLocation.do"><span>MY배달지</span></a></li>
                        </ul>
                    </li>
                    <li>
                    	<button type="button" onclick="location.href='orderList.do'">
                    		<span>주문내역</span>
                    	</button>
                    </li>
                    <li class="">
                    	<button type="button">
                    		<span>고객센터</span>
                    	</button>
                        <ul class="submenu">
                            <li><a href="notice_list.do"><span>공지사항</span></a></li>
                            <li><a href="faq_home.do?faq_cate=all"><span>FAQ</span></a></li>
                            <li><a href="Qna.do"><span>문의</span></a></li>
                            <li><a href="Franchise.do"><span>가맹점모집</span></a></li>
                        </ul>
                    </li>
                </ul>
                <button type="button" class="btn_logout on_cont" onclick="location.href='logout.do'">
                	<span>로그아웃</span>
                </button>
            </div>
        </div>
    </div>
</div>
<div class="MOB M_headerWrap">
    <div class="web_container">
        <div class="MOB titleBar st02">
            <h1 class="page_tit logo_type">
            	<a href="delivery_home.do"><span>딜리버리</span></a>
            </h1>
            <div class="title_btn1">
            	<button type="button" class="btn_head_menu">
            		<span>All Menu</span>
            	</button>
            </div>
            <div class="title_btn1 right">
            	<button type="button" class="btn_head_cart" onclick="location.href='cart.do'">
            		<span>카트</span>
            	</button>
            </div>
        </div>
    </div>
</div>
<script src="resources/js/delivery/deliveryHeader.js"></script>





