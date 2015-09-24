class Legislator < OpenStruct
  def self.service
    @service ||= SunlightService.new
  end

  def self.where(params)
    service.legislators(params).map { |legislator| Legislator.new(legislator) }
  end
end
