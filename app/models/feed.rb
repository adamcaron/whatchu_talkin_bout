class Feed
  def self.service
    @service ||= TwitterService.new
  end

  def self.combined_feed(length, handles)
    tweets = service.combined_feed(handles)[:statuses]
    tweets.take(length.to_i).map do |t|
      Tweet.new(t)
    end
  end

  def self.individual_feed(length, handle)
    tweets = service.individual_feed(handle)[:statuses]
    tweets.take(length.to_i).map do |t|
      Tweet.new(t)
    end
  end
end