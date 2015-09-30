class Feed
  def self.service
    @service ||= TwitterService.new
  end

  def self.create(handles, length)
    tweets = service.create_feed(handles)[:statuses]
    tweets.take(length.to_i).map do |t|
      Tweet.new(t)
    end
  end
end