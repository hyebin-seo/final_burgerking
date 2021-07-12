<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>


$(document).ready(function(){
	
	$("#chkAll").click(function() {
		/*if ($("#chkAll").attr("checked")) {
			$(".first").attr("checked", true)
		}*/
		
		var checked_all = $("#chkAll").is(':checked');
		
		if(checked_all) {
			$(".sub_chk").prop('checked', true);
		} 
	})
}) 
	
	


	 
	 function checkBoxArr() {
		
		 var checkArr  = [];
		 $("input[name='check']:checked").each(function(i){
			 
			 checkArr.push($(this).val());
			 
			 
		 });
		 
		console.log(checkArr);
		 
		 $.ajax({

		        url: 'join.do'

		        , type: 'post'


		        , data: {

		            chk : checkArr

		        }

		    });
		 
	}
	
</script>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

ul>li {
	list-style: none
}

a {
	text-decoration: none;
}

.clearfix::after {
	content: "";
	display: block;
	clear: both;
	padding: 0;
}

#joinForm {
	width: 460px;
	margin: 0 auto;
}

ul.join_box {
	border: 1px solid #ddd;
	background-color: #fff;
	padding: 0;
}

.checkBox, .checkBox>ul {
	position: relative;
}

.checkBox>ul>li {
	float: left;
}

.checkBox>ul>li:first-child {
	width: 85%;
	padding: 15px;
	font-weight: 600;
	color: #888;
}

.checkBox>ul>li:nth-child(2) {
	position: absolute;
	top: 50%;
	right: 30px;
	margin-top: -12px;
}

.checkBox textarea {
	width: 96%;
	height: 90px;
	margin: 0 2%;
	background-color: #f7f7f7;
	color: #888;
	border: none;
}

.footBtwrap {
	margin-top: 15px;
	text-align: center;
}

.footBtwrap>li {
	float: left;
	width: 50%;
	height: 60px;
}

.footBtwrap>li>button {
	display: block;
	width: 100%;
	height: 100%;
	font-size: 20px;
	text-align: center;
	line-height: 60px;
}

.fpmgBt1 {
	background-color: #fff;
	color: #888
}

.fpmgBt2 {
	background-color: lightsalmon;
	color: #fff
}

.footBtwrap clearfix {
	padding: 0;
}
</style>
</head>


<body>

	<jsp:include page="header.jsp" />

	<form action="join.do" id="joinForm">
		<ul class="join_box">
			<li class="checkBox check01">
				<ul class="clearfix" style="padding: 0;">
					<li>이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내 메일 수신(선택)에 모두
						동의합니다.</li>
					<li class="checkAllBtn"><input type="checkbox" name="chk" id="chkAll" class="chkAll" value="0"></li>
				</ul>
			</li>
			<li class="checkBox check02">
				<ul class="clearfix" style="padding: 0;">
					<li>이용약관 동의(필수)</li>
					<li class="checkBtn"><input type="checkbox" name="chk" class="sub_chk"
						value="1"></li>
				</ul> <textarea name="" id="">여러분을 환영합니다.
버거킹 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 버거킹 서비스의 이용과 관련하여 버거킹 서비스를 제공하는 버거킹 주식회사(이하 ‘버거킹’)와 이를 이용하는 버거킹 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 버거킹 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
   </textarea>
			</li>
			<li class="checkBox check03">
				<ul class="clearfix" style="padding: 0;">
					<li>개인정보 수집 및 이용에 대한 안내(필수)</li>
					<li class="checkBtn"><input type="checkbox" name="chk" class="sub_chk"
						value="2"></li>
				</ul> <textarea name="" id="">여러분을 환영합니다.
버거킹 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 버거킹 서비스의 이용과 관련하여 버거킹 서비스를 제공하는 버거킹 주식회사(이하 ‘버거킹’)와 이를 이용하는 버거킹 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 버거킹 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
   </textarea>
			</li>
			<li class="checkBox check03">
				<ul class="clearfix" style="padding: 0;">
					<li>위치정보 이용약관 동의(선택)</li>
					<li class="checkBtn"><input type="checkbox" name="chk" class="sub_chk"
						value="3"></li>
				</ul> <textarea name="" id="">여러분을 환영합니다.
버거킹 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 버거킹 서비스의 이용과 관련하여 버거킹 서비스를 제공하는 버거킹 주식회사(이하 ‘버거킹’)와 이를 이용하는 버거킹 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 버거킹 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
   </textarea>
			</li>
			<li class="checkBox check04">
				<ul class="clearfix" style="padding: 0;">
					<li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
					<li class="checkBtn"><input type="checkbox" name="chk"  class="sub_chk"
						value="4"></li>
				</ul>

			</li>
		</ul>
		<ul class="footBtwrap clearfix" style="padding: 0;">
			<li><button class="fpmgBt1">비동의</button></li>
			<li><button class="fpmgBt2">동의</button></li>
		</ul>
	</form>




</body>
</html>