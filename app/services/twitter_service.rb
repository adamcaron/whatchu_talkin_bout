class TwitterService
  attr_reader :connection

  def initialize
    @connection ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
  end

  def combined_feed
    connection.search("from:SenBennetCo OR from:RepDianaDeGette OR from:SenCoryGardner", result_type: "recent").to_h
  end
end