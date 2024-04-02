require "rails_helper"

RSpec.describe GeoService do 
  describe "get_directions", :vcr do 
    it "returns a json object with directions to the users destination" do 
      origin = "15920 W 3rd Pl."
      destination = "1000 10th St"
      response = GeoService.new.get_directions(origin, destination)
      expect(response).to be_a(Hash)
     
      expect(response[:route][:distance]).to be_a(Float)
      expect(response[:route][:formattedTime]).to be_a(String)
      expect(response[:route][:legs]).to be_an(Array)
      expect(response[:route][:legs].first[:maneuvers]).to be_an(Array)
    end
  end
end