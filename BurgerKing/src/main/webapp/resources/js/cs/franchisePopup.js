const popup = document.querySelector(".franchisePopWrap");
const closeBtn = document.querySelector(".btn_close");
const open_Btn = document.querySelector(".btn01");

//주소찾기 팝업 띄우기 액션
open_Btn.addEventListener('click', onPopup);

//주소찾기 팝업 X버튼 액션
closeBtn.addEventListener('click', offPopup);

function offPopup() {
	popup.style.display ='none';
}

function onPopup() {
	popup.style.display ='block';
}

$(function(){  
    var article1 = (".acc_list .open");  
    $(".acc_list .btn_acc").click(function() {  
       var myArticle1 =$(this).parents(".toggle"); 
        if($(myArticle1).hasClass('acc_list')) {  
            $(article1).removeClass('open').addClass('acc_list');  
            $(myArticle1).removeClass('acc_list').addClass('open');  
        }  
        else {  
            $(myArticle1).addClass('acc_list').removeClass('open');  
        }  
    });  
}); 

$(function() {
    $('#text_content').keyup(function (e){
        var content = $(this).val();
        //$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $('.page_count').html(content.length + '/500');
    });
    $('text_content').keyup();
});

$(document).ready(function () {
	
	$(document).on("click", "input[type=radio]", function () {
		$("input[type=radio]").prop("checked", false);
		$(this).prop("checked", true);
		
		if($(this).val() == "N") {
			$(".area").attr("disabled",true);
		} else {
			$(".area").attr("disabled",false);
		}
	});
});