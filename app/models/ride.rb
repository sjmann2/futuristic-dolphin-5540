class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def open?
    open
  end

  def self.order_by_thrill
    order(thrill_rating: :desc)
  end

  def self.order_alphabetically
    order(:name)
  end

  def self.average_thrill_rating
    average(:thrill_rating)
  end
end