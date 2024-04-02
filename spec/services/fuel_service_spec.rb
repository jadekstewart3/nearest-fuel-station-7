require "rails_helper"
RSpec.describe FuelService do 
  describe "find_station" do 
    it "returns a json object with station information", :vcr do 
      location = "Golden"
      fuel_service = FuelService.new
      response = fuel_service.find_station(location)
      expect(response).to be_a(Hash)
      expect(response[:fuel_stations].first).to be_a(Hash)

      closest_station = response[:fuel_stations].first
      
      expect(closest_station[:station_name]).to be_a(String)
      expect(closest_station[:station_name]).to be_a(String)
      expect(closest_station[:fuel_type_code]).to be_a(String)
      expect(closest_station[:street_address]).to be_a(String)
      expect(closest_station[:city]).to be_a(String)
      expect(closest_station[:state]).to be_a(String)
      expect(closest_station[:zip]).to be_a(String)
      expect(closest_station[:access_days_time]).to be_a(String)
    end
  end
end
