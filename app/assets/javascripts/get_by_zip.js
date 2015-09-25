$( ".feed.show" ).ready( function() {
  $( "#search-area form" ).submit(
    getLegislatorsByZip()
  )
})

// $('#search-area input').blur(function()
// {
//       if( !this.value ) {
//             $(this).parents('p').addClass('warning');
//       }
// });

function getLegislatorsByZip() {
  $( "form" ).submit(function( event ) {
    if ( $( "input:first" ).val() === "correct" ) {
      $( "#message-area" ).text( "Validated..." ).show();
      return;
    }

    $( "#message-area" ).text( "Not valid!" ).show().fadeOut( 1000 );
    event.preventDefault();
  });
}
