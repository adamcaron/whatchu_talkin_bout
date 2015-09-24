class SunlightService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://congress.api.sunlightfoundation.com")
    connection.query[:apikey] = ENV['sunlight_api_key']
  end

  def legislators_by_zip(params)
    parse(connection.get('legislators/locate', params))[:results]
  end

  def legislators_by_latlong(params)
    parse(connection.get('legislators/locate', params))[:results]
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end