/**
* 
*/



$(document).ready(function() {





	$('div.tab_cont').hide();
	$("div.tab_cont:first").show()


	$('ul.item2 li').click(function() {

		$('ul.item2 li').removeClass('on');
		$(this).addClass('on');
		$("div.tab_cont").hide(); //Hide all tab content


		var onTab = $(this).find('a').attr('href');

		$(onTab).fadeIn();
		return false;


	});

	$('button.btn_view01').click(function() {


		if ($('input.user_pwd').is(':password')) {
			$('input.user_pwd').attr('type', 'text');
			$('button.btn_view01').addClass('on');

		} else {
			$('input.user_pwd').attr('type', 'password');
			$('button.btn_view01').removeClass('on');
		}



	});





})



/* 눈 이미지 아이콘 바꾸기 */


$(document).ready(function() {


})/*메서드 종료*/




function go() {

	var form = document.form

	form.submit();

}



$(document).ready(function() {


	$("a.btn01.l.inquiry").click(function() {

		let order_no = $('input.order_no').val();
		let order_pwd = $('input.order_pwd').val();



		$.ajax({

			url: 'order_check.do',
			type: 'post',
			data: {
				"order_no": order_no,
				"order_pwd": order_pwd
			},
			success: function(data) {

                
				if (data != 'success') {
				let html  ="";
					$('div.popWrap.m_FullpopWrap3').css('display', 'block');
					html += '<tr>';
					html += '<td colspan="3">데이터가 없습니다.</td>';
					html += '<td></td>';
					html += '<td></td>';
					html += '</tr>';
					
					$(".bodyHtml").append(html);

				} else {

				}


			}


		})  /* ajax 끝!  */

	})


})


$(document).ready(function() {



	


	$('div.popWrap.m_FullpopWrap3').css('display', 'none');


	$('button.btn02.dark').click(function() {
		$('div.popWrap.m_FullpopWrap3').css('display', 'none');
	})
	$('button.btn02.auth_agree').click(function() {
		$('div.popWrap.m_FullpopWrap3').css('display', 'none');

	})
});

























