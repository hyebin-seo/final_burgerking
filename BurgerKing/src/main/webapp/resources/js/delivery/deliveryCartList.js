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
	});
	
	// 개인 선택
	$(document).on("click", ".menu_name > .check02", function () {
		$(".allchk01 > label > .check02").prop("checked", false);
	});
	
	itemPriceSetting();
	totalPriceSetting();
	$(".check02").prop("checked", true);
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
	
	$(".pricespan").each(function(index, item){
        sum += Number(delComma($(item).text().trim()));
    })
    
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