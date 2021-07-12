


//아이디 중복검사
$('#user_id').keyup(function() {



	console.log("keyup 테스트");

	var user_id = $("#user_id").val();		       // #user_id에 입력되는 값
	var data = { user_id: user_id }				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'

	$.ajax({
		url: "idcheck.do",
		type: "post",
		data: data,

		success: function(result) {
			console.log("ajax 성공여부!!")



			if (result != 'fail') {
				$('.id_check_result1').css("display", "inline-block");
				$('.id_check_result2').css("display", "none");
			} else {
				$('.id_check_result2').css("display", "inline-block");
				$('.id_check_result1').css("display", "none");
			}

		} //success 종료.
	});

});
// ajax 종료	



//비밀번호 중복확인








$("#pwd_check").keyup(function() {



var pwd = $("#pwd").val();

var pwd_check = $("#pwd_check").val();

console.log("chekck>>"+pwd_check);
console.log("pwd>>"+pwd);

	if (pwd_check != null) {

		console.log("keyup 테스트");
		console.log("123>>"+pwd);


		if (pwd != pwd_check) {
			$('.pwd_check_result').css("display", "inline-block");
			$('.pwd_check_result1').css("display", "none");

		} else {
			$('.pwd_check_result').css("display", "none");
			$('.pwd_check_result1').css("display", "inline-block");
		}


	} else {
		$('.pwd_check_result').css("display", "none");
		$('.pwd_check_result1').css("display", "none");
		console.log("none>>"+pwd);

	}




});












