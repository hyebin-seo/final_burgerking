/**
 * 
 */



$(document).ready(function(){





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

 $('button.btn_view01').click(function() {
   
  
     if( $('input.user_pwd').is(':password')){
     $('input.user_pwd').attr('type', 'text');
     $('button.btn_view01').addClass('on');
    
     }else{
      $('input.user_pwd').attr('type', 'password');
      $('button.btn_view01').removeClass('on');
     }
    
    
    
});





})



/* 눈 이미지 아이콘 바꾸기 */


$(document).ready(function(){

  
})/*메서드 종료*/




function go() {

    var form = document.form
    
    form.submit();

}





















