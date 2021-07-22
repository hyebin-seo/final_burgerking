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

/*버튼 클릭시 input 내용 삭제*/
function del_name() { 
	

	var el = document.getElementsByClassName('name_clean')

	for(var i=0; i<el.length; i++){
		el[i].value = '';
		
}
}

function del_tel() { 
		
		var el = document.getElementsByClassName('tel_clean')

		for(var i=0; i<el.length; i++){
			el[i].value = '';
			
}
}

function del_email() { 
	

	var el = document.getElementsByClassName('email_clean')

	for(var i=0; i<el.length; i++){
		el[i].value = '';
		
}
}


function qna_ok() { 

	window.close();
	window.open("qna_ok.do", "qna_ok", "width=300, height=200, left=800, top=100, scrollbars=no, menubar=no, toolbar=no,  location=no, resizable=yes"); 

}


/*텍스트 area keyup시 글자수 세기*/
$(function() {
    $('#text_content').keyup(function (e){
        var content = $(this).val();
        //$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $('.page_count').html(content.length + '/1000');
    });
    $('text_content').keyup();
});


/*약관 토글 */
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


$(document).ready(function() {

	$("input#chkAll").click(function() {
		
		var checked_all = $("#chkAll").is(':checked');

		if (checked_all) {
			$(".check02").prop('checked', true);
		}else{
			$(".check02").prop('checked', false);
		}
	})
	
	
	$(".check02").click(function() {
	
		 let count = $("input:checkbox[name=chk]:checked").length;
		 
		 if(count<4){
		  $("#chkAll").prop('checked',false);
		 }else{
		 $("#chkAll").prop('checked',true);
		 }
	})

})


/*$(function(){
	
	var count = 0;
	
	
	//여기부터
    $("#fileUpload").change(function(){
    	 count++;
    	 console.log($("#fileUpload")[0].files);
    	 fileList = $("#fileUpload")[0].files;
    	 
    	 if(count > 3) {
    		 alert("파일은 최대 3개까지만 첨부 가능합니다.");
    		 return;
    	 }
    	 
    	 alert(fileList[0].name);
    	 
    	 if($(".cls").val().length == 0) {
    		 $(".cls").val(fileList[0].name);
    	 }else {
    		 $(".cls").val($(".cls").val()+","+fileList[0].name);
    	 }
    	 
    	 alert($(".cls").val());
    	 fileListTag = '';
    	    for(i = 0; i < count; i++){
    	        fileListTag += "<li><div class ='att_file'><div class = 'file'><span class='file_name'>"+$(".cls").val().split(",")[i]+"</span></div><button type='button' class='btn04 del'><span>삭제</span></button></div></li>";
    	    }
    	    $('#fileList').html(fileListTag);
    });
    //여기까지
});*/


/*$(function(){
	 $("#fileUpload").change(function(){
	    console.log($("#fileUpload")[0].files);
	    fileList = $("#fileUpload")[0].files;
	    fileListTag = '';
	    for(i = 0; i < fileList.length; i++){
	    	fileListTag += "<li><div class ='att_file'><div class = 'file'><span class='file_name'>"+fileList[i].name+"</span></div><button type='button' class='btn04 del'><span>삭제</span></button></div></li>";
	    }
	    $('#fileList').html(fileListTag);
	});
});
*/




