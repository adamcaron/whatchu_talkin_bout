function renderTweet(tweet){
  $("#feed").append(
    "<a class='profile-link' href='"
    + tweet.profile_url
    + "'><article class='tweet'><img src='"
    + tweet.profile_img
    + "' /><div><h3 class='name'>"
    + tweet.user_name
    + "</h3><span class='handle'>"
    + tweet.user_handle
    + "</span><p>"
    + tweet.text
    + "</p></div></article></a>"
    )
}