var auth_no;
var new_phoneNo;

$(function(){
	
	// 변경 버튼 클릭 이벤트
	$(".btn04.h02.m_rcen_btn.change").click(function() {
		
		// 변경 버튼 숨기기
		$(this).css("display","none");
		// 취소 버튼 보이기
		$(".cancel").css("display","");
		// 핸드폰 번호 입력창 보이기
		$(".auth_numWrap").css("display","");
		
	});
	
	// 취소 버튼 클릭 이벤트
	$(".btn04.h02.m_rcen_btn.cancel").click(function() {
		
		// 취소 버튼 숨기기
		$(this).css("display","none");
		// 변경 버튼 보이기
		$(".change").css("display","");
		// 핸드폰 번호 입력창 숨기기
		$(".auth_numWrap").css("display","none");
		
	});
	
	// 핸드폰 번호 입력창에 하나라도 입력되면 인증번호 발송 버튼 활성화
	$(document).on("propertychange change keyup paste input", ".auth_numWrap input", function () {
		
		// 입력내용 있으면 활성화
		if($(".auth_numWrap input").val().length!=0) {
			$(".auth_numWrap .btn04").prop("disabled",false);
		// 다시 지우면 비활성화
		} else {
			$(".auth_numWrap .btn04").prop("disabled",true);
		}
			
	});
	
	// 인증번호 발송 버튼 클릭 이벤트
	$(".sendSMS").click(function() {
		
		// 입력한 핸드폰 번호
		var newPhoneNo = $(".auth_numWrap input").val();
		// 핸드폰 번호 정규식
		var regExp = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		
		// 핸드폰 번호 양식에 맞을 때에만 문자 보내기 함수 실행
		if(!regExp.test($(".auth_numWrap input").val())) {
			alert("핸드폰 번호를 정확히 입력해 주세요");
		}else {
			sendSMS(newPhoneNo);
		}
		
	});
	
	// ************ 인증문자 발송 후 **************
	
	// 인증번호 입력창에 하나라도 입력되면 인증 버튼 활성화
	$(document).on("propertychange change keyup paste input", ".auth_numWrap>div:nth-child(2) input", function () {
		
		// 입력내용 있으면 활성화
		if($(this).val().length!=0) {
			$(".certify").prop("disabled",false);
		// 다시 지우면 비활성화
		} else {
			$(".certify").prop("disabled",true);
		}
			
	});
	
	// 인증 버튼 클릭 이벤트
	$(document).on("click", ".certify", function () {
		
		if(auth_no == $(".auth_numWrap>div:nth-child(2) input").val()) {
			// 보이는 핸드폰번호 바꾸기
			$(".phoneNo").html(new_phoneNo);
			// 입력창 지우기
			$(".auth_numWrap>div:nth-child(2) input").val("");
			// 변경 버튼 보이기
			$(".change").css("display","");
			// 취소 버튼 숨기기
			$(".cancel").css("display","none");
			// 핸드폰 번호 입력창 숨기기
			$(".auth_numWrap").css("display","none");
			
		}else {
			alert("인증번호가 일치하지 않습니다. 다시 입력해주세요")
		}	
	});
	
	// 변경 버튼 클릭 이벤트
	$(".submit").click(function() {
		changePhoneNo(new_phoneNo);
	});
	
});

// 입력한 핸드폰 번호로 인증문자를 발송하는 함수
function sendSMS(newPhoneNo) {
	// 기존 번호와 동일한지 확인
	$.ajax({
		url: "phoneNoCheck.do",
		type: "post",
		data: {"newPhoneNo": newPhoneNo},
		success: function(data) {
			if (data === "fail") {
				alert("기존 핸드폰 번호와 동일합니다.")
			} else {
				// 인증번호 발송
				$.ajax({
					url: "sendSMS.do",
					type: "post",
					data: {"newPhoneNo": newPhoneNo },
					success: function(data) {
						
						// 핸드폰번호 입력창 사라지고 인증번호 입력창이 보이게
						$(".auth_numWrap>div:nth-child(1)").css("display","none");
						$(".auth_numWrap>div:nth-child(2)").css("display","");
						// 인증 버튼 보이게
						$(".certify").prop("disabled",true);
						$(".certify").css("display","");
						
						alert(data.random);
						//check(data);
						
						auth_no = data.random;
						new_phoneNo = newPhoneNo;
					} //success 종료.
				});

			}

		}
	});
}

// 핸드폰 번호를 DB상에서 바꾸기
function changePhoneNo(new_phoneNo) {
	$.ajax({
		url: "phoneNoChange.do",
		type: "post",
		data: {"new_phoneNo": new_phoneNo},
		success: function(data) {
			alert("회원정보가 변경되었습니다");
		}
	});
}