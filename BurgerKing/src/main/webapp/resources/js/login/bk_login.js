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

		var newForm = document.createElement('form'); 
		
		newForm.name = 'newForm'; 
		newForm.method = 'post'; 
		newForm.action = 'order_check.do'; 
		
		var input1 = document.createElement('input');
		var input2 = document.createElement('input');
		
		input1.setAttribute("type", "hidden");
		input1.setAttribute("name", "order_no");
		input1.setAttribute("value", order_no);
		
		input2.setAttribute("type", "hidden");
		input2.setAttribute("name", "order_pwd");
		input2.setAttribute("value", order_pwd);

		newForm.appendChild(input1);
		newForm.appendChild(input2);
		
		document.body.appendChild(newForm);
		
		newForm.submit();

		/*$.ajax({

			url: 'order_check.do',
			type: 'post',
			data: {
				"order_no": order_no,
				"order_pwd": order_pwd
			},
			success: function(data) {

				let dto = data.dto;
				let order_claim = data.order_claim;
				let order_no = data.order_no;


				if (dto == 1) {
					let html = "";
					$('div.popWrap.m_FullpopWrap3').css('display', 'block');
					html += '<tr>';
					html += '<td colspan="3" align="center">주문내역이 존재하지 않습니다.</td>';
					html += '</tr>';

					$(".bodyHtml").append(html);

				} else {

					let html = "";
					$('div.popWrap.m_FullpopWrap3').css('display', 'block');
					html += '<tr>';
					html += '<td style="width:20%;">' + order_no + '</td>';
					html += '<td style="width:20%;">' + order_claim + '</td>';
					html += '<td>' + dto + '</td>';
					html += '</tr>';

					$(".bodyHtml").append(html);
				}



			}


		})   ajax 끝!  */

	});


});


$(document).ready(function() {






	$('div.popWrap.m_FullpopWrap3').css('display', 'none');


	$('button.btn02.dark').click(function() {
		$('div.popWrap.m_FullpopWrap3').css('display', 'none');
		location.reload();
	})
	$('button.btn02.auth_agree').click(function() {
		$('div.popWrap.m_FullpopWrap3').css('display', 'none');
		location.reload();

	})
});

























