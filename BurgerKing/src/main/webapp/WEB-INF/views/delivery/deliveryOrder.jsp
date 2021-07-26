<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>
</head>
<jsp:include page="deliveryHeader.jsp" flush="true"/>
<jsp:include page="deliveryCart.jsp"/>
<link href="resources/css/delivery/deliveryOrder.css"  rel="stylesheet"  type="text/css">
<body>
<div class="loc_container">
	<div class="loc">
		<div class="page-navi">
			<a href="delivery_home.do"><span>딜리버리</span></a>
			<a><span>주문하기</span></a>
		</div>
		
		<div class="location">
			<span class="addr">
			   <c:if test="${empty addrSession }">
				<span>배달지를 선택하세요</span>
			   </c:if>
			   <c:if test="${!empty addrSession }">
				<span>${delivery_addr }</span>
			   </c:if>
			</span>
			<span class="shop">
			   <c:if test="${empty addrSession }">
				<span>지점</span>
			   </c:if>
			   <c:if test="${!empty addrSession }">
				<span>${addrSession.store_name }</span>
			   </c:if>
			</span>
			<span class="btn">
				<a href="javascript:locationModify();">
					<span>변경</span>
				</a>
			</span>
		</div>
	</div>
</div>
<div class="contentsBox01">
    <div class="web_container">
        <div class="subtitWrap m_bg_basic">
            <h2 class="page_tit">주문하기</h2>
        </div>
        <form name="orderForm" method="post" action="delivery_order_ok.do">
        <div class="container01 orderWrap">
            <h2 class="tit01 tit_ico delivery"><span>배달정보</span></h2>
            <div class="container02 deli_info01">
                <div class="addrWrap01">
                    <p class="txt_addr">
                    	<span>${delivery_addr }</span>
                    	<span></span>
                    </p>
                </div>
                <div class="info_list">
                    <dl>
                        <dt>연락처</dt>
                        <dd><input type="text" maxlength="20" value="${memberSession.user_phone}"></dd>
                    </dl>
                    <dl>
                        <dt>매장</dt>
                        <dd><input type="text" readonly="readonly" value="${addrSession.store_name }"></dd>
                    </dl>
                    <dl class="memo">
                        <dt>요청사항</dt>
                        <dd>
                            <div class="inp_bytes">
                                <div><input type="text" name="order_claim" class="claim" placeholder="요청사항을 입력하세요" maxlength="50"></div>
                                <div class="txt_byte"><span>0</span>/<span>50</span></div>
                            </div>
                        </dd>
                    </dl>
                </div>
            </div>
            <div class="tit01 tit_ico burger tit_ordermenu">
                <h2><span>주문정보</span></h2>
            </div>
            <div class="container02 order_accWrap open">
            	<input type="hidden" name="order_price" class="order_price" value="">
            	<input type="hidden" name="pay_price" class="pay_price" value="">
            	<input type="hidden" name="pay_way" class="pay_way"  value="">
            	<input type="hidden" name="pay_coupon" class="pay_coupon"  value="no">
                <ul class="cart_list01 order_list">
                  <c:forEach items="${menulist }" var="menu" varStatus="s">
                  	<input type="hidden" name="menuList[${s.index }].menu_no" value="${menu.menu_no }">
                  	<input type="hidden" name="menuList[${s.index }].menu_name" value="${menu.menu_name }">
                  	<input type="hidden" name="menuList[${s.index }].menu_price" value="${menu.menu_price }">
                  	<input type="hidden" name="menuList[${s.index }].menu_info" value="${menu.menu_info }">
                  	<input type="hidden" name="menuList[${s.index }].menu_mount" value="${menu.menu_mount }">
                  	<input type="hidden" name="menuList[${s.index }].detailStr" value="${menu.detailStr }">
                  	<input type="hidden" name="menuList[${s.index }].side" value="${menu.side }">
                  	<input type="hidden" name="menuList[${s.index }].drink" value="${menu.drink }">
                  	<input type="hidden" name="menuList[${s.index }].cart_no" value="${menu.cart_no }">
                  	<input type="hidden" name="menuList[${s.index }].menu_img" value="${menu.menu_img }">
                    <li>
                      <div class="cont">
                  		<p class="tit">
                  			<strong>${menu.menu_name }</strong>
                  		</p>
                  		<p class="menu_info">
                  			${menu.menu_info }
                  		</p>
                  		<p class="menu_info">
                  			<span class="txt">${menu.detailStr }
                  				<c:if test="${menu.side != '변경 없음' }">, ${menu.side }, </c:if>${menu.drink }</span>
                  			<span class="order_count tag st03">
                  			<span>수량 ${menu.menu_mount }개</span></span>
                  		</p>
                  		<p class="price">
                  			<strong>
                  				<span class="price_span"><fmt:formatNumber pattern="#,###,###">${menu.menu_price }</fmt:formatNumber></span>
                  				<span class="unit">원</span>
                  			</strong>
                  		</p>
                  	  </div>
                    </li>
                 </c:forEach> <!-- 전체 배열 for end-->
                </ul>
            </div>
            
            <h2 class="tit01 tit_ico money"><span>최종 결제금액</span></h2>
            
            <div class="container02">
                <div class="order_payment_list">
                    <dl class="tot">
                        <dt>최종 결제금액</dt>
                        <dd><em><span class="total_span">12,800</span><span class="unit">원</span></em></dd>
                    </dl>
                    <dl>
                        <dt>제품금액</dt>
                        <dd><span class="allprice_span">12,800</span><span class="unit">원</span></dd>
                    </dl>
                    <dl>
                        <dt>할인금액</dt>
                        <dd><span class="discount_span">0</span><span class="unit">원</span></dd>
                    </dl>
                </div>
            </div>
            
            <div class="WEB tit01 titbox">
                <h2 class="tit_ico payment"><span>결제수단 선택</span></h2>
                <div class="tab01 rcen_btn">
                    <ul>
                        <li class="on" style=""><button type="button"><span>간편결제</span></button></li>
                        <li class="" style=""><button type="button"><span>카드결제</span></button></li>
                        <li class=""><button type="button"><span>만나서 결제</span></button></li>
                    </ul>
                </div>
            </div>
            
            <div class="payment_tabcont" style="">
                <h3 class="tit01 tit_ico payment"><span>간편하게 결제</span></h3>
                <div class="container02">
                    <ul class="easy_payment_list">
                        <li class="naver" style="">
                        	<label>
                        		<input type="radio" name="paymentType" value="네이버페이"><span>네이버페이</span>
                        	</label>
                        </li>
                        <li class="kakao" style="">
                        	<label>
                        		<input type="radio" name="paymentType" value="카카오페이"><span>카카오페이</span>
                        	</label>
                        </li>
                        <li class="payco" style="">
                        	<label>
                        		<input type="radio" name="paymentType" value="페이코"><span>페이코</span>
                        	</label>
                        </li>
                    </ul>
                    <ul class="txtlist03 naver_cont" style="">
                        <li>· 주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.</li>
                        <li>· 네이버페이는 네이버ID로 별도 앱 설치 없이 신용카드 또는 은행계좌 정보를 등록하여 네이버페이 비밀번호로 결제할 수 있는 간편결제 서비스입니다. </li>
                        <li>· 결제 가능한 신용카드: 신한, 삼성, 현대, BC, 국민, 하나, 롯데, NH농협, 씨티 </li>
                        <li>· 결제 가능한 은행: NH농협, 국민, 신한, 우리, 기업, SC제일, 부산, 경남, 수협, 우체국, 미래에셋대우. 광주, 대구, 전북, 새마을금고, 제주은행, 신협, 하나은행</li>
                        <li>· 네이버페이 카드 간편결제는 네이버페이에서 제공하는 카드사 별 무이자, 청구할인 혜택을 받을 수 있습니다.</li>
                    </ul>
                    <ul class="txtlist03 payco_cont" style="display: none;">
                        <li>· PAYCO는 온/오프라인 쇼핑은 물론 송금, 멤버십 적립까지 가능한 통합 서비스입니다..</li>
                        <li>· 휴대폰과 카드 명의자가 동일해야 결제 가능하며, 결제금액 제한은 없습니다.</li>
                        <li>· - 지원카드: 모든 국내 신용/체크카드. </li>
                    </ul>
                </div>
            </div>
            
            <div class="payment_tabcont w_none" style="">
                <h3 class="tit01 tit_ico phone"><span>카드결제</span></h3>
                <div class="container02">
                    <div class="check_list01"><label><input type="radio" name="paymentType" value="신용카드 결제"><span>신용카드 결제</span></label></div>
                </div>
            </div>
            
            <div class="payment_tabcont w_none">
                <h3 class="tit01 tit_ico deliveryman"><span>만나서 결제 </span></h3>
                <div class="container02">
                    <ul class="check_list01">
                        <li><label><input type="radio" name="paymentType" value="현장에서 신용카드 결제"><span>현장에서 신용카드 결제</span></label></li>
                        <li><label><input type="radio" name="paymentType" value="현장에서 현금 결제"><span>현장에서 현금 결제</span></label></li>
                    </ul>
                </div>
            </div>
            
            <div class="totamountWrap">
                <dl>
                    <dt>총 결제금액</dt>
                    <dd><strong>￦<span class="total_span">12,800</span></strong></dd>
                </dl>
                <div class="c_btn m_item2">
                	<button type="button" class="btn01 m" onclick="location.href='cart.do'"><span>취소</span></button>
                	<button type="button" class="btn01 m red" onclick="javascript:goOrder();"><span>결제하기</span></button>
                </div>
            </div>
            
        </div>
        </form>
    </div>
</div>
<script src="resources/js/delivery/deliveryOrder.js"></script>
</body>
<jsp:include page="../ingredient/ingredientFooter.jsp" />
<jsp:include page="../footer.jsp" />
</html>