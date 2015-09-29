class Feed
  def self.service
    @service ||= TwitterService.new
  end

  def self.combined_feed(number_of_tweets)
    tweets = service.combined_feed[:statuses].take(number_of_tweets.to_i)
    tweets.map do |tweet|
      Tweet.new(tweet)
    end
  end
end