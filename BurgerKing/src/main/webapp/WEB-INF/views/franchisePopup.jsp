<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link  href="resources/css/cs/franchisePopup.css"  rel="stylesheet"  type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<div class="franchisePopWrap m_FullpopWrap">
		<div class="popbox01">
			<div class="M_headerWrap">
				<div class="titleBar">
					<h1 class="page_tit w_alignL">
						<span>가맹 신청서</span>
					</h1>
					<div class="title_btn">
						<button type="button" class="btn_close">
							<span>Close</span>
						</button>
					</div>
				</div>
			</div>
			<div class="popcont nopadding">
				<div class="writeForm01">
					<div class="dlist01">
						<dl>
							<dt>성명</dt>
							<dd>
								<input type="text" placeholder="이름">
							</dd>
						</dl>
						<dl>
							<dt class="vtop m_vtop_form">생년월일</dt>
							<dd>
								<div class="inp_birth">
									<div>
										<select class="st03">
											<option value disabled="disabled" selected>
												선택
											</option>
											<c:set var="endYear" value="2021"/>
											<c:forEach begin="0" end="99" var="i">
												<option>
													${endYear - i}
												</option>
											</c:forEach>
										</select> <strong>년</strong>
									</div>
									<div>
										<select class="st03">
										<option value disabled="disabled" selected>선택</option>
										<c:forEach begin="1" end="12" var="i">
												<option value="${i }">
													${i}
												</option>
										</c:forEach>
										</select> <strong>월</strong>
									</div>
									<div>
										<select class="st03">
										<option value disabled="disabled" selected>선택</option>
										<c:forEach begin="1" end="31" var="i">
												<option value="${i }">
													${i}
												</option>
										</c:forEach>
										</select> <strong>일</strong>
									</div>
								</div>
							</dd>
						</dl>
						<dl>
							<dt class="vtop">
								전화번호<br>(연락처)
							</dt>
							<dd>
								<input type="tel" placeholder="‘-’없이 입력">
							</dd>
						</dl>
						<dl>
							<dt>이메일</dt>
							<dd>
								<input type="text" placeholder="이메일">
							</dd>
						</dl>
						<dl>
							<dt>희망개설지역</dt>
							<dd>
								<div class="form_list">
									<select class="st03">
										<option>서울특별시</option>
									</select> 
									<select class="st03">
										<option>강남구</option>
									</select>
								</div>
							</dd>
						</dl>
						<dl>
							<dt class="vtop m_vtop_form">임대차 목적물 보유 유무</dt>
							<dd>
							<div class="formlistWrap item3">
								<label class="radio_label"> 
								<input type="radio" value="Y" checked="checked">
								<strong>유</strong>
								</label> 
								<label class="radio_label"> 
								<input type="radio" value="N">
								<strong>무</strong>
								</label>
							</div>
							</dd>
						</dl>
						<dl>
							<dt class="vtop m_vtop_form">보유시 임대차 목적물 면적</dt>
							<dd>
							<div class="form_list">
								<input type="tel" placeholder="숫자입력" class="area"> 
								<select class="st03">
									<option value="㎡" selected="selected">제곱미터</option>
									<option value="평">평</option>
								</select>
							</div>
							</dd>
						</dl>
						<dl>
							<dt class="nowrap">현재 종사 직업</dt>
							<dd>
								<input type="text" placeholder="한글/영문 입력">
							</dd>
						</dl>
					</div>
					<dl class="dlist02">
						<dt>추가 의견</dt><br>
						<dd>
							<textarea id="text_content"rows="5" cols="50" placeholder="내용입력" maxlength="500"></textarea>
							<div class="page_count">
								<span>0</span>/ <span>500</span>
								<!-- <span>###</span> -->
							</div>
						</dd>
					</dl>
				</div>
				<div class="container01">
					<div class="container02">
						<div class="auth_list accWrap01">
							<div class="divide">
								<label> <input type="checkbox" class="check02">
									<span>약관동의</span>
								</label>
							</div>
							<div class="acc_list toggle">
								<div class="acc_tit">
									<span>수집하는 개인정보 항목</span>
									<button type="button" class="btn_acc">
										<span>상세보기</span>
									</button>
								</div>
								<div class="acc_cont">
									<p>회사는 원활한 가맹신청 상담절차를 위해 아래와 같은 개인정보를 수집하고 있습니다.</p>
									<br> ο 수집항목<br> 1) 필수 입력사항: 이름, 전화번호(연락처), 이메일,
									희망개설지역, 임대차 목적물 보유 유무, 임대차 목적물 면적, 현재 종사 직업<br> 2) 서비스
									이용과정이나 처리 과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.<br> : 서비스
									이용기록, 접속로그, 쿠키, 접속IP정보.
								</div>
							</div>
							<div class="acc_list toggle">
								<div class="acc_tit">
									<span>개인정보의 수집 및 이용목적</span>
									<button type="button" class="btn_acc">
										<span>상세보기</span>
									</button>
								</div>
								<div class="acc_cont">
									<p>회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.</p>
									<br>
									<p>ο 가맹점 지원자에 대한 자격심사</p>
									<p>ο 상담절차에 따른 연락업무 및 기타 관련 업무 처리 등</p>
								</div>
							</div>
							<div class="acc_list toggle">
								<div class="acc_tit">
									<span>개인정보의 보유 및 파기</span>
									<button type="button" class="btn_acc">
										<span>상세보기</span>
									</button>
								</div>
								<div class="acc_cont">
									<p>
										이용자로부터 제공된 모든 정보는 보관 목적 또는 관련법의 준수 목적 이외의 용도로 사용되는 것이 금지되며,
										개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다. <br>
										그러나, 이용자가 개인정보 파기를 요청하는 경우, 관련 법률이 그러한 정보를 보유할 것을 요구하는 일정 기간이
										파기 요청 시점보다 뒤에 종료하는 경우가 아닌 한, 해당 요청이 접수된 즉시 이용자의 정보는 일체 파기되며
										어떠한 보관 정보도 남지 않으며, 파기 절차 및 방법은 다음과 같습니다.
									</p>
									<br>
									<p>
										가. 보유 및 이용기간<br> - 보유항목 : 이름, 전화번호(연락처), 이메일, 희망개설지역, 임대차
										목적물 보유 유무, 임대차 목적물 면적, 현재 종사 직업<br> - 보유기간 : 1년<br>
										- 보유이유 : 사용자의 서비스 이용 통계 수집<br>
									</p>
									<br>
									<p>
										나. 파기절차<br> 회원님이 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우
										별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간
										저장된 후 파기되어 집니다.<br> 별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유
										되어지는 이외의 다른 목적으로 이용되지 않습니다.
									</p>
									<br>
									<p>
										다. 파기방법<br> 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여
										삭제합니다.
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="pop_btn full_type">
					<button type="button" class="btn02">
						<span>신청서 작성</span>
					</button>
			</div>
		</div>
	</div>
<script src="resources/js/cs/franchisePopup.js"></script>