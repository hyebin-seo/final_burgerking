<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="resources/css/public/ingredientPopup.css"  rel="stylesheet"  type="text/css">
<script src="resources/js/public/ingredientPopup.js"></script>

<div class="ingredientPopWrap m_FullpopWrap ">
    <div class="popbox01 popbox_width02 nobtn">
        <div class="pop_header01 st02">
            <h1><span>버거킹 원산지 / 영양 분석표 / 알레르기 유발 성분</span></h1>
            <div class="title_btn"><button type="button" class="btn_close btn_head_close"><span>Close</span></button></div>
        </div>
        <div class="popcont container01">
            <h2 class="tit01 font_s01 tit_ico origin"><span>원산지</span></h2>
            <div class="container02 origin_info">
                <dl class="cow">
                    <dt>쇠고기</dt>
                    <dd>· 패티 : 호주산과 뉴질랜드산 섞음
                        <br>· 소불고기패티 : 호주산과 국내산(한우) 섞음 (직화소불고기버거, 직화버섯소불고기버거, 고추장소불고기버거, 고추장버섯소불고기버거)</dd>
                </dl>
                <dl class="pig">
                    <dt>돼지고기</dt>
                    <dd>· 베이컨 :&nbsp;미국산<br>· 통베이컨스테이크 : 외국산
                        (기네스통베이컨와퍼, 통베이컨와퍼)</dd>
                </dl>
                <dl class="chicken">
                    <dt>닭고기</dt>
                    <dd>· 국내산 : BBQ몬스터, 롱치킨버거, 몬스터베이비XL, 몬스터와퍼, 몬스터X, (바비큐)킹치킨버거, 너겟킹 : 국내산
                        <br>· 외국산 : 바삭킹</dd>
                </dl>
            </div>
            <h2 class="tit01 tit_ico kcal"><span>영양정보(2021.07.05)</span></h2>
            <div class="container02">
                <ul class="acc_list01">
                    <li class="">
                        <div class="acc_tit">
                            <p class="tit">
                            	<strong>BURGER 버거</strong>
                            </p>
                            <button type="button" class="btn_acc"><span>contents show/hide</span></button>
                        </div>
                        <div class="acc_cont">
                            <table class="info_table st02">
                                <colgroup>
                                    <col>
                                    <col span="7" style="width: 11%;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col" class="alignl">제품명</th>
                                        <th scope="col">중량<br>(g/ml)</th>
                                        <th scope="col">열량<br>(Kcal)</th>
                                        <th scope="col">단백질<br>(g)</th>
                                        <th scope="col">나트륨<br>(mg)</th>
                                        <th scope="col">당류<br>(g)</th>
                                        <th scope="col">포화지방<br>(g)</th>
                                        <th scope="col">카페인<br>(mg)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">BBQ몬스터</th>
                                        <td>245</td>
                                        <td>630</td>
                                        <td>33(60)</td>
                                        <td>1198(60)</td>
                                        <td>5.6</td>
                                        <td>9.8(65)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">고추장버섯소불고기버거</th>
                                        <td>193</td>
                                        <td>466</td>
                                        <td>15(27)</td>
                                        <td>876(44)</td>
                                        <td>6.7</td>
                                        <td>8.2(54)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">고추장소불고기버거</th>
                                        <td>178</td>
                                        <td>459</td>
                                        <td>15(27)</td>
                                        <td>795(40)</td>
                                        <td>7.4</td>
                                        <td>7.9(53)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">기네스머쉬룸와퍼</th>
                                        <td>323</td>
                                        <td>764</td>
                                        <td>37(67)</td>
                                        <td>1132(57)</td>
                                        <td>13.7</td>
                                        <td>13.6(91)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">기네스와퍼</th>
                                        <td>293</td>
                                        <td>778</td>
                                        <td>36(66)</td>
                                        <td>1140(57)</td>
                                        <td>11.9</td>
                                        <td>14.3(95)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">기네스콰트로치즈와퍼</th>
                                        <td>329</td>
                                        <td>888</td>
                                        <td>42(75)</td>
                                        <td>1421(71)</td>
                                        <td>13.9</td>
                                        <td>21.5(143)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">기네스통베이컨와퍼</th>
                                        <td>353</td>
                                        <td>858</td>
                                        <td>47(86)</td>
                                        <td>1482(74)</td>
                                        <td>13.5</td>
                                        <td>15.3(102)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">더블오리지널치즈버거</th>
                                        <td>192</td>
                                        <td>499 </td>
                                        <td>28<span>(50)</span></td>
                                        <td>792<span>(40)</span></td>
                                        <td>5.2</td>
                                        <td>10.7<span>(71)</span></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">더블와퍼</th>
                                        <td>360</td>
                                        <td>842</td>
                                        <td>45<span>(82)</span></td>
                                        <td>1198<span>(60)</span></td>
                                        <td>10.5</td>
                                        <td>20<span>(135)</span></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">롱치킨버거</th>
                                        <td>210</td>
                                        <td>571</td>
                                        <td>25(45)</td>
                                        <td>1100(55)</td>
                                        <td>5.7</td>
                                        <td>5.5(37)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">몬스터Ⅱ</th>
                                        <td>353</td>
                                        <td>867</td>
                                        <td>38(68)</td>
                                        <td>1451(73)</td>
                                        <td>9.4</td>
                                        <td>16(108)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">몬스터Ⅱ통새우</th>
                                        <td>385</td>
                                        <td>886</td>
                                        <td>40(74)</td>
                                        <td>1675(84)</td>
                                        <td>8.6</td>
                                        <td>16(109)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">몬스터베이비XL</th>
                                        <td>240</td>
                                        <td>662</td>
                                        <td>32(58)</td>
                                        <td>1178(59)</td>
                                        <td>6.3</td>
                                        <td>12(80)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">몬스터와퍼</th>
                                        <td>417</td>
                                        <td>1055</td>
                                        <td>52(94)</td>
                                        <td>1881(94)</td>
                                        <td>16.9</td>
                                        <td>23.1(153.7)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">몬스터X</th>
                                        <td>398</td>
                                        <td>1035</td>
                                        <td>47(85)</td>
                                        <td>2080(104)</td>
                                        <td>14.7</td>
                                        <td>23.3(155)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">바비큐킹치킨버거</th>
                                        <td>168</td>
                                        <td>467</td>
                                        <td>19(34)</td>
                                        <td>781(39)</td>
                                        <td>3.8</td>
                                        <td>5.4(36)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">베이컨치즈와퍼</th>
                                        <td>315</td>
                                        <td>780</td>
                                        <td>37(67)</td>
                                        <td>1368(68)</td>
                                        <td>7.5</td>
                                        <td>19(124)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">스태커 2 와퍼</th>
                                        <td>424</td>
                                        <td>1080</td>
                                        <td>58(105)</td>
                                        <td>1828(91)</td>
                                        <td>8.9</td>
                                        <td>29.3(195)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">스태커 3 와퍼</th>
                                        <td>544</td>
                                        <td>1421</td>
                                        <td>84(153)</td>
                                        <td>2559(128)</td>
                                        <td>11.4</td>
                                        <td>42.1(281)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">스태커 4 와퍼</th>
                                        <td>650</td>
                                        <td>1707</td>
                                        <td>105(191)</td>
                                        <td>3067(153)</td>
                                        <td>11.9</td>
                                        <td>51.8(345)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">아기상어 새우버거</th>
                                        <td>173</td>
                                        <td>439</td>
                                        <td>14(26)</td>
                                        <td>1159(58)</td>
                                        <td>4.1</td>
                                        <td>4.6(31)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">엄마상어 새우버거</th>
                                        <td>212</td>
                                        <td>433</td>
                                        <td>15(28)</td>
                                        <td>1143(57)</td>
                                        <td>4.2</td>
                                        <td>5.0(33)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">아빠상어 새우버거</th>
                                        <td>244</td>
                                        <td>574</td>
                                        <td>24(44)</td>
                                        <td>1165(58)</td>
                                        <td>4.6</td>
                                        <td>8.3(55)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">와퍼</th>
                                        <td>278</td>
                                        <td>619</td>
                                        <td>29(53)</td>
                                        <td>809(40)</td>
                                        <td>10.5</td>
                                        <td>13(84)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">와퍼주니어</th>
                                        <td>158</td>
                                        <td>399</td>
                                        <td>17(32)</td>
                                        <td>570(29)</td>
                                        <td>4.6</td>
                                        <td>8(51)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">직화버섯소불고기버거</th>
                                        <td>193</td>
                                        <td>462</td>
                                        <td>15(27)</td>
                                        <td>821(41)</td>
                                        <td>7.6</td>
                                        <td>8.0(53)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">직화소불고기버거</th>
                                        <td>178</td>
                                        <td>457</td>
                                        <td>14(26)</td>
                                        <td>797(40)</td>
                                        <td>7.2</td>
                                        <td>8.2(55)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">치즈버거</th>
                                        <td>133</td>
                                        <td>366</td>
                                        <td>19(35)</td>
                                        <td>752(38)</td>
                                        <td>5.9</td>
                                        <td>9(57)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">치즈와퍼</th>
                                        <td>303</td>
                                        <td>716</td>
                                        <td>33(59)</td>
                                        <td>1288(64)</td>
                                        <td>7.1</td>
                                        <td>16(108)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">치즈와퍼주니어</th>
                                        <td>170</td>
                                        <td>438</td>
                                        <td>19(35)</td>
                                        <td>771(39)</td>
                                        <td>4.8</td>
                                        <td>10(65)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">콰트로치즈와퍼</th>
                                        <td>309</td>
                                        <td>769</td>
                                        <td>40(73)</td>
                                        <td>1051(53)</td>
                                        <td>6.2</td>
                                        <td>20(131)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">콰트로치즈X</th>
                                        <td>338</td>
                                        <td>820</td>
                                        <td>35(63)</td>
                                        <td>1625(81)</td>
                                        <td>9.4</td>
                                        <td>21.1(141)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">콰트로치즈와퍼주니어</th>
                                        <td>173</td>
                                        <td>446</td>
                                        <td>21(39)</td>
                                        <td>631(32)</td>
                                        <td>3.1</td>
                                        <td>10(64)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">킹치킨버거</th>
                                        <td>178</td>
                                        <td>532</td>
                                        <td>20(36)</td>
                                        <td>714(36)</td>
                                        <td>2.7</td>
                                        <td>7(47)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">통베이컨와퍼</th>
                                        <td>374</td>
                                        <td>853</td>
                                        <td>49(89)</td>
                                        <td>1700(85)</td>
                                        <td>11.5 </td>
                                        <td>14.0(93)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">통새우와퍼</th>
                                        <td>328</td>
                                        <td>741</td>
                                        <td>34(63)</td>
                                        <td>984(49)</td>
                                        <td>4.8</td>
                                        <td>15(99)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">통새우X</th>
                                        <td>335</td>
                                        <td>789</td>
                                        <td>34(61)</td>
                                        <td>1656(83)</td>
                                        <td>11.8</td>
                                        <td>19.2(128)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">통새우와퍼주니어</th>
                                        <td>162</td>
                                        <td>381</td>
                                        <td>21(37)</td>
                                        <td>522(26)</td>
                                        <td>5</td>
                                        <td>7(49)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">트러플머쉬룸와퍼</th>
                                        <td>331</td>
                                        <td>738</td>
                                        <td>29(53)</td>
                                        <td>1254(63)</td>
                                        <td>8</td>
                                        <td>12(80)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">트러플머쉬룸와퍼주니어</th>
                                        <td>172</td>
                                        <td>404</td>
                                        <td>16(29)</td>
                                        <td>554(28)</td>
                                        <td>7.2</td>
                                        <td>7(47)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">햄버거</th>
                                        <td>121</td>
                                        <td>306</td>
                                        <td>17(31)</td>
                                        <td>513(26)</td>
                                        <td>6.3</td>
                                        <td>6(40)</td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </li>
                    <li class="">
                        <div class="acc_tit">
                            <p class="tit">
                            	<strong>SIDES 사이드메뉴</strong>
                            </p>
                            <button type="button" class="btn_acc"><span>contents show/hide</span></button>
                        </div>
                        <div class="acc_cont">
                            <table class="info_table st02">
                                <colgroup>
                                    <col>
                                    <col span="7" style="width: 11%;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col" class="alignl">제품명</th>
                                        <th scope="col">중량<br>(g/ml)</th>
                                        <th scope="col">열량<br>(Kcal)</th>
                                        <th scope="col">단백질<br>(g)</th>
                                        <th scope="col">나트륨<br>(mg)</th>
                                        <th scope="col">당류<br>(g)</th>
                                        <th scope="col">포화지방<br>(g)</th>
                                        <th scope="col">카페인<br>(mg)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">21치즈스틱</th>
                                        <td>49</td>
                                        <td>155</td>
                                        <td>5(9)</td>
                                        <td>251(13)</td>
                                        <td>1.5</td>
                                        <td>3(20)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">너겟킹(4조각)</th>
                                        <td>78</td>
                                        <td>139</td>
                                        <td>6(10)</td>
                                        <td>289(14)</td>
                                        <td>0.4</td>
                                        <td>2(13.5)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">너겟킹(6조각)</th>
                                        <td>117</td>
                                        <td>210</td>
                                        <td>8(15)</td>
                                        <td>434(22)</td>
                                        <td>0.6</td>
                                        <td>3(20.3)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">너겟킹(10조각)</th>
                                        <td>195</td>
                                        <td>347</td>
                                        <td>14(25)</td>
                                        <td>723(36)</td>
                                        <td>1</td>
                                        <td>5(33.8)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">바삭킹(2조각)</th>
                                        <td>99</td>
                                        <td>272</td>
                                        <td>15(27)</td>
                                        <td>497(27)</td>
                                        <td>1.7</td>
                                        <td>5(34.4)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">바삭킹(4조각)</th>
                                        <td>198</td>
                                        <td>544</td>
                                        <td>29(54)</td>
                                        <td>993(50)</td>
                                        <td>3.4</td>
                                        <td>10(66.9)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">바삭킹(8조각)</th>
                                        <td>396</td>
                                        <td>1088</td>
                                        <td>59(107)</td>
                                        <td>1986(99)</td>
                                        <td>6.7</td>
                                        <td>20.1(133.8)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">쉐이킹프라이 구운갈릭</th>
                                        <td>105</td>
                                        <td>292</td>
                                        <td>4(7)</td>
                                        <td>634(32)</td>
                                        <td>0.5</td>
                                        <td>3.1(21)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">쉐이킹프라이 매콤치즈</th>
                                        <td>105</td>
                                        <td>287</td>
                                        <td>4(7)</td>
                                        <td>687(34)</td>
                                        <td>0.6</td>
                                        <td>3.1(21)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">쉐이킹프라이 스윗어니언</th>
                                        <td>105</td>
                                        <td>297</td>
                                        <td>4(8)</td>
                                        <td>486(24)</td>
                                        <td>1.3</td>
                                        <td>3.0(20)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">어니언링</th>
                                        <td>91</td>
                                        <td>332</td>
                                        <td>5(8)</td>
                                        <td>476(24)</td>
                                        <td>2.5</td>
                                        <td>3(23)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">치즈프라이</th>
                                        <td>139</td>
                                        <td>440</td>
                                        <td>12(21)</td>
                                        <td>447(22)</td>
                                        <td>1.8</td>
                                        <td>8(51)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">코울슬로</th>
                                        <td>95</td>
                                        <td>130</td>
                                        <td>1(2)</td>
                                        <td>218(11)</td>
                                        <td>13.2</td>
                                        <td>0.9(5.7)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">코코넛 쉬림프(3조각)</th>
                                        <td>57</td>
                                        <td>81</td>
                                        <td>6(11)</td>
                                        <td>177(9)</td>
                                        <td>1.7</td>
                                        <td>0.9(5.7)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">코코넛 쉬림프(6조각)</th>
                                        <td>114</td>
                                        <td>162</td>
                                        <td>12(22)</td>
                                        <td>353(18)</td>
                                        <td>3.4</td>
                                        <td>1.7(11.4)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">코코넛 쉬림프(9조각)</th>
                                        <td>171</td>
                                        <td>243</td>
                                        <td>18(33)</td>
                                        <td>531(27)</td>
                                        <td>5.1</td>
                                        <td>2.6(17.1)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">콘샐러드</th>
                                        <td>105</td>
                                        <td>189</td>
                                        <td>2(4)</td>
                                        <td>226(11)</td>
                                        <td>6.3</td>
                                        <td>1(9)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">크리미모짜볼(5조각)</th>
                                        <td>70</td>
                                        <td>198</td>
                                        <td>7(13)</td>
                                        <td>124(6)</td>
                                        <td>4</td>
                                        <td>1(4)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">크리미모짜볼(10조각)</th>
                                        <td>140</td>
                                        <td>395</td>
                                        <td>14(25)</td>
                                        <td>248(12)</td>
                                        <td>9</td>
                                        <td>1(9)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">트러플프라이</th>
                                        <td>146</td>
                                        <td>445</td>
                                        <td>10(19)</td>
                                        <td>496(25)</td>
                                        <td>0.3</td>
                                        <td>9(61)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">프렌치프라이(L)</th>
                                        <td>135</td>
                                        <td>377</td>
                                        <td>5(8)</td>
                                        <td>432(22)</td>
                                        <td>0.4</td>
                                        <td>4(27)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">프렌치프라이(R)</th>
                                        <td>102</td>
                                        <td>285</td>
                                        <td>4(6)</td>
                                        <td>326(16)</td>
                                        <td>0.3</td>
                                        <td>3(21)</td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </li>
                    <li class="">
                        <div class="acc_tit">
                            <p class="tit">
                            	<strong>BEVERAGES 음료</strong>
                            </p>
                            <button type="button" class="btn_acc"><span>contents show/hide</span></button>
                        </div>
                        <div class="acc_cont">
                            <table class="info_table st02">
                                <colgroup>
                                    <col>
                                    <col span="7" style="width: 11%;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col" class="alignl">제품명</th>
                                        <th scope="col">중량<br>(g/ml)</th>
                                        <th scope="col">열량<br>(Kcal)</th>
                                        <th scope="col">단백질<br>(g)</th>
                                        <th scope="col">나트륨<br>(mg)</th>
                                        <th scope="col">당류<br>(g)</th>
                                        <th scope="col">포화지방<br>(g)</th>
                                        <th scope="col">카페인<br>(mg)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">아메리카노</th>
                                        <td>227</td>
                                        <td>6</td>
                                        <td>0(0)</td>
                                        <td>0(0)</td>
                                        <td>0</td>
                                        <td>0(0)</td>
                                        <td>85.3</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">아이스아메리카노</th>
                                        <td>330</td>
                                        <td>5</td>
                                        <td>0(0)</td>
                                        <td>0(0)</td>
                                        <td>0</td>
                                        <td>0(0)</td>
                                        <td>124</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">아이스초코</th>
                                        <td>330</td>
                                        <td>253</td>
                                        <td>3(5)</td>
                                        <td>75(4)</td>
                                        <td>31</td>
                                        <td>4.3(28.4)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">핫초코 </th>
                                        <td>227</td>
                                        <td>210</td>
                                        <td>2(5)</td>
                                        <td>86(4)</td>
                                        <td>23</td>
                                        <td>4(25)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">제로톡톡 복숭아</th>
                                        <td>330</td>
                                        <td>0</td>
                                        <td>0(0)</td>
                                        <td>10(0)</td>
                                        <td>0.0</td>
                                        <td>0(0)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">제로톡톡 청포도</th>
                                        <td>330</td>
                                        <td>0</td>
                                        <td>0(0)</td>
                                        <td>10(0)</td>
                                        <td>0.0</td>
                                        <td>0(0)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">제로톡톡 체리</th>
                                        <td>330</td>
                                        <td>0</td>
                                        <td>0(0)</td>
                                        <td>10(0)</td>
                                        <td>0.0</td>
                                        <td>0(0)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">스프라이트(L)</th>
                                        <td>538</td>
                                        <td>237</td>
                                        <td>0(0)</td>
                                        <td>32(2)</td>
                                        <td>60.2</td>
                                        <td>0(0)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">스프라이트(R)</th>
                                        <td>376</td>
                                        <td>165</td>
                                        <td>0(0)</td>
                                        <td>23(1)</td>
                                        <td>42.1</td>
                                        <td>0(0)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">씨그램(L)</th>
                                        <td>538</td>
                                        <td>0</td>
                                        <td>0(0)</td>
                                        <td>16(1)</td>
                                        <td>0.0</td>
                                        <td>0(0)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">씨그램(R)</th>
                                        <td>376</td>
                                        <td>0</td>
                                        <td>0(0)</td>
                                        <td>11(1)</td>
                                        <td>0.0</td>
                                        <td>0(0)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">코카콜라(L)</th>
                                        <td>538</td>
                                        <td>215</td>
                                        <td>0(0)</td>
                                        <td>22(1)</td>
                                        <td>55.9</td>
                                        <td>0(0)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">코카콜라(R)</th>
                                        <td>376</td>
                                        <td>150</td>
                                        <td>0(0)</td>
                                        <td>15(1)</td>
                                        <td>39.1</td>
                                        <td>0(0)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">코카콜라 제로(L)</th>
                                        <td>538</td>
                                        <td>0</td>
                                        <td>0(0)</td>
                                        <td>43(2)</td>
                                        <td>0</td>
                                        <td>0(0)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">코카콜라 제로(R)</th>
                                        <td>376</td>
                                        <td>0</td>
                                        <td>0(0)</td>
                                        <td>30(2)</td>
                                        <td>0</td>
                                        <td>0(0)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">미닛메이드 오렌지(350ml PET)</th>
                                        <td>350</td>
                                        <td>172</td>
                                        <td>0(0)</td>
                                        <td>11(1)</td>
                                        <td>36</td>
                                        <td>0(0)</td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </li>
                    <li class="">
                        <div class="acc_tit">
                            <p class="tit">
                            	<strong>SWEETS 아이스크림</strong>
                            </p><button type="button" class="btn_acc"><span>contents show/hide</span></button>
                        </div>
                        <div class="acc_cont">
                            <table class="info_table st02">
                                <colgroup>
                                    <col>
                                    <col span="7" style="width: 11%;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col" class="alignl">제품명</th>
                                        <th scope="col">중량<br>(g/ml)</th>
                                        <th scope="col">열량<br>(Kcal)</th>
                                        <th scope="col">단백질<br>(g)</th>
                                        <th scope="col">나트륨<br>(mg)</th>
                                        <th scope="col">당류<br>(g)</th>
                                        <th scope="col">포화지방<br>(g)</th>
                                        <th scope="col">카페인<br>(mg)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">딸기선데</th>
                                        <td>175</td>
                                        <td>245</td>
                                        <td>3(6)</td>
                                        <td>124(6)</td>
                                        <td>38.9</td>
                                        <td>6.2(41.2)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">딸기바나나선데</th>
                                        <td>180</td>
                                        <td>256</td>
                                        <td>4(7)</td>
                                        <td>115(6)</td>
                                        <td>35.5</td>
                                        <td>3.9(26)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">바나나선데</th>
                                        <td>175</td>
                                        <td>266</td>
                                        <td>4(7)</td>
                                        <td>123(6)</td>
                                        <td>18.8</td>
                                        <td>4.9(32.9)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">바닐라선데</th>
                                        <td>175</td>
                                        <td>266</td>
                                        <td>4(7)</td>
                                        <td>123(6)</td>
                                        <td>18.8</td>
                                        <td>4.9(32.9)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">초코선데</th>
                                        <td>175</td>
                                        <td>248</td>
                                        <td>3(6)</td>
                                        <td>136(7)</td>
                                        <td>41.4</td>
                                        <td>1.8(12.1)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">초코바나나선데</th>
                                        <td>180</td>
                                        <td>254</td>
                                        <td>4(7)</td>
                                        <td>133(7)</td>
                                        <td>34.9</td>
                                        <td>3.9(25.9)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">컵 아이스크림</th>
                                        <td>110</td>
                                        <td>142</td>
                                        <td>2(5)</td>
                                        <td>89(4)</td>
                                        <td>19.5</td>
                                        <td>2.8(18.8)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">콘 아이스크림</th>
                                        <td>95</td>
                                        <td>133</td>
                                        <td>3(5)</td>
                                        <td>74(4)</td>
                                        <td>12.6</td>
                                        <td>2.1(14.3)</td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </li>
                    <li class="">
                        <div class="acc_tit">
                            <p class="tit">
                            	<strong>INGREDIENT 추가 메뉴</strong>
                            </p>
                            <button type="button" class="btn_acc"><span>contents show/hide</span></button>
                        </div>
                        <div class="acc_cont">
                            <table class="info_table st02">
                                <colgroup>
                                    <col>
                                    <col span="7" style="width: 11%;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col" class="alignl">제품명</th>
                                        <th scope="col">중량<br>(g/ml)</th>
                                        <th scope="col">열량<br>(Kcal)</th>
                                        <th scope="col">단백질<br>(g)</th>
                                        <th scope="col">나트륨<br>(mg)</th>
                                        <th scope="col">당류<br>(g)</th>
                                        <th scope="col">포화지방<br>(g)</th>
                                        <th scope="col">카페인<br>(mg)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">까망베르치즈소스[pouch]</th>
                                        <td>25</td>
                                        <td>132.5</td>
                                        <td>1(2)</td>
                                        <td>280(14)</td>
                                        <td>1.2</td>
                                        <td>2.3(15.1)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">디아블로소스[pouch]</th>
                                        <td>25</td>
                                        <td>39</td>
                                        <td>0(1)</td>
                                        <td>293(15)</td>
                                        <td>7.4</td>
                                        <td>0(0.1)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">스위트칠리소스</th>
                                        <td>25</td>
                                        <td>50</td>
                                        <td>0(0)</td>
                                        <td>205(10)</td>
                                        <td>10.2</td>
                                        <td>0(0)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">케찹 (pouch)</th>
                                        <td>10</td>
                                        <td>11</td>
                                        <td>0(0)</td>
                                        <td>107(5)</td>
                                        <td>2.3</td>
                                        <td>0(0)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">허니머스타드 (pouch)</th>
                                        <td>11</td>
                                        <td>32</td>
                                        <td>0(0)</td>
                                        <td>60(3)</td>
                                        <td>3.1</td>
                                        <td>0(0)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">버거패티추가</th>
                                        <td>42</td>
                                        <td>114</td>
                                        <td>8(15)</td>
                                        <td>199(10)</td>
                                        <td>0</td>
                                        <td>3.7(24.8)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">소불고기패티추가</th>
                                        <td>60</td>
                                        <td>181</td>
                                        <td>8(14)</td>
                                        <td>214(11)</td>
                                        <td>2.1</td>
                                        <td>5.5(37)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">스테이크패티추가</th>
                                        <td>60</td>
                                        <td>181</td>
                                        <td>8(14)</td>
                                        <td>214(11)</td>
                                        <td>2.1</td>
                                        <td>5.5(37)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">와퍼패티추가</th>
                                        <td>82</td>
                                        <td>223</td>
                                        <td>16(29)</td>
                                        <td>389(19)</td>
                                        <td>0</td>
                                        <td>7(48)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">롱베이컨 1장 추가</th>
                                        <td>6</td>
                                        <td>26</td>
                                        <td>2(3)</td>
                                        <td>50(2)</td>
                                        <td>0</td>
                                        <td>0.7(4.7)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">롱베이컨 2장 추가</th>
                                        <td>12</td>
                                        <td>53</td>
                                        <td>3(6)</td>
                                        <td>100(5)</td>
                                        <td>0</td>
                                        <td>1.5(9.5)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">치즈 1장 추가</th>
                                        <td>12</td>
                                        <td>41</td>
                                        <td>3(5)</td>
                                        <td>197(10)</td>
                                        <td>0</td>
                                        <td>2.2(14.7)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">할라피뇨 2개 추가</th>
                                        <td>10</td>
                                        <td>3</td>
                                        <td>0.04(0)</td>
                                        <td>54(3)</td>
                                        <td>0.5</td>
                                        <td>0(0)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">할라피뇨 4개 추가</th>
                                        <td>20</td>
                                        <td>6</td>
                                        <td>0.08(0)</td>
                                        <td>108(6)</td>
                                        <td>1</td>
                                        <td>0(0)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">구운갈릭 시즈닝</th>
                                        <td>3</td>
                                        <td>10</td>
                                        <td>0(0)</td>
                                        <td>130(7)</td>
                                        <td>1.9</td>
                                        <td>0(0)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">매콤치즈 시즈닝</th>
                                        <td>3</td>
                                        <td>10</td>
                                        <td>0(0)</td>
                                        <td>134(7)</td>
                                        <td>1.8</td>
                                        <td>0(0)</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">스윗어니언 시즈닝</th>
                                        <td>3</td>
                                        <td>9</td>
                                        <td>0(0)</td>
                                        <td>224(11)</td>
                                        <td>1.3</td>
                                        <td>0(0)</td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </li>
                    <li class="">
                        <div class="acc_tit">
                            <p class="tit">
                            	<strong>세트 최소~최대 열량</strong></p>
                            <button type="button" class="btn_acc"><span>contents show/hide</span></button>
                        </div>
                        <div class="acc_cont">
                            <table class="info_table st02">
                                <colgroup>
                                    <col>
                                    <col span="1" style="width: 77%;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col" class="alignl">제품명</th>
                                        <th scope="col">열량 (Kcal)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">BBQ몬스터</th>
                                        <td>760 ~ 1328</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">고추장버섯소불고기버거</th>
                                        <td>596 ~ 1164</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">고추장소불고기버거</th>
                                        <td>589 ~ 1157</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">기네스머쉬룸와퍼</th>
                                        <td>894 ~ 1446</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">기네스와퍼</th>
                                        <td>908 ~ 1460</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">기네스콰트로치즈와퍼</th>
                                        <td>1018 ~ 1570</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">기네스통베이컨와퍼</th>
                                        <td>989~1557</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">더블오리지널치즈버거</th>
                                        <td>629 ~ 1197</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">더블와퍼</th>
                                        <td>1064 ~ 1648</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">롱치킨버거</th>
                                        <td>801 ~ 1385</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">몬스터Ⅱ</th>
                                        <td>997 ~ 1565</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">몬스터Ⅱ통새우</th>
                                        <td>1016 ~ 1584</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">몬스터베이비XL</th>
                                        <td>792 ~ 1360</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">몬스터와퍼</th>
                                        <td>1185 ~ 1769</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">몬스터X</th>
                                        <td>1165 ~ 1733</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">바비큐킹치킨버거</th>
                                        <td>597 ~ 1149</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">베이컨치즈와퍼</th>
                                        <td>910 ~ 1494</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">스태커 2 와퍼</th>
                                        <td>1210 ~ 1778</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">스태커 3 와퍼</th>
                                        <td>1551 ~ 2119</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">스태커 4 와퍼</th>
                                        <td>1837 ~ 2405</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">아기상어 새우버거</th>
                                        <td>569 ~ 1137</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">아빠상어 새우버거</th>
                                        <td>704 ~ 1272</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">엄마상어 새우버거</th>
                                        <td>563 ~ 1131</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">와퍼</th>
                                        <td>750 ~ 1334</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">와퍼주니어</th>
                                        <td>529 ~ 1113</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">직화버섯소불고기버거</th>
                                        <td>592 ~ 1160</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">직화소불고기버거</th>
                                        <td>587 ~ 1156</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">치즈버거</th>
                                        <td>496 ~ 1080</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">치즈와퍼</th>
                                        <td>846 ~ 1430</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">치즈와퍼주니어</th>
                                        <td>568 ~ 1152</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">콰트로치즈와퍼</th>
                                        <td>900 ~ 1484</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">콰트로치즈X</th>
                                        <td>950 ~ 1519</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">콰트로치즈와퍼주니어</th>
                                        <td>576 ~ 1160</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">킹치킨버거</th>
                                        <td>662 ~ 1246</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">통베이컨와퍼</th>
                                        <td>983 ~ 1551</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">통새우와퍼</th>
                                        <td>871 ~ 1455</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">통새우X</th>
                                        <td>919 ~ 1488</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">통새우와퍼주니어</th>
                                        <td>511 ~ 1095</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">트러플머쉬룸와퍼</th>
                                        <td>868 ~ 1452</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">트러플머쉬룸와퍼주니어</th>
                                        <td>534 ~ 1118</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">햄버거</th>
                                        <td>436 ~ 1020</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </li>
                </ul>
            </div>
            <h2 class="tit01 font_s01 tit_ico info"><span>안내사항</span></h2>
            <div class="container02 pd02">
                <ol class="txtlist02 order st02">
                    <li><em class="num">1.</em><span>각 제품은 원재료의 수급 상황에 따라 구성성분이 다소 변경될 수도 있습니다.</span></li>
                    <li><em class="num">2.</em><span>표시된 영양분석표는 매장에서 판매되고 있는 모든 제품의 영양정보를 포함하지 못할 수도 있습니다.(신제품/ 특정계절 한시판매 제품/ 일부 매장 특별 판매 제품)</span></li>
                    <li><em class="num">3.</em><span>표시된 영양 구성성분은 실험방법 등에 따라 차이가 있을 수도 있습니다.</span></li>
                    <li><em class="num">4.</em><span>영양표 속의 모든 제품은 표준 용량이며, 실제 제공시 다소 차이가 있을 수 있습니다. </span></li>
                    <li><em class="num">5.</em><span>괄호안 %는 1일 영양소 기준치에 대한 비율입니다.</span></li>
                </ol>
            </div>
            <h2 class="tit01 font_s01 tit_ico allergy"><span>알레르기 유발 성분</span></h2>
            <div class="container02">
                <ul class="acc_list01">
                    <li class="">
                        <div class="acc_tit">
                            <p class="tit">
                            	<strong>BURGER</strong>
                            </p>
                            <button type="button" class="btn_acc"><span>contents show/hide</span></button>
                        </div>
                        <div class="acc_cont">
                            <table class="info_table st02">
                                <colgroup>
                                    <col style="width: 35%;">
                                    <col>
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col" class="alignl">제품명</th>
                                        <th scope="col">알레르기 유발 성분</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">BBQ몬스터</th>
                                        <td class="alignl">밀, 대두, 우유, 토마토, 닭고기, 쇠고기, 난류 </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">고추장버섯소불고기버거</th>
                                        <td class="alignl">밀, 대두, 우유, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">고추장소불고기버거</th>
                                        <td class="alignl">밀, 대두, 우유, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">기네스머쉬룸와퍼</th>
                                        <td class="alignl">밀, 대두, 우유, 돼지고기, 토마토, 쇠고기, 난류, 오징어</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">기네스와퍼</th>
                                        <td class="alignl">밀, 대두, 우유, 돼지고기, 토마토, 쇠고기, 난류, 오징어</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">기네스콰트로치즈와퍼</th>
                                        <td class="alignl">밀, 대두, 우유, 돼지고기, 토마토, 쇠고기, 난류, 오징어</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">기네스통베이컨와퍼</th>
                                        <td class="alignl">밀, 대두, 우유, 돼지고기, 토마토, 쇠고기, 난류, 오징어</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">더블오리지널치즈버거</th>
                                        <td class="alignl">밀, 대두, 우유, 토마토, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">더블와퍼</th>
                                        <td class="alignl">밀, 대두, 토마토, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">롱치킨버거</th>
                                        <td class="alignl">밀, 대두, 우유, 닭고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">몬스터Ⅱ</th>
                                        <td class="alignl">밀, 대두, 우유, 토마토, 닭고기, 쇠고기, 난류, 새우</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">몬스터Ⅱ통새우</th>
                                        <td class="alignl">밀, 대두, 우유, 토마토, 닭고기, 쇠고기, 난류, 새우</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">몬스터베이비XL</th>
                                        <td class="alignl">밀, 대두, 우유, 닭고기, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">몬스터와퍼</th>
                                        <td class="alignl">밀, 대두, 우유, 돼지고기, 토마토, 닭고기, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">몬스터X</th>
                                        <td class="alignl">밀, 대두, 우유, 돼지고기, 토마토, 닭고기, 쇠고기, 조개류, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">바비큐킹치킨버거</th>
                                        <td class="alignl">밀, 대두, 우유, 토마토, 닭고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">베이컨치즈와퍼</th>
                                        <td class="alignl">밀, 대두, 우유, 돼지고기, 토마토, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">스태커 2 와퍼</th>
                                        <td class="alignl">밀, 대두, 우유, 토마토, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">스태커 3 와퍼</th>
                                        <td class="alignl">밀, 대두, 우유, 토마토, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">스태커 4 와퍼</th>
                                        <td class="alignl">밀, 대두, 우유, 토마토, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">아기상어 새우버거</th>
                                        <td class="alignl">밀, 대두, 우유, 난류, 새우</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">엄마상어 새우버거</th>
                                        <td class="alignl">밀, 대두, 우유, 토마토, 닭고기, 쇠고기, 난류, 새우</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">아빠상어 새우버거</th>
                                        <td class="alignl">밀, 대두, 우유, 토마토, 쇠고기, 난류, 새우</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">와퍼</th>
                                        <td class="alignl">밀, 대두, 토마토, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">와퍼주니어</th>
                                        <td class="alignl">밀, 대두, 토마토, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">직화버섯소불고기버거</th>
                                        <td class="alignl">밀, 대두, 우유, 닭고기, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">직화소불고기버거 </th>
                                        <td class="alignl">밀, 대두, 우유, 닭고기, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">치즈버거</th>
                                        <td class="alignl">밀, 대두, 우유, 토마토, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">치즈와퍼</th>
                                        <td class="alignl">밀, 대두, 우유, 토마토, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">치즈와퍼주니어</th>
                                        <td class="alignl">밀, 대두, 우유, 토마토, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">콰트로치즈와퍼</th>
                                        <td class="alignl">밀, 대두, 우유, 토마토, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">콰트로치즈X</th>
                                        <td class="alignl">밀, 대두, 우유, 토마토, 닭고기, 쇠고기, 조개류, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">콰트로치즈와퍼주니어</th>
                                        <td class="alignl">밀, 대두, 우유, 토마토, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">킹치킨버거</th>
                                        <td class="alignl">밀, 대두, 우유, 닭고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">통베이컨와퍼</th>
                                        <td class="alignl">밀, 대두, 돼지고기, 토마토, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">통새우와퍼</th>
                                        <td class="alignl">밀, 대두, 우유, 토마토, 닭고기, 쇠고기, 난류, 새우</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">통새우X</th>
                                        <td class="alignl">밀, 대두, 우유, 토마토, 닭고기, 쇠고기, 조개류, 난류, 새우</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">통새우와퍼주니어</th>
                                        <td class="alignl">밀, 대두, 우유, 토마토, 닭고기, 쇠고기, 난류, 새우</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">트러플머쉬룸와퍼</th>
                                        <td class="alignl">밀, 대두, 우유, 돼지고기, 토마토, 닭고기, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">트러플머쉬룸와퍼주니어</th>
                                        <td class="alignl">밀, 대두, 우유, 돼지고기, 토마토, 닭고기, 쇠고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">햄버거</th>
                                        <td class="alignl">밀, 대두, 토마토, 쇠고기, 난류</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </li>
                    <li class="">
                        <div class="acc_tit">
                            <p class="tit">
                            	<strong>SIDES</strong>
                            </p>
                            <button type="button" class="btn_acc"><span>contents show/hide</span></button>
                        </div>
                        <div class="acc_cont">
                            <table class="info_table st02">
                                <colgroup>
                                    <col style="width: 35%;">
                                    <col>
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col" class="alignl">제품명</th>
                                        <th scope="col">알레르기 유발 성분</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">21치즈스틱</th>
                                        <td class="alignl">밀, 대두, 우유, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">너겟킹</th>
                                        <td class="alignl">밀, 대두, 닭고기, 쇠고기 </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">바삭킹</th>
                                        <td class="alignl">밀, 대두, 닭고기, 쇠고기</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">쉐이킹프라이 구운갈릭</th>
                                        <td class="alignl">밀, 대두, 우유, 토마토</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">쉐이킹프라이 매콤치즈</th>
                                        <td class="alignl">대두, 우유</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">쉐이킹프라이 스윗어니언</th>
                                        <td class="alignl">대두, 우유</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">어니언링</th>
                                        <td class="alignl">밀, 대두</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">치즈프라이</th>
                                        <td class="alignl">대두, 우유, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">코울슬로</th>
                                        <td class="alignl">난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">코코넛쉬림프</th>
                                        <td class="alignl">밀, 대두, 난류, 새우</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">콘샐러드</th>
                                        <td class="alignl">대두, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">크리미모짜볼</th>
                                        <td class="alignl">밀, 대두, 우유, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">트러플프라이</th>
                                        <td class="alignl">밀, 대두, 우유, 닭고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">프렌치프라이</th>
                                        <td class="alignl">대두</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </li>
                    <li class="">
                        <div class="acc_tit">
                            <p class="tit">
                            	<strong>BEVERAGES</strong></p>
                            <button type="button" class="btn_acc"><span>contents show/hide</span></button>
                        </div>
                        <div class="acc_cont">
                            <table class="info_table st02">
                                <colgroup>
                                    <col style="width: 35%;">
                                    <col>
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col" class="alignl">제품명</th>
                                        <th scope="col">알레르기 유발 성분</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">아이스초코</th>
                                        <td class="alignl">우유</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">핫초코</th>
                                        <td class="alignl">우유</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">제로톡톡 복숭아</th>
                                        <td class="alignl">복숭아</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </li>
                    <li class="">
                        <div class="acc_tit">
                            <p class="tit">
                            	<strong>SWEETS</strong>
                            </p>
                            <button type="button" class="btn_acc"><span>contents show/hide</span></button>
                        </div>
                        <div class="acc_cont">
                            <table class="info_table st02">
                                <colgroup>
                                    <col style="width: 35%;">
                                    <col>
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col" class="alignl">제품명</th>
                                        <th scope="col">알레르기 유발 성분</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">딸기선데</th>
                                        <td class="alignl">우유</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">딸기바나나선데</th>
                                        <td class="alignl">우유</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">바나나선데</th>
                                        <td class="alignl">우유</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">바닐라선데</th>
                                        <td class="alignl">우유</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">초코선데</th>
                                        <td class="alignl">대두, 우유</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">초코바나나선데</th>
                                        <td class="alignl">대두, 우유</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">컵 아이스크림</th>
                                        <td class="alignl">우유</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">콘 아이스크림</th>
                                        <td class="alignl">밀, 우유</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </li>
                    <li class="">
                        <div class="acc_tit">
                            <p class="tit">
                            	<strong>아침메뉴</strong>
                            </p>
                            <button type="button" class="btn_acc"><span>contents show/hide</span></button>
                        </div>
                        <div class="acc_cont">
                            <table class="info_table st02">
                                <colgroup>
                                    <col style="width: 35%;">
                                    <col>
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col" class="alignl">제품명</th>
                                        <th scope="col">알레르기 유발 성분</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">베이컨&amp;에그</th>
                                        <td class="alignl">밀, 대두, 우유, 돼지고기, 토마토, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">햄&amp;에그</th>
                                        <td class="alignl">밀, 대두, 우유, 돼지고기, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">해쉬브라운</th>
                                        <td class="alignl">밀, 대두</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </li>
                    <li class="">
                        <div class="acc_tit">
                            <p class="tit">
                            	<strong>Ingredient</strong>
                            </p>
                            <button type="button" class="btn_acc"><span>contents show/hide</span></button>
                        </div>
                        <div class="acc_cont">
                            <table class="info_table st02">
                                <colgroup>
                                    <col style="width: 35%;">
                                    <col>
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col" class="alignl">제품명</th>
                                        <th scope="col">알레르기 유발 성분</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">까망베르치즈소스 (pouch)</th>
                                        <td class="alignl">대두, 우유, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">디아블로소스 (pouch)</th>
                                        <td class="alignl">토마토</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">스위트칠리소스</th>
                                        <td class="alignl">대두, 토마토</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">케찹 (pouch)</th>
                                        <td class="alignl">토마토</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">허니머스타드 (pouch)</th>
                                        <td class="alignl">대두, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">버거패티추가</th>
                                        <td class="alignl">쇠고기</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">소불고기패티추가</th>
                                        <td class="alignl">밀, 대두, 쇠고기</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">스테이크패티추가</th>
                                        <td class="alignl">밀, 대두, 토마토, 닭고기, 쇠고기, 조개류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">와퍼패티추가</th>
                                        <td class="alignl">쇠고기</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">갈릭페퍼쉬림프 추가</th>
                                        <td class="alignl">대두, 새우</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">마요네즈 추가</th>
                                        <td class="alignl">대두, 난류</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">롱베이컨 추가</th>
                                        <td class="alignl">돼지고기</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">치즈 1장 추가</th>
                                        <td class="alignl">대두, 우유</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">구운갈릭 시즈닝</th>
                                        <td class="alignl">밀, 대두, 우유, 토마토</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">매콤치즈 시즈닝</th>
                                        <td class="alignl">대두, 우유</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">스윗어니언 시즈닝</th>
                                        <td class="alignl">우유</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>






