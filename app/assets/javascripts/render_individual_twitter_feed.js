$(document).ready(function(){
  $("#legislators").delegate(".legislator a", "click", function(){
    var legislatorName = $(this).data("legislator-name")
    var handle         = $(this).data("twitter-handle")
    getIndividualTwitterFeed(legislatorName, handle)
  })
})

function getIndividualTwitterFeed(legislatorName, handle){
  $.ajax({
    type: "GET",
    url:  "/individual_feed",
    data: { handle: handle, feed_length: 13 },
    success: function(tweets) {
      // Set the page title
      $("#feed-title").text(legislatorName + "'s' recent Tweets:")

      // Clear the feed if there are already tweets
      if($("#feed").after("#feed h2").has("article")) {
        $("#feed").after("#feed h2").empty()
      }

      // Render the Tweets
      $.each(tweets, function(index, tweet) {
        renderTweet(tweet)
      })
    }
  })
}