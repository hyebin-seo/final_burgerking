const popup = document.querySelector(".faqWritePopWrap");
const closeBtn = document.querySelector(".btn_close");
const open_Btn = document.querySelector(".btn_list");

//가맹점 신청 팝업 띄우기 액션
open_Btn.addEventListener('click', onPopup);

//가맹점 신청 팝업 X버튼 액션
closeBtn.addEventListener('click', offPopup);

function offPopup() {
	popup.style.display ='none';
	window.parent.location.reload();
	window.close();
}

function onPopup() {
	popup.style.display ='block';
}


/*//문의 접수하기 전에 데이터 체크 하기 
function dataCheck() {
	
	if($("input[name='faq_title']").val() ==''){
		alert("제목을 입력하세요"); 
		return false;
	}
	else if($("textarea[name='faq_cont']").val() ==''){
		alert("내용을 입력하세요"); 
		return false;
	}
	
	return true;
}*/

/*텍스트 area keyup시 글자수 세기*/
$(function() {
    $('#text_content').keyup(function (e){
        var content = $(this).val();
        //$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $('.page_count').html(content.length + '/1000');
    });
    $('text_content').keyup();
});
