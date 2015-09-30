module Helpers
  def login_user!
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      "provider"=>"twitter",
      "uid"=>"2975056012",
      "info"=>
      {
        "nickname"=>"adamcaron_",
        "name"=>"Adam Caron",
        "email"=>nil,
        "location"=>"Denver, CO",
        "image"=>"http://pbs.twimg.com/profile_images/634476865172828161/_CNlNT--_normal.jpg",
        "description"=>"Developer and Designer of Software;\nLover of anything that benefits people",
        "urls"=> {
          "Website"=>nil,
          "Twitter"=>"https://twitter.com/adamcaron_"
        }
      },
      "credentials"=> {
        "token"=>  ENV["TWITTER_ACCESS_TOKEN"],
        "secret"=> ENV["TWITTER_ACCESS_TOKEN_SECRET"]
      }
    })
  end
end