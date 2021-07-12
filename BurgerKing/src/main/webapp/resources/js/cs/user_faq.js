$(function(){  
    var article = (".flist01 .show");  
    $(".flist01 .acc_tit_tr .acc_tit").click(function() {  
        var myArticle =$(this).parents().next("tr");  
        if($(myArticle).hasClass('acc_cont')) {  
            $(article).removeClass('show').addClass('acc_cont');  
            $(myArticle).removeClass('acc_cont').addClass('show');  
        }  
        else {  
            $(myArticle).addClass('acc_cont').removeClass('show');  
        }  
    });  
});  
$(function(){  
    var article1 = (".flist01 .open");  
    $(".flist01 .acc_tit_tr .acc_tit").click(function() {  
        var myArticle1 =$(this).parents("tbody");  
        if($(myArticle1).hasClass('acc_body')) {  
            $(article1).removeClass('open').addClass('acc_body');  
            $(myArticle1).removeClass('acc_body').addClass('open');  
        }  
        else {  
            $(myArticle1).addClass('acc_body').removeClass('open');  
        }  
    });  
}); 

$(function(){  
	$(".switch01").click(function(){
	    $(this).children('input').attr('checked','checked');
	    $("form").submit();
	});
}); 

function paging_faq(page) {
	var checkValue = $("input[name='faq_cate']:checked").val();
	console.log("faq_home.do?faq_cate="+checkValue+"&page="+page);
	location.href="faq_home.do?faq_cate="+checkValue+"&page="+page;
}