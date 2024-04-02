class FuelService
  def connection
    url = "https://developer.nrel.gov"
    Faraday.new(url: url, params: { api_key: ENV["NREL_KEY"] })
  end

  def find_station(location)
    response = connection.get("/api/alt-fuel-stations/v1/nearest.json?") do |req|
      req.params["location"] = location
      req.params["fuel_type"] = "ELEC"
      req.params["radius"] = "infinite"
      req.params["limit"] = "1"
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end