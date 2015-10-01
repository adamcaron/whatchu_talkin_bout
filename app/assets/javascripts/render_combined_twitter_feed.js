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
    url:  "/feed/create",
    data: { handles: legislatorTwitterHandles, feed_length: 13 },
    success: function(tweets) {

      // Clear the feed if there are already tweets
      $("#feed").after().empty()

      // Set the page title
      $("#feed").append("<h2 id='feed-title'>Here\'s what your legislators have been saying:</h2>")

      // Render the Tweets
      $.each(tweets, function(index, tweet) {
        renderTweet(tweet)
      })
    }
  })
}
