$( ".feed.show" ).ready( function() {
  // getLegislatorsByZip()

  $( "#search-area form" ).submit( function(){
    var zip = $( "#search-area input:text" ).val();

    $.ajax({
         type: "GET",
          url: "http://congress.api.sunlightfoundation.com/legislators/locate?zip="
               + zip
               + "&apikey=e12961d962b64b66b4ce180286f0e8a2",
      success: function(legislators) {
        $.each(legislators.results, function(index, legislator) {
          renderLegislator(legislator)
        })
      }
    });
  })

  // $( "#search-submit" ).on( "click", function() {
  //   $( "#search-area form" ).submit( function(){
  //     var zip = $( "#search-area input:text" ).val();

  //     $.ajax({
  //          type: "GET",
  //           url: "http://congress.api.sunlightfoundation.com/legislators/locate?zip="
  //                + zip
  //                + "&apikey=e12961d962b64b66b4ce180286f0e8a2",
  //       success: function(legislators) {
  //         $.each(legislators.results, function(index, legislator) {
  //           renderLegislator(legislator)
  //         })
  //       }
  //     });
  //   })
  // })
})

// function getLegislatorsByZip() {
//   $( "form" ).submit(function( event ) {
//     if ( $( "input:first" ).val() === "correct" ) {
//       $( "#message-area" ).text( "Validated..." ).show();
//       return;
//     }

//     $( "#message-area" ).text( "Not valid!" ).show().fadeOut( 1000 );
//     event.preventDefault();
//   });
// }

// function getLegislatorsByZip(zip) {
//   var zip = $( "#search-area input:text" ).val();

//   $.ajax({
//        type: "GET",
//         url: "http://congress.api.sunlightfoundation.com/legislators/locate?zip="
//              + zip
//              + "&apikey=e12961d962b64b66b4ce180286f0e8a2",
//     success: function(legislators) {
//       $.each(legislators.results, function(index, legislator) {
//         renderLegislator(legislator)
//       })
//     }
//   });
// }

function renderLegislator(legislator) {
  $( "#search-area" ).before(
    "<article class='legislator senator'><h3 class='name'>"
    + legislator.title
    + " "
    + legislator.first_name
    + " "
    + legislator.last_name
    + "</h3><br><a href='#'>See "
    + legislator.title
    + " "
    + legislator.first_name
    + " "
    + legislator.last_name
    + "'s Recent Tweets...</a></article>"
  );
}