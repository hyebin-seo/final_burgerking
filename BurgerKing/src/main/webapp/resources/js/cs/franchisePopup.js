const popup = document.querySelector(".franchisePopWrap");
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

/*텍스트 area keyup시 글자수 세기*/
$(function() {
    $('#text_content').keyup(function (e){
        var content = $(this).val();
        //$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $('.page_count').html(content.length + '/500');
    });
    $('text_content').keyup();
});

/*임대차 시설 없을 때 면적 입력 disabled*/
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
	
	//특별/광역시 셀렉트 박스 이벤트
   $(document).on("change", ".city_select", function () {
	   gunguSetting($(this).val()+"");
   });
});

function gunguSetting(parentkey) {
	$.ajax({
        url : "gungu_open.do",
        data : {"parentkey" : parentkey},
        type : "post",
        async : false,
        success : function(data){
        	var gungulist = data.gungu;
         	
        	var gunguStr = "<option value=''>군, 구</option>";
            $.each(gungulist , function(i, gungu){
                gunguStr += "<option value='"+gungu.lockey+"'>"+gungu.name+"</option>";
            });
            
            $(".gungu_select").html(gunguStr);
        },
        error : function(request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
}




function dataCheck() {
		
		var email_check = $('input[name=fran_email]').val();

		if($("input[name='fran_name']").val() ==''){
			alert("이름을 입력하세요");
			return false;
		}
		else if($("select[name='year']").val() == null){
			alert("생년월일을 선택하세요"); 
			return false;
		}
		else if($("select[name='month']").val() == null){
			alert("생년월일을 선택하세요"); 
			return false;
		}
		else if($("select[name='day']").val() == null){
			alert("생년월일을 선택하세요"); 
			return false;
		}
		else if($("input[name='fran_phone']").val() ==''){
			alert("연락처를 입력하세요"); 
			return false;
		}
		else if($("input[name='fran_email']").val() ==''){
			alert("이메일을 입력하세요"); 
			return false;
		}else if(email_check == '' || email_check.indexOf('@') == -1 || email_check.indexOf('.') == -1) {
			alert("이메일을 정확히 입력하세요"); 
			return false;
		}
		else if($(".area").is(':disabled')){
			
			if($("input[name='fran_job']").val() ==''){
				alert("현재 종사 직업을 입력하세요"); 
				return false;
			}
			
		}else if(($("input[name='area_no']").val() =='')) {
			alert("보유시 임대차 목적물 면적을 입력하세요"); 
			return false;
		}else if($("input[name='fran_job']").val() ==''){
			alert("현재 종사 직업을 입력하세요"); 
			return false;
		}else if($("input:checkbox[name=terms]").is(':checked') == false){
			alert("약관에 동의해 주세요.");
			return false;
		}
		
		return true;
}

