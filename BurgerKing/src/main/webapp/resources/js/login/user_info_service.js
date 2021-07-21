




$(document).ready(function() {

	$('div.popWrap.m_FullpopWrap1').css('display', 'none');

	$('span.pop1').click(function() {
		$('div.popWrap.m_FullpopWrap1').css('display', 'block');
	})

	$('button.btn02.dark').click(function() {
		$('div.popWrap.m_FullpopWrap1').css('display', 'none');
	})

	$('button.btn02.agree').click(function() {
		$('div.popWrap.m_FullpopWrap1').css('display', 'none');
		$("#chk1").prop('checked', true);

	})

});

$(document).ready(function() {

	$('div.popWrap.m_FullpopWrap2').css('display', 'none');

	$('span.pop2').click(function() {
		$('div.popWrap.m_FullpopWrap2').css('display', 'block');
	})

	$('button.btn02.dark2').click(function() {
		$('div.popWrap.m_FullpopWrap2').css('display', 'none');
	})

	$('button.btn02.agree2').click(function() {
		$('div.popWrap.m_FullpopWrap2').css('display', 'none');
		$("#kch2").prop('checked', true);

	})

});

/*보인인증 확인*/

$(document).ready(function() {

	$('div.popWrap.m_FullpopWrap3').css('display', 'none');
	$('p.auth_check').css('display', 'none');

	$('a.btn01.auth').click(function() {
	    
	    if($('#chk1').is(':checked') && $('#kch2').is(':checked')){
	    
	    $('div.popWrap.m_FullpopWrap3').css('display', 'block');
		$('div.auth_check').css('display', 'none');
	    }else{
	     
	     alert('필수약관에 동의해주시길 바랍니다.');
	    
	    }
		
	})

	$('button.btn02.dark').click(function() {
		$('div.popWrap.m_FullpopWrap3').css('display', 'none');
	})



	$('button.btn02.auth').click(function() {
		alert('입력하신 메일로 송신했습니다.');
		$('div.auth_check').css('display', 'block')
		$('button.btn02.auth').css('display', 'none')


		var user_email = $("input.auth_real").val();	// #user_id에 입력되는 값

		/*	ajaxFunction(user_email);*/

		var data = { "user_email": user_email };


		$.ajax({
			url: "auth_mail.do",
			type: "post",
			data: data,
			success: function(data) {
				console.log("ajax 성공여부!!")

				check(data);

			} //success 종료.
		});



	})
	
	
	$('button.btn02.auth_agree').click(function() {

		var auth_fake = $("input.auth_fake").val();	// #user_id에 입력되는 값

		if (auth_real === auth_fake) {
			location.href = 'joins.do';
		} else {

			alert('확인되지 않는 번호입니다.')

		}


	});
	


});

/*function ajaxFunction(user_email) {

	$.ajax({
			url: "auth_mail.do",
			type: "post",
			data: {"user_email" : user_email},
			success: function(data) {
				console.log("ajax 성공여부!!")
				
				check(data);

			} //success 종료.
		});

}*/

var auth_real = "";

function check(jsonStr) {
	auth_real = jsonStr.random;

	alert(auth_real);
}

$(document).ready(function() {

	




});





/* 지금 부터 확인 유무 맞으면 들어갑니다. 여기서 무엇을 체크해야하냐 일단 */



/*check box 체크 유무!*/

$(document).ready(function() {

	$("#chkAll").click(function() {
		/*if ($("#chkAll").attr("checked")) {
			$(".first").attr("checked", true)
		}*/

		var checked_all = $("#chkAll").is(':checked');

		if (checked_all) {
			$(".check02").prop('checked', true);
		}
	})

})