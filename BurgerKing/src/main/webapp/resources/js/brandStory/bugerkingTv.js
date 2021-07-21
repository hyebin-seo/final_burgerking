$(document).ready(function () {

	// input클릭하면 input에 있는 tv_no 번호 저장
	$(document).on("click", ".tv_btn", function() {
	
		var tv_no = $("input[name='rdoBanner']:checked").val();
		
		/*alert(tv_no);*/
		
		// ajax 호출
		getVideo(tv_no);
		
	})
	
	function AD(){
		alert('dkss');
		location.href='BurgerkingTv.do';
	}
	
});

//카테고리 해당 메뉴 리스트 불러오기
function getVideo(tv_no){
	$.ajax({
		url : "video.do",
		data : {"tv_no" : tv_no},
		type: "post",
		success: function(data){
			console.log('success');
			brandVideo(data);
		},
		error: function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}


//카테고리 해당하는 메뉴 리스트 뿌려주는 함수
function brandVideo(jsonStr) {
	
	//alert("menuList 받아오는 것까지 되나?");
	
	var video = jsonStr.video;

	var htmlStr = "";

	htmlStr += "<strong class='tit'>"+video.tv_name+"</strong>";
	htmlStr += "<div class='movie'>";
	htmlStr += "<iframe src='"+video.tv_video+"?rel=0&showinfo=0&autoplay=0' width='100%' height='605' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen='allowfullscreen'>#document</iframe></div>";
	
	//htmlStr += "</div>";
	
	//$(".TV_movie").html("");
	$(".TV_movie").html(htmlStr);
}
