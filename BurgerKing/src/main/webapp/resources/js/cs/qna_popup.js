const popup = document.querySelector(".qnaPopWrap");
const closeBtn = document.querySelector(".btn_close");
const open_Btn = document.querySelector(".btn01");

//가맹점 신청 팝업 띄우기 액션
open_Btn.addEventListener('click', onPopup);

//가맹점 신청 팝업 X버튼 액션
closeBtn.addEventListener('click', offPopup);

function offPopup() {
	popup.style.display ='none';
}

function onPopup() {
	popup.style.display ='block';
}
function del_text() { 
	

	var el = document.getElementsByClassName('st02')

	for(var i=0; i<el.length; i++){
		el[i].value = '';
		
}
}

function del_text2() { 
		

		var el = document.getElementsByClassName('st02-2')

		for(var i=0; i<el.length; i++){
			el[i].value = '';
			
}
}

function del_text3() { 
	

	var el = document.getElementsByClassName('st02-3')

	for(var i=0; i<el.length; i++){
		el[i].value = '';
		
}
}

function open_toggle() { 

	 

}

function qna_ok() { 

	window.close();
	window.open("qna_ok.do", "qna_ok", "width=300, height=200, left=800, top=100, scrollbars=no, menubar=no, toolbar=no,  location=no, resizable=yes"); 

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


