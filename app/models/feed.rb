class Feed
  def self.service
    @service ||= TwitterService.new
  end

  def self.combined_feed(length, twitter_handles)
    tweets = service.combined_feed(twitter_handles)[:statuses]
    tweets.take(length.to_i).map do |t|
      Tweet.new(t)
    end
  end
end