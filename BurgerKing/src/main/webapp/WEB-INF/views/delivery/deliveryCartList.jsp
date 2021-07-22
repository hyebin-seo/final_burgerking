<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카트</title>
<link href="resources/css/delivery/deliveryCartList.css"  rel="stylesheet"  type="text/css">
</head>
<jsp:include page="deliveryHeader.jsp" flush="true"/>
<jsp:include page="deliveryCart.jsp"/>
<body>
<input type="hidden" name="user_id" id="user_id" value="${memberSession.user_id}">
<div class="contentsBox01">
    <div class="web_container">
        <div class="subtitWrap m_bg_basic">
            <h2 class="page_tit">딜리버리 카트</h2>
        </div>
        <c:choose>
	      <c:when test="${empty cartlist }">
	      	<div class="nodata">
	      </c:when>
		  <c:otherwise>
			<div class="nodata" style="display: none;">
		  </c:otherwise>
        </c:choose>
        	<span class="txt_c01">카트에 담긴 메뉴가 없습니다</span>
            <div class="c_btn">
            	<button type="button" class="btn01 ico add" onclick="location.href='delivery_home.do'">
            		<span>메뉴 추가</span>
            	</button>
            </div>
        </div>
       
       <c:if test="${!empty cartlist }">
        <div class="container01 cartWrap" style="">
            
            <div class="allchk01">
            	<label>
            	<input type="checkbox" class="check02"><span>전체선택 <span></span></span></label>
                <div class="rcen_btn">
                	<button type="button" class="btn04" onclick="javascript:cartAllDelete('${memberSession.user_id }');">
                		<span> 전체삭제 </span>
                	</button>
                </div>
            </div>
            
            <ul class="cart_list01">
              <c:forEach items="${cartlist }" var="cart">
               	<input type="hidden" class="cart_no" value="${cart.cart_no }">
              	<c:if test="${cart.menu_flag == 'single' }">
              		<c:forEach items="${menulist }" var="menu" varStatus="status">
              			<c:if test="${cart.set_no == menu.menu_no }">
              				<c:set var="menuinfo" value="${menulist.get(status.index) }"></c:set>
              			</c:if>
              		</c:forEach>
              	</c:if>
              	
              	<c:if test="${cart.menu_flag == 'set' }">
              		<c:forEach items="${menulist }" var="menu" varStatus="status">
              			<c:if test="${cart.set_no == menu.set_no }">
              				<c:set var="menuinfo" value="${menulist.get(status.index) }"></c:set>
              			</c:if>
              		</c:forEach>
              	</c:if>
               
               
                <li class="${cart.cart_no }">
                    <div class="cont">
                        <div class="menu_titWrap">
                        	<label class="menu_name">
                        		<input type="checkbox" name="menu" title="선택" class="check02">
                        			<span class="tit">
                        				<strong><span>
                        					<c:if test="${cart.menu_flag == 'single' }">
                        						${menuinfo.menu_name }
                        					</c:if>
                        					<c:if test="${cart.menu_flag == 'set' }">
                        						${menuinfo.set_name }
                        					</c:if>
                        				</span></strong>
                        			</span>
                        			<span class="set_info">
                        				<c:if test="${cart.menu_flag == 'single' }">
	                        				${menuinfo.menu_member }
	                        			</c:if>
                       					<c:if test="${cart.menu_flag == 'set' }">
                       						${menuinfo.set_member }
                       					</c:if>
                        			</span>
                        			<span class="price">
                                    	<strong>
                                    		<span>
                                    		  <fmt:formatNumber pattern="#,###,###">
                                    			<c:if test="${cart.menu_flag == 'single' }">
	                        						${menuinfo.menu_price }
	                        					</c:if>
	                        					<c:if test="${cart.menu_flag == 'set' }">
	                        						${menuinfo.set_price }
	                        					</c:if>
	                        				  </fmt:formatNumber>
                                    		</span>
                                    		<span class="unit">원</span>
                                    	</strong>
                                    </span>
                            </label>
                            <div class="prd_img">
                            	<span>
                            		<c:if test="${cart.menu_flag == 'single' }">
                    						<img src="${menuinfo.menu_img }" alt="제품" class="" style="display: inline; opacity: 1;">
                    				</c:if>
                    				<c:if test="${cart.menu_flag == 'set' }">
                    						<img src="${menuinfo.set_img }" alt="제품" class="" style="display: inline; opacity: 1;">
                    				</c:if>
                            	</span>
                            </div>
                        </div>
                       
                       <c:if test="${(menuinfo.menu_cat != '사이드') && (menuinfo.menu_cat != '음료&디저트') }">
                        <div class="setmenu_detail">
                            <dl>
                                <dt>재료추가</dt>
                                <dd>
                                    <ul class="list">
                                    	<c:if test="${(empty cart.ing1) && (empty cart.ing2) && (empty cart.ing3) && (empty cart.ing4) && (empty cart.ing5) && (empty cart.ing6) && (empty cart.ing7)}">
                                        	<li>추가 없음</li>
                                        </c:if>
                                        <c:if test="${!empty cart.ing1}">
                                        	<li>
                                        		<span class="txt">롱베이컨 2장</span>
                                        		<strong class="amount">+<span class="oprice">1,200</span>
                                        		<span class="unit">원</span></strong>
                                        	</li>
                                        </c:if>
                                        <c:if test="${!empty cart.ing2}">
                                        	<li>
                                        		<span class="txt">할라피뇨4 추가</span>
                                        		<strong class="amount">+<span class="oprice">800</span>
                                        		<span class="unit">원</span></strong>
                                        	</li>
                                        </c:if>
                                        <c:if test="${!empty cart.ing3}">
                                        	<li>
                                        		<span class="txt">롱베이컨 1장</span>
                                        		<strong class="amount">+<span class="oprice">600</span>
                                        		<span class="unit">원</span></strong>
                                        	</li>
                                        </c:if>
                                        <c:if test="${!empty cart.ing4}">
                                        	<li>
                                        		<span class="txt">치즈 2장</span>
                                        		<strong class="amount">+<span class="oprice">600</span>
                                        		<span class="unit">원</span></strong>
                                        	</li>
                                        </c:if>
                                        <c:if test="${!empty cart.ing5}">
                                        	<li>
                                        		<span class="txt">올엑스트라</span>
                                        		<strong class="amount">+<span class="oprice">400</span>
                                        		<span class="unit">원</span></strong>
                                        	</li>
                                        </c:if>
                                        <c:if test="${!empty cart.ing6}">
                                        	<li>
                                        		<span class="txt">할라피뇨4 추가</span>
                                        		<strong class="amount">+<span class="oprice">400</span>
                                        		<span class="unit">원</span></strong>
                                        	</li>
                                        </c:if>
                                        <c:if test="${!empty cart.ing7}">
                                        	<li>
                                        		<span class="txt">치즈 1장</span>
                                        		<strong class="amount">+<span class="oprice">300</span>
                                        		<span class="unit">원</span></strong>
                                        	</li>
                                        </c:if>
                                    </ul>
                                </dd>
                            </dl>
                            <dl>
                                <dt>사이드</dt>
                                <dd>
                                    <div class="list">
                                      <c:if test="${empty cart.side }">
                                      	<span class="txt">변경 없음</span>
                                      </c:if>
                                      <c:if test="${!empty cart.side }">
                                    	<span class="txt">${cart.side }</span>
                                    	<strong class="amount">+<span>${cart.side_price }</span><span class="unit"> 원</span></strong>
                                      </c:if>
                                    </div>
                                </dd>
                            </dl>
                            <dl>
                                <dt>음료</dt>
                                <dd>
                                    <div class="list">
                                      <c:if test="${empty cart.drink }">
                                      	<span class="txt">변경 없음</span>
                                      </c:if>
                                      <c:if test="${!empty cart.drink }">
                                    	<span class="txt">${cart.drink }</span>
                                    	<strong class="amount">+<span>${cart.drink_price }</span><span class="unit"> 원</span></strong>
                                      </c:if>
                                    </div>
                                </dd>
                            </dl>
                        </div>
                      </c:if>
                        <div class="quantity">
                        	<strong class="tit">수량</strong>
                            <div class="num_set">
                    			<button type="button" class="btn_minus" value="${cart.cart_no }"><span>-</span></button>
                           		<input type="number" readonly="readonly" value="${cart.amount }">
                           		<button type="button" class="btn_plus" value="${cart.cart_no }"><span>+</span></button>
                            </div>
                        </div>
                    </div>
                   
                    <div class="sumWrap">
                        <dl>
                            <dt>합계금액</dt>
                            <dd><strong><em>
                            	<span class="pricespan sumprice${cart.cart_no }">
                            	  <fmt:formatNumber pattern="#,###,###">
                            		<c:if test="${cart.menu_flag == 'single' }">
                      						${menuinfo.menu_price * cart.amount }
                      				</c:if>
                      				<c:if test="${cart.menu_flag == 'set' }">
                      						${(menuinfo.set_price * cart.amount) + cart.drink_price + cart.side_price}
                      				</c:if>
                      			  </fmt:formatNumber>
                            	</span>
                            	<span class="unit">원</span>
                            </em></strong></dd>
                        </dl>
                        <dl class="discount" style="display: none;">
                            <dt><em>쿠폰할인</em></dt>
                            <dd><strong><em>-<span>0</span><span class="unit">원</span></em></strong></dd>
                        </dl>
                    </div>
                    
                    <button type="button" class="btn_del02" onclick="javascript:cartDelete(${cart.cart_no});"><span>Delete menu</span></button>
                </li>
             </c:forEach> <!-- cartlist foreach -->
            </ul>
            
            <div class="sumWrap">
                <dl>
                    <dt>총 주문금액</dt>
                    <dd>
                    	<strong><em>
                    	  <span class="totalprice"></span>
                    		<span class="unit">원</span>
                    	</em></strong>
                    </dd>
                </dl>
            </div>
            
            <div class="cartinfo">
                <div class="c_btn item2">
                	<button type="button" class="btn01 m ico add" onclick="location.href='delivery_home.do'"><span>메뉴 추가</span></button>
                	<button type="button" class="btn01 m red"><span>주문하기</span></button>
                </div>
                <ul class="txtlist01">
                    <li>주문서를 작성하기 전에 선택하신 상품명, 수량 및 가격이 정확한지 확인해주세요.</li>
                    <li>해당매장의 주문배달 최소금액은 12,000원 입니다.</li>
                </ul>
            </div>
            
        </div>
      </c:if>
    </div>
</div>
</body>
<script src="resources/js/delivery/deliveryCartList.js"></script>
<jsp:include page="../footer.jsp" />
</html>