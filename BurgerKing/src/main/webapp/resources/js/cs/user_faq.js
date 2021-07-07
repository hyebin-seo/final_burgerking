$( document ).ready( function() {
    $( '.btn_acc' ).click( function() {
      $('.btn_acc').addClass("on");
      $( '.text_area' ).toggle();
    } );
  } );