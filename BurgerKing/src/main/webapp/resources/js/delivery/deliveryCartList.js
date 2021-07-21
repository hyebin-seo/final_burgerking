$(document).ready(function() {
	
});

function cartOpen() {
	var uid = $("#user_id").val();
	
	if(uid == "") {
		alert("아이디 세션 오류");
		return;
	}
	
	$.ajax({
        url : "cart.do",
        data : {"user_id" : uid},
        type : "post",
        async : false,
        success : function(data){
        	
        },
        error : function(request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
}

function cartDelete(cartno) {
	$.ajax({
        url : "cartDelete.do",
        data : {"cart_no" : cartno},
        type : "post",
        async : false,
        success : function(data){
        	if(data>0) {
        		console.log(cartno+"번 아이템 삭제 완료");
        		$("li[class='"+cartno+"']").remove();
        	}
        },
        error : function(request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
}