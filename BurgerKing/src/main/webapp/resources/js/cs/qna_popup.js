const popup = document.querySelector(".popbox01");
const closeBtn = document.querySelector(".btn_close");
const open_Btn = document.querySelector(".btn01");
function close_popup() { 
	window.close();
}

function del_text() { 
	

	var el = document.getElementsByClassName('st02')

	for(var i=0; i<el.length; i++){
		el[i].value = '';
		
}
}

function del_text2() { 
		

		var el = document.getElementsByClassName('st02-2')

		for(var i=0; i<el.length; i++){
			el[i].value = '';
			
}
}

function del_text3() { 
	

	var el = document.getElementsByClassName('st02-3')

	for(var i=0; i<el.length; i++){
		el[i].value = '';
		
}
}

	

	

function open_toggle() { 

	 

}

function qna_ok() { 

	window.close();
	window.open("qna_ok.do", "qna_ok", "width=300, height=200, left=800, top=100, scrollbars=no, menubar=no, toolbar=no,  location=no, resizable=yes"); 

}




