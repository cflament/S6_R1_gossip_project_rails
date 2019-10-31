class CitiesController < ApplicationController
  def show
    @city = City.all.find(params[:id].to_i)
    @gossips = Gossip.all.select {|g| g.user.city_id == params[:id].to_i }
  end
end
