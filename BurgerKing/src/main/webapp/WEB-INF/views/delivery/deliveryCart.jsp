<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<link href="resources/css/delivery/deliveryCart.css"  rel="stylesheet"  type="text/css">

<div class="WEB on_cont head_personalWrap">
    <div class="web_container">
       <c:if test="${empty memberSession }">
        <div class="personal_logoff">
            <p>WHERE TASTE IS KING! 버거킹과 함께하는 맛있는 세계!</p>
            <a><strong>회원가입하고 혜택받기</strong></a>
            <div class="btn_area">
            	<a href="Login.do"><strong>로그인</strong></a>
            	<a href="order_list.do"><strong>비회원 주문내역</strong></a>
            </div>
        </div>
       </c:if>
       <c:if test="${!empty memberSession }">
        <div class="personal_logon ">
        	<a href="orderList.do">
              <div class="personal_order">
                <dl>
                  <dt><strong>딜리버리 주문내역</strong></dt>
                  <dd>최근 주문내역 조회</dd>
                </dl>
              </div>
            </a>
            <a <c:if test="${!empty addrSession }">href="cart.do"</c:if>>
               <div class="personal_cart">
                  <dl>
                    <dt><strong>카트</strong></dt>
                    <dd>나의 장바구니</dd>
                  </dl>
                </div>
            </a>
         </div>
       </c:if>
    </div>
</div>

<script src="resources/js/delivery/deliveryCart.js"></script>