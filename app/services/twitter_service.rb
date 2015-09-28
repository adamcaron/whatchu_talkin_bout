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
    connection.search("SenBennetCo OR RepDianaDeGette OR SenCoryGardner", result_type: "recent").take(9).each do |tweet|
      puts tweet.text
    end
  end
end