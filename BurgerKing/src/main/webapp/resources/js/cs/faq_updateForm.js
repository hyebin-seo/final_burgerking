/*텍스트 area keyup시 글자수 세기*/
$(function() {
    $('#text_content').keyup(function (e){
        var content = $(this).val();
        //$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $('.page_count').html(content.length + '/1000');
    });
    $('text_content').keyup();
});

