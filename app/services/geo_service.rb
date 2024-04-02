class GeoService
  def connection
    url = "https://www.mapquestapi.com"
    Faraday.new(url: url, params: { key: ENV["MAP_QUEST_KEY"]})
  end

  def get_directions(origin, destination)
    response = connection.get("/directions/v2/route") do |req|
      req.params["from"] = origin
      req.params["to"] = destination
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end