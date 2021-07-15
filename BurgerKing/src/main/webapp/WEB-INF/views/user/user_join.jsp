<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<title>버거킹</title>

<!-- 파비콘 -->
<link rel="shortcut icon" type="image/x-icon"
	href="resources/img/main/fab.ico">
	
	<!-- Lgoin.css 연결 -->
<link rel="stylesheet" href="resources/css/user/join.css">
	


<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/javascript">

</script>

<script>

	/* 우편번호 함수 */
	function findAddr(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	
	        	console.log(data);
	        	
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('zipcode').value = data.zonecode;
	           	document.getElementById('addr1').value = data.address;
	        }
	    }).open();
	}
		
</script>	


</head>
<body>

   <jsp:include page="../header.jsp" />

	
	<div>
		<!-- 아이디, 비번, 이름, 연락처, 주소, 성별 -->
		<h3 style="text-align: center; padding-top: 10vh;">JOIN</h3>
		
		<form method="post" action="<%=request.getContextPath()%>/join_Ok.do" style="width: 25%; margin: auto; padding-top: 5vh;">
	  		<div class="mb-3">
	    		<label for="id" class="form-label">아이디</label>
	    		<input type="email" name="user_id" required class="form-control" id="user_id" placeholder="아이디(이메일)를 입력해주세요!" >
	    		<!-- 아이디 중복체크 결과 들어갈 부분 -->
	  			<span class="id_check_result1">엄청나게 이쁜 아이디입니다!!</span>
	  			<span class="id_check_result2">아이디가 이미 존재합니다.</span>
	  		</div>
	  		
	  		<div class="mb-3">
	    		<label for="pwd" class="form-label">비밀번호</label>
	    		<input type="password"  name="user_pwd" required class="form-control pwd_check" id="pwd">
	  		</div>
	  		
			<div class="mb-3">
	    		<label for="pwd_check" class="form-label">비밀번호 확인</label>
	    		<input type="password" name="user_pwd_check" required class="form-control pwd_check" id="pwd_check">
	  			<span class="pwd_check_result">비밀번호가 일치하지 않습니다.</span>
	  			<span class="pwd_check_result1">아주멌진 비밀번호입니다!</span>
	  		</div>
			
			<div class="mb-3">
	    		<label for="name" class="form-label">이름</label>
	    		<input type="text" name="user_name" required class="form-control" id="name">
	  		</div>
	  		
	  		<div class="mb-3">
	    		<label for="phone" class="form-label">연락처</label>
	    		<input type="text" name="user_phone" required class="form-control" id="phone" aria-describedby="emailHelp">
	    		<!-- <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div> -->
	  		</div>
	  		
	  		
	  		<div class="mb-3">
	  			<label style="display: block; " for="addr" class="form-label">주소</label>
	  			
	  			<div class="mb-3" id="addr">
	  				<div class="input-group mb-3">
						<input name="user_zipcode" id="zipcode" class="form-control" placeholder="우편번호" required>
						<button class="btn btn-secondary" type="button"
							    onclick="findAddr()">우편번호 검색</button>
					</div>
	    			<input name="user_addr1" required class="form-control" id="addr1" placeholder="도,시,구,도로명">
	    			<input name="user_addr2" required class="form-control" id="addr2" placeholder="상세주소를 입력해주세요.">
	  			</div>
	  		</div>
	  		
	  		
	  		<div class="mb-3">
	    		<label for="radio" class="form-label">성별</label>
	    		
	    		<div class="mb-3" id="radio">
		    		<div class="form-check form-check-inline">
	  					<input class="form-check-input" required type="radio" name="user_gender" id="inlineRadio1" value="남자">
					    <label class="form-check-label" for="inlineRadio1">남자</label>
					</div>
					<div class="form-check form-check-inline">
					    <input class="form-check-input" type="radio" name="user_gender" id="inlineRadio2" value="여자">
					    <label class="form-check-label" for="inlineRadio2">여자</label>
					</div>
				</div>
	  		</div>
			
			<div class="d-grid gap-2">
				<button class="btn btn-primary" type="submit" style="background-color: black;">join</button>
			</div>
		</form>
		
		

		
	</div>
	<br><br>
	<jsp:include page="../footer.jsp" />



<script type="text/javascript" src="resources/js/login/join.js"></script>
</body>


</html>