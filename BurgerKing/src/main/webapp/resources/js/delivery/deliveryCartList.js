$(document).ready(function() {
	// 수량 감소
	$(document).on("click", ".btn_minus", function () {
		var amount = $(this).siblings("input[type='number']");
	    if(amount.val() == 1 ) {
	    	return;
	    } else {
	    	//현재 선택 메뉴의 가격
	    	var price = Number(delComma($(".sumprice"+$(this).val()).text()).trim());
	    	//수량 셋팅
	    	var anum = Number(amount.val());
	    	amount.val(Number(amount.val())-1);
	    	
	    	$(".sumprice"+$(this).val()).text(addComma(price/anum * (anum-1)));
	    	console.log("메뉴 금액:"+price);
	    	console.log("수량 감소 금액:"+price * anum);
	    	
	    	totalPriceSetting();
	    }
	 });
	
	// 수량 증가
	$(document).on("click", ".btn_plus", function () {
		var amount = $(this).siblings("input[type='number']");
		if(amount.val() == 7 ) {
	    	return;
	    } else {
	    	//현재 선택 메뉴의 가격
	    	var price = Number(delComma($(".sumprice"+$(this).val()).text()).trim());
	    	//수량 셋팅
	    	var anum = Number(amount.val());
	    	amount.val(Number(amount.val())+1);
	    	
	    	$(".sumprice"+$(this).val()).text(addComma(price/anum * (anum+1)));
	    	console.log("메뉴 금액:"+price);
	    	console.log("수량 증가 금액:"+price * anum);
	    	
	    	totalPriceSetting();
	    }
	 });
	
	// 전체 선택
	$(document).on("click", ".allchk01 > label > .check02", function () {
		if($(this).is(':checked')) {
			$(".check02").not($(this)).prop("checked", true);
		} else {
			$(".check02").not($(this)).prop("checked", false);
		}
		totalPriceSetting();
	});
	
	// 개인 선택
	$(document).on("click", ".menu_name > .check02", function () {
		$(".allchk01 > label > .check02").prop("checked", false);
		totalPriceSetting();
	});
	
	$(".check02").prop("checked", true);
	itemPriceSetting();
	totalPriceSetting();
});

//개별금액 셋팅
function itemPriceSetting() {
	//var all = $('.cart_list01 > li').size();
	
	
	
	$('.cart_list01 > li').each(function(index, item){
		var opspan = $(this).find(".oprice");
		var osum = 0;
		opspan.each(function(index, sp) {
			osum += Number(delComma($(sp).text().trim()));
		});
		
		if(osum > 0) {
			var sumprice = $(this).find(".pricespan");
			sumprice.text(addComma(Number(delComma(sumprice.text()))+osum));
		}
        console.log("옵션 가격:"+osum);
    });
}

//총금액 셋팅
function totalPriceSetting() {
	
	var sum = 0;
	
	/*$(".pricespan").each(function(index, item){
		
		var li = $(item).parent("li");
		console.log("li: "+li);
		var chkbox = $(".check02").eq($(item).index());
		console.log("chkbox: "+chkbox);
		if(chkbox.is(':checked')) {
			sum += Number(delComma($(item).text().trim()));
		}
    });*/
    
	$(".cart_list01 > li").each(function(index, item){
		
		var chkbox = $(item).find(".check02");
		var pricespan = $(item).find(".pricespan");
		
		if(chkbox.is(':checked')) {
			sum += Number(delComma(pricespan.text().trim()));
		}
    });
    
    sum = addComma(sum);
    
    $(".totalprice").text(sum);
	console.log("총금액 산정:"+sum);
}

//천단위 콤마 부여
function addComma(value){
     value = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
     return value; 
}

//천단위 콤마 제거
function delComma(value){
    value = value.toString().replace(/,/g, '');
    return value; 
}

// 장바구니 아이템 개당 삭제
function cartDelete(cartno) {
	$.ajax({
        url : "cartDelete.do",
        data : {"cart_no" : cartno},
        type : "post",
        async : false,
        success : function(data){
        	if(data>0) {
        		console.log(cartno+"번 아이템 삭제 완료");
        		$("li[class='"+cartno+"']").remove();
        		totalPriceSetting();
        	}
        },
        error : function(request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
}

// 장바구니 아이템 전체 삭제
function cartAllDelete(userid) {
	$.ajax({
        url : "cartAllDelete.do",
        data : {"user_id" : userid},
        type : "post",
        async : false,
        success : function(data){
        	if(data>0) {
        		console.log("전체 아이템 삭제 완료");
        		$(".cartWrap").remove();
        		$(".nodata").removeAttr("style");
        	}
        },
        error : function(request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
}

function goOrder() {
	// create element (form)
	
	var menuArr = [];
	var menu_index = 0;
	
	$(".cart_list01 > li").each(function(index, item){
		
		var chkbox = $(item).find(".check02");
		
		if(chkbox.is(':checked')) {
			
			
			var menuname = $(item).find(".tit > strong > span").text().trim(); //메뉴이름
			var menuinfo = $(item).find(".set_info").text().trim(); //메뉴정보
			
			var detail = $(item).find(".ingspan"); //재료추가정보
			var detailStr = "";
			
			detail.each(function(index, item){
				detailStr += $(item).text().trim() +" 추가";
				
				if(index != detail.length-1) {
					detailStr += "/";
				}
			});
			
			var side = $(item).find(".sidespan").text().trim(); //사이드정보
			
			var drink = $(item).find(".drinkspan").text().trim(); //음료수 정보
			
			var mount = Number($(item).find(".num_set > input[type='number']").val().trim()); //수량
			
			var pricespan = $(item).find(".pricespan"); 
			
			var price = Number(delComma(pricespan.text().trim())); //개별 합계가격
			
			var cartno = $(item).attr("class"); //카트번호
			var menuno = $(".menu_no_inp"+cartno).val().trim(); //메뉴번호
			var menuimg = $(".menu_img"+cartno).val().trim(); //메뉴이미지

			console.log("메뉴번호: "+menuno);
			console.log("메뉴이름: "+menuname);
			console.log("메뉴정보: "+menuinfo);
			console.log("재료추가정보: "+detailStr);
			console.log("사이드정보: "+side);
			console.log("음료수정보: "+drink);
			console.log("수량: "+mount);
			console.log("개별 합계가격: "+price);
			console.log("카트번호: "+cartno);
			console.log("메뉴이미지: "+menuimg);
			
			menuArr[menu_index] = menuno+"^"+menuname+"^"+
								  menuinfo+"^"+detailStr+"^"+
								  side+"^"+drink+"^"+mount+"^"+price+"^"+cartno+"^"+menuimg;
			console.log(menuArr[menu_index]);
			console.log("==========================");
			menu_index++;
		}
    });
	
	var newForm = document.createElement('form'); 
	
	newForm.name = 'newForm'; 
	newForm.method = 'post'; 
	newForm.action = 'delivery_order.do'; 
	
	var input1 = document.createElement('input');
	
	input1.setAttribute("type", "hidden");
	input1.setAttribute("name", "menuArr");
	input1.setAttribute("value", menuArr);

	newForm.appendChild(input1);
	
	document.body.appendChild(newForm);
	
	newForm.submit();
	
}