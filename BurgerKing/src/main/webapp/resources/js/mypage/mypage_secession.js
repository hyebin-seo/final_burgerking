$(function(){
	
	// 탈퇴 전 내용 동의 체크했을 때만 탈퇴 버튼 활성화
	$(document).on("click", "input[class='check02']", function () {
		
		// 누르면 활성화
		if($(".c_btn>button:nth-child(2)").attr("disabled")) {
			$(".c_btn>button:nth-child(2)").addClass("red");
			$(".c_btn>button:nth-child(2)").prop("disabled", false);
		// 다시 누르면 다시 비활성화
		} else {
			$(".c_btn>button:nth-child(2)").removeClass("red");
			$(".c_btn>button:nth-child(2)").prop("disabled", true);
		}
		
	});
	
	// 회원탈퇴 버튼 클릭 이벤트
	$(".submit").click(function() {
		
		if($("#selectBox option:selected").attr("disabled")) {
			alert("탈퇴 사유를 입력해주세요.");
		}else {
			if(confirm("버거킹 회원 탈퇴를 하시겠습니까?")){
				location.href="secSuccess.do";
			}else{
				return;
			}
		}
		
	});
	
	
});