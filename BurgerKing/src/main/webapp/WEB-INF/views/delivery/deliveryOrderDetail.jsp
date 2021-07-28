<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
</head>
<jsp:include page="deliveryHeader.jsp" flush="true"/>
<jsp:include page="deliveryCart.jsp"/>
<link href="resources/css/delivery/deliveryOrderDetail.css"  rel="stylesheet"  type="text/css">
<body>
<c:set var="user_id" value="${fn:split(memberSession.user_id,'@')}" />
<c:if test="${user_id[0] != 'NOMEMBER' }">
<div class="loc_container">
	<div class="loc">
		<div class="page-navi">
			<a href="delivery_home.do"><span>딜리버리</span></a>
			<a href="mypage_main.do"><span>MY킹</span></a>
			<a href="orderList.do"><span>주문내역</span></a>
			<a><span>주문상세</span></a>
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
</c:if>
<div class="contentsWrap" orderno="${orderDTO.order_no }" menutype="2">
    <div class="contentsBox01 bg_w">
        <div class="web_container">
            <div class="MOB subtitWrap">
                <h2 class="page_tit">주문내역 상세</h2>
            </div>
            <div class="container01">
                <div class="orderstatusWrap">
                    <div class="resultBox delivery" style="">
                    	<span class="tit"><strong>${orderDTO.order_date }</strong></span>
                    	<div class="c_btn"><em class="txt_stat"><span>주문완료</span></em></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="contentsBox01">
        <div class="web_container">
            <div class="container01">
                <div class="titbox tit01">
                    <h3 class=" tit_ico list"><span>주문내역</span></h3>
                </div>
                <ul class="order_list">
                  <c:forEach items="${menulist }" var="menu" varStatus="s">
                    <li>
                        <div class="prd_img"><span><img src="${menu.menu_img }" alt="제품" class="" style="display: inline; opacity: 1;"></span></div>
                        <div class="cont">
                            <p class="tit">
                            	<strong>${menu.menu_name }</strong>
                            </p>
                            <p class="price">
                            	<strong>
                            		<span><fmt:formatNumber pattern="#,###,###">${menu.menu_price }</fmt:formatNumber></span>
                            		<span class="unit">원</span>
                            	</strong>
                            </p>
                            <div class="menu_info">
                            	<span class="txt">
                            		<c:if test="${empty menu.detailStr }">
                            			${menu.menu_info }
                            		</c:if>
                            		<c:if test="${!empty menu.detailStr }">
                            			${menu.detailStr }
                            			<c:if test="${menu.side != '변경 없음' }">, ${menu.side }, </c:if> ${menu.drink }
                            		</c:if>
                            	</span>
                            	
                            	<span class="order_count tag st03">
                            		<span>수량 ${menu.menu_mount }개</span>
                            	</span>
                            </div>
                        </div>
                    </li>
                  </c:forEach>
                </ul>
                <h2 class="tit01 tit_ico burger"><span>주문정보</span></h2>
                <div class="container02 pd02 order_list_sum">
                    <div class="titbox02">
                        <p class="tit">
                        	<strong>${orderDTO.order_addr }</strong>
                        	<em class="tag"><span>주문완료</span></em>
                        </p>
                    </div>
                    <div class="cont">
                        <div class="info" style="">
                            <dl>
                                <dt>주문번호</dt>
                                <dd><strong>${orderDTO.order_no }</strong></dd>
                            </dl>
                            <dl>
                                <dt>주문시간</dt>
                                <dd><strong>${orderDTO.order_date }</strong></dd>
                            </dl>
                            <dl>
                                <dt>연락처</dt>
                                <dd><strong>${orderDTO.order_phone }</strong></dd>
                            </dl>
                            <dl>
                                <dt>매장</dt>
                                <dd><strong>${orderDTO.store_name }</strong></dd>
                            </dl>
                            <dl>
                                <dt>매장 전화번호</dt>
                                <dd><strong>${orderDTO.store_phone }</strong></dd>
                            </dl>
                            <dl class="cancelInfo" style="display: none;">
                                <dt>취소사유</dt>
                                <dd><span></span></dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <h2 class="tit01 tit_ico money"><span>결제내역</span></h2>
                <div class="container02 pd02">
                    <div class="order_payment_list w_st02">
                        <div>
                            <dl>
                                <dt>주문금액</dt>
                                <dd><span><fmt:formatNumber pattern="#,###,###">${orderDTO.order_price }</fmt:formatNumber></span><span class="unit">원</span></dd>
                            </dl>
                            <dl class="group">
                                <dt>쿠폰</dt>
                                <dd><span>0</span><span class="unit">원</span></dd>
                            </dl>
                            <dl>
                                <dt>결제방법 </dt>
                                <dd><span>${orderDTO.pay_way }</span></dd>
                            </dl>
                            <dl class="tot02">
                                <dt>결제금액</dt>
                                <dd><em><span><fmt:formatNumber pattern="#,###,###">${orderDTO.pay_price }</fmt:formatNumber></span><span class="unit">원</span></em></dd>
                            </dl>
                            <dl>
                                <dt>스탬프지급</dt>
                                <dd><em><span>1개</span></em></dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="c_btn m_item2">
                	<button type="button" class="btn01 m" onclick="location.href='orderList.do'"><span>주문목록</span></button>
                </div>
            </div>
        </div>
        
    </div>
    
</div>
</body>
<jsp:include page="../footer.jsp" />
</html>