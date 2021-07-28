<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<link href="resources/css/delivery/deliveryCart.css"  rel="stylesheet"  type="text/css">

<div class="WEB on_cont head_personalWrap">
    <div class="web_container">
      <c:set var="user_id" value="${fn:split(memberSession.user_id,'@')}" />
       <c:if test="${user_id[0] == 'NOMEMBER' }">
        <div class="personal_logoff">
            <p>WHERE TASTE IS KING! 버거킹과 함께하는 맛있는 세계!</p>
            <a href="join_info_service.do"><strong>회원가입하고 혜택받기</strong></a>
            <div class="btn_area">
            	<a href="Login.do"><strong>로그인</strong></a>
            	<a href="orderList.do"><strong>비회원 주문내역</strong></a>
            </div>
        </div>
       </c:if>
       <c:if test="${user_id[0] != 'NOMEMBER' }">
        <div class="personal_logon ">
        	<a href="orderList.do">
              <div class="personal_order">
                <dl>
                  <dt><strong>딜리버리 주문내역</strong></dt>
                  <dd>최근 주문내역 조회</dd>
                </dl>
              </div>
            </a>
            <a <c:if test="${!user_id[0] != 'NOMEMBER' }">href="cart.do"</c:if>>
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