function renderCombinedTwitterFeed(legislators){

  // Display the loading message
  $("#feed-title").text("Getting Tweets ...")

  // Get their Twitter accounts
  var legislatorTwitterHandles = []
  $.each(legislators.results, function(index, legislator){
    legislatorTwitterHandles.push(legislator.twitter_id)
  })

  // Request the Tweets
  $.ajax({
    type: "GET",
    url:  "/combined_feed",
    data: { handles: legislatorTwitterHandles, feed_length: 13 },
    success: function(tweets) {
      // Set the page title
      $("#feed-title").text(
        "Here\'s what your legislators have been saying:"
        )

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
