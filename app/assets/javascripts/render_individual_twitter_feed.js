$(document).ready(function(){
  $("#legislators").delegate(".legislator a", "click", function(){
    var legislatorName = $(this).data("legislator-name")
    var handle         = [$(this).data("twitter-handle")]
    getIndividualTwitterFeed(legislatorName, handle)
  })
})

function getIndividualTwitterFeed(legislatorName, handle){
  $.ajax({
    type: "GET",
    url: "/feed/create",
    data: { handles: handle, feed_length: 13 },
    success: function(tweets) {

      // Clear the feed if there are already tweets
      if($("#feed").after("#feed h2").has("article")) {
        $("#feed").after("#feed h2").empty()
      }

      // Set the page title
      $("#feed").append("<h2 id='feed-title'>Here\'s what your legislators have been saying:</h2>")

      // Render the Tweets
      $.each(tweets, function(index, tweet) {
        renderTweet(tweet)
      })
    }
  })
}