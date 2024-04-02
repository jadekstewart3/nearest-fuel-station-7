require "rails_helper"

RSpec.describe Station, :vcr do 
  describe "#initialize" do 
    let(:station) { StationFacade.new.nearest_station_directions("15920 W 3rd Pl, Golden, Co, 80401")}
    it "exists" do
      expect(station).to be_a(Station)
    end

    it "has attributes" do 
      expect(station.name).to eq("KOHL'S - CHPT 0421 GOLDEN")
      expect(station.address).to eq("16700 W Colfax Ave, Golden, CO, 80401")
      expect(station.fuel_type).to eq("Electric")
      expect(station.hours).to eq("24 hours daily")
      expect(station.directions).to eq("Head west on W 3rd Pl. Go for 259 ft.Turn right onto Orchard St. Go for 0.2 mi.Continue on W 6th Ave. Go for 0.8 mi.Turn left onto Indiana St (CR-161 N). Go for 0.2 mi.Turn left and take ramp onto US-6 W (W 6th Ave). Go for 1.3 mi.Turn slightly left onto W Colfax Ave (I-70-BL) toward US-40 W. Go for 0.1 mi.Arrive at W Colfax Ave (I-70-BL).")
    end
  end
end