$(document).ready(function(){
  $("#legislators").delegate(".legislator a", "click", function(){
      var legislatorName = $(this).data("legislator-name")
      var handle         = $(".legislator").data("twitter-handle")
      getIndividualFeed(legislatorName, handle)
  })
})

function getIndividualFeed(legislatorName, handle) {
      // console.log("monkeys");
  $.ajax({
    type: "GET",
    url:  "/individual_feed",
    data: { handle: handle },
    success: function(tweets) {
      // Set the page title
      $("#feed-title").text(legislatorName + "'s' recent Tweets:")

      // Render the Tweets
      $.each(tweets, function(index, tweet){
        renderTweet(tweet)
      })
    },
  })
}