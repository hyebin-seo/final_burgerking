	/**
 * 
 */




$(function() {
	var article1 = (".acc_list .open");
	$(".acc_list .btn_acc").click(function() {
		var myArticle1 = $(this).parents(".toggle");
		if ($(myArticle1).hasClass('acc_list')) {
			$(article1).removeClass('open').addClass('acc_list');
			$(myArticle1).removeClass('acc_list').addClass('open');
		} else {
			$(myArticle1).addClass('acc_list').removeClass('open');
		}
	});
});



$(document).ready(function() {

	var auth_real = "";
	var guest_phone = "";
	var guest_name = "";


	$('dl#authNumber.WEB.auth').css('display', 'none');
	$('em.tag.st02').css('display', 'none');

	$('button.btn01.l.m_btn01.move').click(function() {
		if ($('input.check02.auth').is(':checked')) {

			if ($('input.st02.name').val() != '') {

				if ($('input.st02.phone').val() != '' && $('input.st02.phone').val().length > 10) { /* 모든 입력사항이 들어왔을 때 본인인증을 하는 메서드. */

					$('dl#authNumber.WEB.auth').css('display', '');
					$('dl#WEBphone').css('display', 'none');
					$('div.move').css('display', 'none')
					$('div.check').css('display', 'block')
					$('input.st02.phone').prop('readonly','true');
					$('input.st02.name').prop('readonly','true');

					guest_phone = $("input.st02.phone").val();
					guest_name = $("input.st02.name").val();

					var data = { "guest_phone": guest_phone };

					$.ajax({
						url: "sendSms.do",
						type: "post",
						data: data,
						success: function(data) {
							console.log("ajax 성공여부!!")

							check(data);

						} //success 종료.
					});

				} else {
					alert('핸드폰 번호를 입력해주세요!')
				}

			} else {
				alert('받은 분의 이름을 입력해주세요.')

			}

		} else {
			alert('개인정보수집에 동의해주세요!');
		}

	});




	function check(jsonStr) {
		auth_real = jsonStr.random;
	
	}




	$('button.btn01.l.m_btn01.check').click(function() {
		var input_auth = $('input.st02.auth').val();

		if (input_auth != '') {
			if (input_auth === auth_real) {
				$('div.check').css('display',  'none');
				$('div.rerrange').css('display', '');
				$('em.tag.st02').css('display', '');
				$('input.st02.auth').prop('readonly','true');
			} else {
				alert('인증번호를 확인해주세요.')
			}

		} else {
			alert('인증번호를 입력해 주세요');
		}

	})
	
	
	$('button.btn01.l.m_btn01.rerrange').click(function() {
		
		location.reload;
		
	})


	/* 비밀번호 입력 후 DB에 guest 정보를 저장한다. */



	/*눈모양이 바뀌는 자바스크립트 
	$('button.btn_view01:first').click(function() {

	 if( $('input.st02.pwd:first').is(':password')){
	 $('input.st02.pwd:first').attr('type', 'text');
	 $('button.btn_view01:first').addClass('on');
    
	 }else{
	  $('input.st02.pwd:first').attr('type', 'password');
	  $('button.btn_view01:first').removeClass('on');
	 }
    
    
    
});	*/

	/* 코드를 줄일수 있는 방법은 무엇일까?*/

	$('button.btn_view01:first').click(function() {

		if ($('input.st02.pwd:first').is(':password')) {
			$('input.st02.pwd:first').attr('type', 'text');
			$('button.btn_view01:first').addClass('on');

		} else {
			$('input.st02.pwd:first').attr('type', 'password');
			$('button.btn_view01:first').removeClass('on');
		}



	})

	$('button.btn_view01:nth-child(1)').click(function() {

		alert('sns');


	})
})

function go() {
	let guest_pwd = $('input.st02.pwd').val();
	let pwd_check = $('input.st02.pwd_check').val();
	if (guest_pwd != '' && pwd_check != '') {
		if (guest_pwd === pwd_check) {

			


          var form = document.guest
          form.submit();



		} else {
			alert('비밀번호가 틀렸습니다.');
		}
	} else {
		alert('비밀번호를 입력해주세요');
	}

}


