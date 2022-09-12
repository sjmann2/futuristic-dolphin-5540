class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @mechanics_avg_experience = Mechanic.average_years_experience
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @mechanic_rides = @mechanic.rides.order_by_thrill
  end

  def update
    @mechanic = Mechanic.find(params[:id])
    @mechanic.rides << Ride.find(params[:add_ride])
    redirect_to "/mechanics/#{@mechanic.id}"
  end
end