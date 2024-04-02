class SearchController < ApplicationController
  def show
    @station = StationFacade.new.nearest_station_directions(params[:location])
  end
end