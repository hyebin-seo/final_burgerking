const openBtn = document.querySelector(".btn01.add");
const closeBtn = document.querySelector(".btn_close");
const popup = document.querySelector(".popWrap");

//주소찾기 팝업 띄우기 액션
openBtn.addEventListener('click', onPopup);
//searchBtn.addEventListener('click', goPopup);
//주소찾기 팝업 X버튼 액션
closeBtn.addEventListener('click', offPopup);

function offPopup() {
	popup.style.display ='none';
}

function onPopup() {
	popup.style.display ='block';
}


$(function(){
	
	// 각 주소 li의 삭제(X) 버튼 클릭시 MY배달지에서 삭제
	$(".btn_del02").click(function() {
		
		//location.href="location_delete.do?loc_no="+$(this).val();
		alert($(this).val());
		
		// 선택한 배달지를 실제 DB상에서 삭제
		deleteLocation($(this).val(), "홍길동");
		
		// 페이지에서도 li 삭제
		$(this).parent("li").remove();
		
		// 전체개수 업데이트
		//$(".r_option.st02 strong em").val($(".r_option.st02 strong em").val()-1);
		
		
	})
});


function deleteLocation(loc_no, user_id) {
	$.ajax({
		url : "location_delete.do",
		data : {"loc_no" : loc_no, "user_id":user_id},
		type: "post",
		success: function(data){
			alert("삭제됏다~!!!");
			updateLocSize(data);
		},
		error: function(request, status, error){
			
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function updateLocSize(jsonStr) {
	
	var size = jsonStr.size;
	var htmlStr = "";
	
	htmlStr += "<strong>전체<em>"+size+"</em></strong>";
	
	$(".r_option.st02").html(htmlStr);
}