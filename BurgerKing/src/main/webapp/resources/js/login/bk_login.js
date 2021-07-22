/**
 * 
 */




$('a.btn01.m.red').click(function() {

	var user_id = $('.user_id').val();
	var user_pwd = $('.user_pwd').val();



		var form = document.createElement("form");
	
		form.setAttribute("charset", "UTF-8");
	
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
	
		form.setAttribute("action", "login_Ok.do");
	
	
		var hiddenField = document.createElement("input");
	
		hiddenField.setAttribute("type", "hidden");
	
		hiddenField.setAttribute("name", "user_id");
	
		hiddenField.setAttribute("value", user_id);
	
		form.appendChild(hiddenField);


	hiddenField = document.createElement("input");

	hiddenField.setAttribute("type", "hidden");

	hiddenField.setAttribute("name", "user_pwd");

	hiddenField.setAttribute("value", user_pwd);

	form.appendChild(hiddenField);

		



	form.submit();


});

/* 눈 이미지 아이콘 바꾸기 */


$(document).ready(function(){

   $('button.btn_view01').click(function() {
   
  
     if( $('input.user_pwd').is(':password')){
     $('input.user_pwd').attr('type', 'text');
     $('button.btn_view01').addClass('on');
    
     }else{
      $('input.user_pwd').attr('type', 'password');
      $('button.btn_view01').removeClass('on');
     }
    
    
    
});

})/*메서드 종료*/

$('div.tab_cont').hide();
$("div.tab_cont:first").show()


$('ul.item2 li').click(function() {

	$('ul.item2 li').removeClass('on');
	$(this).addClass('on');
	$("div.tab_cont").hide(); //Hide all tab content


	var onTab = $(this).find('a').attr('href');

	$(onTab).fadeIn();
	return false;


});


























