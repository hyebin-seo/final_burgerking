const openBtn = document.querySelector(".btn01.add");
const closeBtn = document.querySelector(".btn_close");
const popup = document.querySelector(".popWrap");

var changeLocName_locNo;

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
		//alert($(this).val());
		
		// 선택한 배달지를 실제 DB상에서 삭제
		deleteLocation($(this).val());
		
		// 페이지에서도 li 삭제
		$(this).parent("li").remove();
		
		// 전체개수 업데이트
		//$(".r_option.st02 strong em").val($(".r_option.st02 strong em").val()-1);
	});
	
	
	// 기본배달지 라디오 버튼 누르면
	$(document).on("click", "input[name='chk']", function () {
		
		// label영역에 checked 클래스 추가(다른 label에서는 삭제)
		$(".option_chk").removeClass("checked");
		$(this).parent(".option_chk").addClass("checked");
		
		// checked 클래스가 있는 label안의 주소지를 기본배달지로 설정
		var loc_no = $(this).val();
		//alert(loc_no);
		setAsDefaultLoc(loc_no);
		
	});
	
	
	// 별칭변경 버튼 클릭하면 별칭 지정 팝업 (클릭한 배달지 별칭 이름 가지고)
	$(".change_nick").on("click", function() {
		$("#change_nick_pop").css("display","block");
		$(".popWrap02 .inpbox>input").val($(this).val().split(",")[0]);
		
		changeLocName_locNo = $(this).val().split(",")[1];
	});
	
	
	// **************** 별칭변경 팝업 관련 함수 *********************
	
	// 취소 버튼 누르면 팝업창 숨기기
	$(document).on("click", ".cancel", function () {
		$("#change_nick_pop").css("display","none");
	});
	
	// 별칭 입력 햇을 때만 우측에 x 버튼 보이게
	$(document).on("propertychange change keyup paste input", "#change_nick_pop .inpbox input", function () {
		
		if($("#change_nick_pop .inpbox input").val().length!=0){
			
			$(".btn_del01").css("display","");
			
		}else{
			
			$(".btn_del01").css("display","none");
		}
			
	});
	
	// x(입력 텍스트 삭제) 버튼 클릭했을 때
	// 상세주소 텍스트 사라짐, x버튼 숨김
	$(".btn_del01").on("click", function () {
		
		$("#change_nick_pop .inpbox input").val(null);
		$(".btn_del01").css("display","none");
			
	});
	
	// 등록 버튼 누르면 이름 바뀌어야 함!
	/*$(".changeOk").on("click", function () {*/
	$(document).on("click", ".changeOk", function() {
			
		if($("#change_nick_pop .inpbox input").val().length != 0) {
			
			changeLocName($("#change_nick_pop .inpbox input").val(),
					changeLocName_locNo);
			
		}else {
			alert("별칭을 입력하세요.");
		}
			
	});
	
});

// DB에서 배달지 삭제하는 ajax함수
function deleteLocation(loc_no) {
	$.ajax({
		url : "location_delete.do",
		data : {"loc_no" : loc_no},
		type: "post",
		success: function(data){
			//alert("삭제됏다~!!!");
			updateLocSize(data);
		},
		error: function(request, status, error){
			
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

// 삭제 후에 MY배달지 개수 업데이트
function updateLocSize(jsonStr) {
	
	var size = jsonStr.size;
	var htmlStr = "";
	
	htmlStr += "<strong>전체<em>"+size+"</em></strong>";
	
	$(".r_option.st02").html(htmlStr);
}


// DB에서 해당 loc_no의 배달지를 기본배달지로 설정하는 함수
function setAsDefaultLoc(loc_no) {
	$.ajax({
		url : "location_setDefault.do",
		data : {"loc_no" : loc_no},
		type: "post",
		success: function(data){
			//alert("기본배달지 설정 완료");
		},
		error: function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

// 배달지 별칭을 입력한 값으로 변경하는 함수
function changeLocName(new_locName, changeLocName_locNo) {
	$.ajax({
		url : "changeLocName.do",
		data : {"new_locName" : new_locName,
					"changeLocName_locNo" : changeLocName_locNo},
		type: "post",
		success: function(data){
			alert("별칭변경 완료");
			$("#change_nick_pop").css("display","none");
			updateLocName(data);
		},
		error: function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

// 별칭변경 후에 별칭 업데이트
function updateLocName(jsonStr) {
	
	var new_name = jsonStr.new_name;
	var htmlStr = "";
	
	htmlStr += "<strong>"+new_name+"</strong>";
	
	$(".option_cont .my_titWrap .tit.cls"+changeLocName_locNo).html(htmlStr);
}
