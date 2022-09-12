class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @mechanics_avg_experience = Mechanic.average_years_experience
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @mechanic_rides = @mechanic.rides.order_by_thrill
  end
end