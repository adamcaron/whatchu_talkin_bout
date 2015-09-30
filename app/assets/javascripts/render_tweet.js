function renderTweet(tweet){
  $("#feed").append(
    "<article class='tweet'><img src='"
    + tweet.profile_img
    + "' /><h3 class='name'>"
    + tweet.user_name
    + "</h3><a class='handle' href='"
    + tweet.profile_url
    + "'>"
    + tweet.user_handle
    + "</a>"
    + "<p>"
    + tweet.text
    + "</p></article>"
    )
}