/**
 *  비밀번호를 보이게하는 기능 
 */

 function passwordShow() {
	const btn = document.querySelector(".buttonText");
	const input = document.querySelector("#myInput")

	if (input.type === 'password') {
		input.type = "text";
		btn.innerHTML = "hide";
	} else {
		input.type = "password"
		btn.innerHTML = "show"
	}

}

<<<<<<< HEAD


=======
>>>>>>> origin/jun
/**
*  아이디 저장 기능 

*/

$("#userId").val(Cookies.get('key'));
if ($("#userId").val() != "") {
	$("#idSaveCheck").attr("checked", true);
}

$("#idSaveCheck").change(function() {
	if ($("#idSaveCheck").is(":checked")) {
		Cookies.set('key', $("#userId").val(), { expires: 7 });
	} else {
		Cookies.remove('key');
	}
});

$("#userId").keyup(function() {
	if ($("#idSaveCheck").is(":checked")) {
		Cookies.set('key', $("#userId").val(), { expires: 7 });
	}
});


