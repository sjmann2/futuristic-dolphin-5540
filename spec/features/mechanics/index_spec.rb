# Story 1 - Mechanic Index Page

# As a user,
# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics
require 'rails_helper'

RSpec.describe 'the mechanic index page' do
  describe 'When I visit the mechanics index page' do
    describe "I see a header saying 'All Mechanics' and a list of machanic's names/years experience" do
      describe 'I also see the average years experience across all mechanics' do
        it 'lists all mechanic names and years experience' do
          six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
          
          hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
          scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
          ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

          josh = Mechanic.create!(name: "Josh", years_experience: 5)
          josh_hurler = RideMechanic.create!(ride_id: hurler.id, mechanic_id: josh.id)

          sandy = Mechanic.create!(name: "Sandy", years_experience: 10)
          sandy_scrambler = RideMechanic.create!(ride_id: scrambler.id, mechanic_id: sandy.id)

          miya = Mechanic.create!(name: "Miya", years_experience: 2)
          miya_ferris = RideMechanic.create!(ride_id: ferris.id, mechanic_id: miya.id)
          miya_scrambler = RideMechanic.create!(ride_id: scrambler.id, mechanic_id: miya.id)

          visit '/mechanics'

          expect(page).to have_content('All Mechanics')
          expect(page).to have_content(josh.name)
          expect(page).to have_content(sandy.name)
          expect(page).to have_content(miya.name)
          expect(page).to have_content(josh.years_experience)
          expect(page).to have_content(sandy.years_experience)
          expect(page).to have_content(miya.years_experience)
        end

        it 'lists average years experience across all mechanics' do
          visit '/mechanics'

          expect(page).to have_content('Average years experience of all mechanics: 5.67')
        end
      end
    end
  end
end