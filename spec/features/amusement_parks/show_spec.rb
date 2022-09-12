# Extension - Amusement Park Show page

# As a visitor,
# When I visit an amusement park’s show page
# I see the name and price of admissions for that amusement park
# And I see the names of all the rides that are at that theme park listed in alphabetical order
# And I see the average thrill rating of this amusement park’s rides
# Ex: Hershey Park
#    Admissions: $50.00

#    Rides:
#           1. Lightning Racer
#           2. Storm Runner
#           3. The Great Bear
#    Average Thrill Rating of Rides: 7.8/10

# Note: You may have to make new migrations for this story
require 'rails_helper'

RSpec.describe 'the amusement park show page' do
  describe 'When I visit an amusement park show page' do
    it 'lists name/price of admission for park' do
      valley_fair = AmusementPark.create!(name: 'Valley Fair', admission_cost: 65)

      visit "amusement_parks/#{valley_fair.id}"

      expect(page).to have_content(valley_fair.name)
      expect(page).to have_content(valley_fair.admission_cost)
    end

    it 'lists the names of all rides in the park in alphabetical order'

    it 'lists the average thrill rating of this amusement parks rides'

  end
end