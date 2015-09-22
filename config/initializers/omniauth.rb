Rails.application.config.middleware.use OmniAuth::Builder do
  provider :instagram, ENV['TWITTER_ID'], ENV['TWITTER_SECRET']
end