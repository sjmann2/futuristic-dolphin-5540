class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def open?
    open
  end

  def self.order_by_thrill
    self.order(thrill_rating: :desc)
  end
end