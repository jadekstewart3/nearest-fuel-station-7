class StationFacade
  def nearest_station_directions(current_location)
    station = FuelService.new.find_station(current_location)
    destination = formatted_address(station)

    directions = GeoService.new.get_directions(current_location, destination)

    station_info = {
      name: station[:fuel_stations][0][:station_name],
      address: destination,
      fuel_type: human_readable_fuel_type(station),
      hours: station[:fuel_stations][0][:access_days_time],
      directions: formatted_directions(directions)
    }

    Station.new(station_info)
  end

  private

  def formatted_address(station)
    if station[:fuel_stations][0].empty?
      return "There is no station close to you."
    else
      "#{station[:fuel_stations][0][:street_address]}, #{station[:fuel_stations][0][:city]}, #{station[:fuel_stations][0][:state]}, #{station[:fuel_stations][0][:zip]}"
    end
  end

  def human_readable_fuel_type(station)
    station[:fuel_stations][0][:fuel_type_code] == "ELEC" ? "Electric" : station[:fuel_stations][0][:fuel_type_code]
  end

  def formatted_directions(directions)
    directions[:route][:legs][0][:maneuvers].map { |maneuver| maneuver[:narrative] }.join
  end
end