class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.average_years_experience
    average(:years_experience)
  end

  def mechanic_rides
    rides.pluck(:name).join(", ")
  end
end