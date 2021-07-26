<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WHY 버거킹</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/public/favicon.ico">
<link href="resources/css/brandStory/whyBurgerking.css"  rel="stylesheet"  type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/brandStory/whyBurgerking.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1" />	
</head>
<body>
	<jsp:include page="whyBurgerkinglocation.jsp"/>
	<jsp:include page="brandStory_menu.jsp"/>
	<div class="web_container">
		<div class="tab_cont">
			<ul class="tab03 item5">
				<li class="on">
					<button type="button">
						<span>Real Whopper</span>
					</button>
				</li>
				<li class>
					<button type="button">
						<span>FLAME GRILLED</span>
					</button>
				</li>
				<li class>
					<button type="button">
						<span>신선한 재료</span>
					</button>
				</li>
				<li class>
					<button type="button">
						<span>Trust in Taste</span>
					</button>
				</li>
				<li class>
					<button type="button">
						<span>환경/사회공헌</span>
					</button>
				</li>
			</ul>
		</div>
	</div><!-- web_container end 탭메뉴 영역 -->
	</div><!-- contentsBox01 bg_w end menu에서 div 있어야 함 -->
	<div class="tab_cont bg_w real">
		<div class="web_container">
			<h4 class="MOB m_subtit">Real Whopper</h4>
			<div class="realwhopper_title">
				<img src="https://www.burgerking.co.kr/dist/img/realwhopper_title.330148f9.png">
			</div>
			<div class="realwhopper_list">
				<img src="https://www.burgerking.co.kr/dist/img/realwhopper_list.d9cbc8c3.png">
			</div>
			<div class="realwhopper_text">
				<p>버거킹은 지난 5년간 끊임없이 
				<br>
				더 건강하고 믿을 수 있는 와퍼를 만들기 위해 노력했습니다!
				</p>
				<p>와퍼의 모든 재료에 대해 지난 5년간  
				<br>
				향료, 색소, 보존제, 첨가제 등의 제품 성분 개선 활동을 통해 
				<br>
				더욱 믿을 수 있고, 더욱 맛있는 리얼 와퍼가 탄생하였습니다!
				</p>
				<p>
				직화로 구운 불맛 100% 순쇠고기 패티에 
				<br>
				보다 신선한 채소와  
				<br>	
				믿을 수 있는 재료, 성분들로 완성된 
				<br>
				버거킹의 대표 메뉴 와퍼의 변신!
				</p>
				<p>지금 버거킹에서 리얼와퍼를 만나보세요!</p>
			</div><!-- realwhopper_text end -->
		</div><!-- web_container end -->
	</div><!-- tab_cont bg_w real 첫 번째 탭 영역-->
	<div class="tab_cont bg_w flame_grilled" style='display: none;'>
		<div class="whopper_intro">
			<div class="web_container">
				<h4 class="MOB m_subtit">What's WHOPPER?</h4>
				<div class="txt_whopper">
					<img src="https://www.burgerking.co.kr/dist/img/txt_whopper.06ce336d.gif">
				</div>
				<p>
				전 세계적으로 사랑 받는 WHOPPER는 불에 직접 구운 100% 순쇠고기 
				패티 위에 신선한 토마토, 양상추, 양파, 마요네즈, 케첩, 상큼한 피클을
				올린 버거킹의 대표 제품입니다.
				</p>
			</div><!-- web_container end -->
		</div><!-- whopper_intro end -->
		<div class="grilled_intro">
			<div class="web_container">
				<h4 class="MOB m_subtit">Flame-Grilled 소개</h4>
				<div class="txt_img">
					<img src="https://www.burgerking.co.kr/dist/img/txt_flame_grilled.92305426.png">
				</div>
				<p class="txt">
				버거킹은 1954년 이후로 고기를 팬에 굽는 일반 QSR과는 달리 고기를 직접 불에 구워 조리하는
				직화 방식(Flame-Grilled) 으로 담백하고 풍부한 맛과 향, 그리고 정통 햄버거의 풍미를 선보이고 있습니다. 
				이 과정에서 불필요한 기름기는 제거되고 고기의 육즙은 그대로 보존되어, 
				고기의 독특한 맛과 향을 느낄 수 있습니다. 불에 직접 구워 담백하고 풍부한 맛! 
				버거킹의 햄버거만이 드릴 수 있는 특별한 맛입니다.
				</p>
			</div>
		</div><!-- grilled_intro end -->
	</div><!-- tab_cont bg_w flame_grilled end 두 번째 탭 영역 -->
	<div class="tab_cont bg_w material" style='display: none;'>
		<div class="material_intro01">
			<div class="web_container">
				<h4 class="MOB m_subtit">신선한 재료 소개</h4>
				<dl class="beef">
					<dt>
						<img src="resources/img/brandStory/3tab_1.gif" alt="100% BEEF">
					</dt>
					<dd>
					버거킹의 소고기 패티는 100% 순쇠고기로 만들어졌으며, 어떠한 방부제나 첨가물이 들어가지 않습니다.
					</dd>
				</dl>
				<dl class="vegetable">
					<dt class="WEB">
						<img src="resources/img/brandStory/3tab_2.gif" alt="FRESH VEGETABLES">
					</dt>
					<dt class="MOB">
						<img src="resources/img/brandStory/3tab_2_mob.png" alt="FRESH VEGETABLES">
					</dt>
					<dd>
					버거킹의 모든 햄버거에는 엄격한 검수 과정을 통해 입고된 신선한 야채가 사용됩니다. 
					항상 신선함을 추구하는 가치로, 매일 매장에서 토마토를 직접 준비합니다.
					</dd>
				</dl>
				<dl class="pickle">
					<dt>
						<img src="resources/img/brandStory/3tab_3.gif" alt="FRESH VEGETABLES">
					</dt>
					<dd>
					풍부하고 신선한 야채와 어우러진 고소한 마요네즈와 새콤달콤한 케첩은 정통 햄버거 특유의 풍미를 제공합니다.
					</dd>
				</dl>
			</div>
		</div><!-- material_intro01 end -->
		<div class="material_intro02">
			<div class="web_container">
				<h4 class="tit">
					<span>신선한 </span>
					<span>재료와  </span>
					<span>철저한  </span>
					<span>위생관리</span>
				</h4>
				<dl class="quality">
					<dt>QUALITY</dt>
				<dd>
				버거킹은 자체적으로 엄격한 품질 관리 시스템을 운영하고 있습니다. 지속적인 관리를 통해 버거킹 원재료는 최상의 품질을 유지합니다. 
				올바른 품질 관리가 이루어지고 있는 업체만을 선정하여 원재료를 공급받고, 자재가 매장에 입고될 땐 자체적으로 유통기한 및 제품 온도를 검사하여 기준에 미치지 못하는 제품은 반송합니다. 
				또한 입고 후에도 보관 제품의 신선도 유지와 변질 방지에 한치의 소홀함도 용납하지 않음으로써, 
				버거킹을 방문하시는 고객들에게 최상의 맛과 품질을 가진 제품만을 제공합니다.
				</dd>
				</dl>
				<dl class="service">
					<dt>SERVICE</dt>
					<dd>정확, 친절한 서비스를 제공하기 위해 최선을 다하고 있습니다. 
					신속한 주문을 위해서 고객이 주문 후 1분 안에 제품을 받을 수 있도록 노력하고 있으며, 
					또한 오류 없는 정확하고 친절한 서비스를 위해 별도로 카운터 응대 교육을 시행 중 입니다. 
					버거킹을 찾아주시는 모든 고객들이 만족하실 수 있도록 버거킹이 할 수 있는 최고의 서비스, 
					밝은 미소와 감사하는 마음으로 고객들을 맞이하고 있습니다.</dd>
				</dl>
				<dl class="clean">
					<dt>CLEANILINESS</dt>
					<dd>
					아무리 맛 좋은 음식이라도 비위생적이라면 고객에게 독과 같다는 것이 버거킹의 신념 중 하나입니다. 
					버거킹의 매니저들은 미국 NRA(National Restaurant Association)에서 실시하는 
					AFS(Applied Foodservice Sanitation) 과정을 수료하고 테스트에 합격하여 매장 
					내의 위생에 관한 개념이 철저합니다. 그리고 모든 직원들은 개인 위생은 물론, 
					제품 온도와 기계/소도구를 규정된 절차에 따라 관리함으로써 최상의 청결 및 위생상태를 유지하여
					고객이 안심하고 드실 수 있도록 노력하고 있습니다.
					</dd>
				</dl>
			</div><!-- web_container end -->
		</div><!-- material_intro02 end -->
	</div><!-- tab_cont bg_w 3번째 탭 영역 -->
	<div class="tab_cont bg_w TNT" style='display: none;'>
		<div class="TNT_wrap">
			<div class="web_container">
				<h4 class="MOB m_subtit">Trust in Taste 소개</h4>
				<p class="txt_intro">	
				<span>
				Trust in Taste란? 전세계 버거킹의 고객들이 우리 제품에 만족감을 느낄 수 있도록 하는 
				</span>
				<span>
				활동입니다. 버거킹 코리아는 전세계 버거킹의 가치인 Trust in Taste를 시행하며
				</span>
				<span>
				최고의 제품과 서비스를 제공하기 위해 노력하고 있습니다.
				</span>
				</p>
				<ul>
					<li>
						<div class="pic WEB">
							<img src="https://www.burgerking.co.kr/dist/img/img_TNT01.ea7c7e5b.jpg">
						</div>
						<div class="pic MOB">
							<img src="https://www.burgerking.co.kr/dist/img/img_TNT01_m.0dad5288.jpg">
						</div>
						<div class="cont best_burger">
							<strong class="tit">Trust in Taste1. 최고의 버거</strong>
							<p>
							WHOPPER의 맛과 퀄리티를 개선하여 고객들이 최고의 맛을 느낄 수 있도록 합니다. 
							버거킹의 자산인 Flame-Grilling 방식으로 더욱 특별한 맛을 제공합니다. 
							버거킹의 소고기 패티는 100% 순쇠고기로 만들어졌으며, 어떠한 방부제나 첨가물이 들어가지 않습니다.
							</p>
						</div>
					</li>
					<li>
						<div class="pic WEB">
							<img src="https://www.burgerking.co.kr/dist/img/img_TNT02.6358a079.jpg">
						</div>
						<div class="pic MOB">
							<img src="https://www.burgerking.co.kr/dist/img/img_TNT02_m.534ad5c4.jpg">
						</div>
						<div class="cont">
							<strong class="tit">Trust in Taste2. 최고의 치킨</strong>
							<p>
							버거킹은 고객에게 가장 맛이 좋은 치킨 제품을 제공합니다.
							</p>
						</div>
					</li>
					<li>
						<div class="pic WEB">
							<img src="https://www.burgerking.co.kr/dist/img/img_TNT03.276c1779.jpg">
						</div>
						<div class="pic MOB">
							<img src="https://www.burgerking.co.kr/dist/img/img_TNT03_m.4a9f1bd5.jpg">
						</div>
						<div class="cont best_material">
							<strong class="tit">Trust in Taste3. 재료</strong>
							<p>
							버거킹은 고객에게 높은 품질의 제품을 제공하기 위해 재료에 대한 내부 정화 정책을 시행합니다.
							</p>
						</div>
					</li>
					<li>
						<div class="pic WEB">
							<img src="https://www.burgerking.co.kr/dist/img/img_TNT04.f427b94c.jpg">
						</div>
						<div class="pic MOB">
							<img src="https://www.burgerking.co.kr/dist/img/img_TNT04_m.63c657fd.jpg">
						</div>
						<div class="cont best_kitchen">
							<strong class="tit">Trust in Taste4. 주방</strong>
							<p>
							버거킹의 주방 배치는 고객에게 신선한 준비 과정을 보여주며 품질 인식을 개선합니다.
							</p>
						</div>
					</li>
				</ul>
			</div><!-- web_container end -->
		</div><!-- TNT_wrap end -->
	</div><!-- tab_cont bg_w 4번째 탭 영역 -->
	<div class="tab_cont bg_w contribu" style='display: none;'>
		<div class="web_container contribution">
			<h4 class="MOB m_subtit">환경/사회공헌 활동</h4>
			<div class="contribution_swipe">
				<div class="slick-initialized slick-slider">
					<div class="slick-list draggable">
						<div class="slick-track">
						<div class="slick-slide slick-current slick-active">
							<div>
								<div class="cont">
									<div class="image">
										<img src="https://www.burgerking.co.kr/dist/img/@img_contribution.3e5c1214.png">
									</div>
									<div class="text">
										<p>환경을 위한 작은 실천</p>
										<p> 개인 음료 컵 사용 시</p>
										<p>
											<strong>탄산음료(단품) 200원 할인</strong>
										</p>
									</div>
								</div>
							</div>
						</div><!-- slick-slide slick-current slick-active end -->
						</div><!-- slick-track -->
					</div><!-- slick-list draggable end -->
				</div><!-- slick-initialized slick-slider end -->
			</div><!-- contribution_swipe end -->
		</div><!-- web_container contribution end -->
	</div><!-- tab_cont bg_w 5번째 탭 영역 -->
</div><!-- contentsWrap end menu에 있어야 함 -->
</body>
</html>