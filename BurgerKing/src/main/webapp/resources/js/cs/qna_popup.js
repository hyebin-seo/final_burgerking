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
	
	// 매장 선택 안함 눌렀을 때 disabled 시켜보자
	$(".storeNone").click(function () {
		
		//alert('선택');
		
		if(this.checked){
			$(".chosenStore").attr("disabled", true);
			$(".chosenStore").val(""); // input에 있는 값을 지워보자
			$(".btndisabled").attr("disabled", true);
		}else{
			$(".chosenStore").attr("disabled", false);
			$(".btndisabled").attr("disabled", false);
		}
	});

})


/*$(function(){
	 $("#fileUpload").change(function(){
	    console.log($("#fileUpload")[0].files);
	    fileList = $("#fileUpload")[0].files;
	    fileListTag = '';
	    //for(i = 0; i < fileList.length; i++){
	    //	fileListTag += "<li><div class ='att_file'><div class = 'file'><span class='file_name'>"+fileList[i].name+"</span></div><button type='button' class='btn04 del'><span>삭제</span></button></div></li>";
	    //}
	    //$('#fileList').html(fileListTag);
	});
});
*/

//input에 선택된 파일 업로드 (파일은 1개만 처리)
var onFileUpload = function(event) {
	var input = event.target;
	var file = input.files[0];
	console.log(input.files[0]);
	console.log(file.name);
	var fileListTag = "<li><div class ='att_file'><div class = 'file'><span class='file_name'>"+file.name+"</span></div><button type='button' class='btn04 del' onclick='resetFile()'><span>삭제</span></button></div></li>";
	$('#fileList').html(fileListTag);
};

//input 파일 초기화 시켜주는 버튼	
function resetFile() {
	alert('파일 삭제 ');
	const file = document.querySelector('input.file');
	file.value = '';
	console.log(file.name);
	$('#fileList > li').remove();
}


// 문의 접수하기 전에 데이터 체크 하기 
function dataCheck() {
	
	var email_check = $('input[name=qna_email]').val();
	var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
	
	if($("input[name='qna_name']").val() ==''){
		alert("이름을 입력하세요");
		return false;
	}
	else if($("input[name='qna_phone']").val() ==''){
		alert("연락처를 입력하세요"); 
		return false;
	}else if( !regExp.test($("input[name='qna_phone']").val())){
		alert("정확한 연락처를 입력하세요"); 
		return false;
	}
	else if($("input[name='qna_email']").val() ==''){
		alert("이메일을 입력하세요"); 
		return false;
	}else if(email_check == '' || email_check.indexOf('@') == -1 || email_check.indexOf('.') == -1) {
		alert("이메일을 정확히 입력하세요"); 
		return false;
	}
	else if($("input[name='qna_title']").val() ==''){
		alert("제목을 입력하세요"); 
		return false;
	}
	else if($("textarea[name='qna_content']").val() ==''){
		alert("내용을 입력하세요"); 
		return false;
	}
	else if($("input:checkbox[name=terms]").is(':checked') == false){
		alert("필수약관에 동의해 주세요.");
		return false;
	}
	
	return true;
}
