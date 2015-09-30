$(document).ready(function(){
  $("#legislators").delegate(".legislator > a", "click", function(){
      console.log("monkeys");
      var handle = $(this).data("twitter-handle").val()
      // getIndividualFeed()
  })
})

// function getIndividualFeed() {
//   $.ajax({

//   })
// }