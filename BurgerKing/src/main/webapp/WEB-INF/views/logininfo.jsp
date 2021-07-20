<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인인포</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
html, div, body, h3 {
	margin: 0;
	padding: 0;
}

h3 {
	display: inline-block;
	padding: 0.6em;
}
</style>
<script type="text/javascript">
    $(document).ready(function() {
        var name = ${result}.response.name;
        var email = ${result}.response.email;
        $("#name").html("환영합니다. "+name+"님");
        $("#email").html(email);
      });
</script>
</head>
<body>
	<!-- 세션에서 token을 가져와서 출력한다. -->
	${sessionScope.token}
	
	
	<c:if test="${userId ne null}">
        <h1>${userId}님 로그인 성공입니다</h1>
        <h1>${nickname}님 로그인 성공입니다</h1>
        
        <input type="button" value="로그아웃" onclick="location.href='logout.do'">
    </c:if>


	<br>
	<br>
	<br>

     <h2>++++++++++++++++++++++++++++++++++네이버!+++++</h2>
	<div
		style="background-color: #15a181; width: 100%; height: 50px; text-align: center; color: white;">
		<h3>SIST Naver_Login Success</h3>
	</div>
	<br>
	<h2 style="text-align: center" id="name"></h2>
	<h4 style="text-align: center" id="email"></h4>

</body>
</html>


