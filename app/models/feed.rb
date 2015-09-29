class Feed
  def self.service
    @service ||= TwitterService.new
  end

  def self.combined_feed(length, legislators)
    tweets = service.combined_feed(legislators)[:statuses]
    tweets.take(length.to_i).map do |t|
      Tweet.new(t)
    end
  end

end