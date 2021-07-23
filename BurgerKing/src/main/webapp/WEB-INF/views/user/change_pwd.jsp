<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>로그인</title>
<!-- 파비콘 -->
<link rel="shortcut icon" type="image/x-icon"
	href="resources/img/main/fab.ico">

<!-- 눈 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- Lgoin.css 연결 -->
<link rel="stylesheet" href="resources/css/user/pwdChange.css">




<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/javascript" src="resources/js/login/change_pwd.js">

</script>

</head>
<body>
	 <div class="subWrap">
        <div class="headerWrap">
            <div class="web_container02"><h1 class="logo">버거킹 Logo</h1></div>
        </div>
        <!-- contents section -->
        <div class="contentsWrap">
            
            <div class="contentsBox01">
                <!-- web container -->
                <div class="web_container02">
                    <!-- sub page title -->
                    <div class="subtitWrap m_bg_basic">
                        <h2 class="page_tit">비밀번호 변경</h2>
                    </div>
                    <!-- //sub page title -->
                    
                    <!-- sub page contents -->
                    <form action="auth_pwdOk.do" method="post" name="auth">
                    <div class="container01">
                        <h3 class="tit01 tit_ico key"><span>비밀번호 입력</span></h3>
                        <div class="container02">
                            <div class="dlist01 m_dlist02">
                                <dl>
                                    <dt class="vtop">새 비밀번호</dt>
                                    <dd>
                                        <div class="inpbox">
                                            <label><input type="password" id="newPassword" class="st02" placeholder="새 비밀번호 확인" name="user_pwd">
                                                <!-- <button type="button" class="btn_view01 on"><span>입력 텍스트 보기</span></button> -->
                                            </label>
                                            <p class="txt " id="pwText1"><span>새 비밀번호 확인에 비밀번호를 입력해 주세요.</span></p>
                                        </div>
                                        <div class="inpbox">
                                            <label><input type="password" id="confirmPassword" class="st02" placeholder="새 비밀번호 확인">
                                                <!-- <button type="button" class="btn_view01 on"><span>입력 텍스트 보기</span></button> -->
                                            </label>
                                            <p class="txt " id="pwText2"><span>새 비밀번호 확인에 비밀번호를 입력해 주세요.</span></p> 
                                            <input type="hidden" value="${user_id }" name="user_id">
                                        </div>
                                    </dd>
                                </dl>
                            </div>
                            
                            <ul class="txtlist01">
                                <li>비밀번호는 숫자와영문, 특수문자를 조합하여 10~20자리로 입력하세요."</li>
                                <li>비밀번호는 대소문자 입력을 구분합니다.</li>
                                <li>띄어쓰기가 들어가거나 로그인 아이디와 같은 비밀번호는 입력하실 수 없습니다.</li>
                                <li>숫자를 연속으로 나열하거나, 키보드 배열, 생년월일과 전화번호 등 추측하기 쉬운 정보로 이루어진 비밀번호 조합은 사용하지 않는 것이 안전합니다.</li>
                            </ul>
                        </div>
                        
                        <div class="c_btn">
                            <button  type="button" id="btnSave" class="btn01 m red"><span>변경</span></button>
                        </div>
                        <!-- //tab contents -->
                    </div>
                    </form>
                    <!-- //sub page contents -->
                </div>
                <!-- //web container -->
            </div>
        </div>
        <!-- //contents section -->
    </div>
	
</body>
</html>