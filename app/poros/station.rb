class Station
  attr_reader :name,
              :address,
              :fuel_type,
              :hours,
              :directions

  def initialize(data_hash)
    @name = data_hash[:name]
    @address = data_hash[:address]
    @fuel_type = data_hash[:fuel_type]
    @hours = data_hash[:hours]
    @directions = data_hash[:directions]
  end
end