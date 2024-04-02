require "rails_helper"

RSpec.describe StationFacade, :vcr do 
  describe "#instance methods" do 
    describe "#nearest_station_directions" do 
      it "returns station information and directions nearest to my location" do 
        closest_station = StationFacade.new.nearest_station_directions('15920 W 3rd Pl. Golden, CO, 80401')

        expect(closest_station).to be_a(Station)
        expect(closest_station.name).to be_a(String)
        expect(closest_station.address).to be_a(String)
        expect(closest_station.fuel_type).to be_a(String)
        expect(closest_station.hours).to be_a(String)
        expect(closest_station.directions).to be_a(String)
      end
    end
  end
end