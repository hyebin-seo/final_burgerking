/**
 * 
 */






/* 눈 이미지 아이콘 바꾸기 */


$('button.btn_view01').click(function() {


	$('input#user_pwd.user_pwd').attr('type', 'text');




});



/* tab 기능 활성화*/


//When page loads...
	$("div.tab_cont").hide(); //Hide all content	
	$("div.tab_cont:first").show()
	
	
	$("ul.item2 li").click(function() {

			$("ul.item2 li").removeClass("on"); //Remove any "active" class
			$(this).addClass("on"); //Add "active" class to selected tab
			$("div.tab_cont").hide(); //Hide all tab content

			var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
			
			
			$(activeTab).fadeIn(); //Fade in the active ID content
			return false;
		});
	
	
	
	$('input.st02.user_name').keyup(function(){
	  
	   
	     if($('input.st02.user_name').val() != ""){
	        $('p.txt:first').css('display','none');
	     }else{
	       $('p.txt:first').css('display','inline-block');
	     }
	});
	
	$('input.st02.user_phone').keyup(function(){
	
	
	   
	     if($('input.st02.user_phone').val() != ""){
	        $('p.txt:nth-child(2)').css('display','none');
	        if($('input.st02.user_phone').val().length < 11){
	         $('p.txt:nth-child(3)').css('display','inline-block');
	        }else{
	          $('p.txt:nth-child(2)').css('display','none');
	          $('p.txt:nth-child(3)').css('display','none');
	        }
	       
	     }else{
	      $('p.txt:nth-child(2)').css('display','inline-block');
	       $('p.txt:nth-child(3)').css('display','none');
	     }
	});
	
	
	
	
	
	