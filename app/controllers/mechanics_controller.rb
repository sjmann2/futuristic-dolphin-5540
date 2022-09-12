class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @mechanics_avg_experience = Mechanic.average_years_experience
  end
end