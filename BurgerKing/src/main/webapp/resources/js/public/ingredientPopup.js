$(document).ready(function () {
	
	 $(".ingredientPopWrap").css('display','none');
	
	// 영양성분 팝업창 닫기
   $(document).on("click", ".ingredientPopWrap .btn_close", function () {
	   $(".ingredientPopWrap").css('display','none');
   });
   
   // 리스트 속 li 클릭 시 open 클래스 부여
   $(document).on("click", ".acc_list01 li", function () {
	   if($(this).hasClass("open")) {
		   $(this).removeClass("open");
	   } else {
		   $(this).addClass("open");
	   }
   });
   
});