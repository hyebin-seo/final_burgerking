

$(document).ready(function(){

$('p#pwText1.txt').css('display','block');

 $('p#pwText2.txt').css('display','block');

$('input#newPassword.st02').keyup(function() {
 
if( $('input#newPassword.st02').val() != ""){
     
       $('p#pwText1.txt').css('display','none');
 
}
});



$('input#confirmPassword.st02').keyup(function() {
 
if( $('input#confirmPassword.st02').val() != ""){
     
       $('p#pwText2.txt').css('display','none');
 
}else{
 $('p#pwText2.txt').css('display','block');
}

   
  


});


$('button#btnSave.btn01.m.red').click(function(){
 
  let confirmPwd = $('input#confirmPassword.st02').val();
  let newPwd = $('input#newPassword.st02').val();

if( confirmPwd === newPwd){
let form = document.auth
  form.submit();
}else{
   alert('비밀번호가 일치하지 않습니다.')
}

})



});















