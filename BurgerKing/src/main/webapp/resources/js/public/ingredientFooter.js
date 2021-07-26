$(document).ready(function () {
	
	// 영양성분 팝업창 열기
   $(document).on("click", ".btn_infoingredient", function () {
	   $(".ingredientPopWrap").show();
   });
   
   // 유의사항 열고 닫기
   $(document).on("click", ".danger_caution", function () {
	   if($(this).hasClass("open")) {
		   $(this).removeClass("open");
	   } else {
		   $(this).addClass("open");
	   }
	  
   });
   

});