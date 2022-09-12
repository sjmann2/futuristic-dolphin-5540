# Story 2 - Mechanic Show Page

# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of rides they’re working on
# And I only see rides that are open
# And the rides are listed by thrill rating in descending order (most thrills first)
require 'rails_helper'

RSpec.describe 'the mechanic show page' do
  describe 'When I visit a mechanic show page' do
    describe 'I see name, years experience, and names of rides theyre working on' do
      describe 'I only see rides that are open' do
        describe 'and rides are listed by thrill rating in descending order' do
          it 'lists the mechanic name, years experience, and rides theyre working on' do
            six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
          
            scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
            hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
            ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

            josh = Mechanic.create!(name: "Josh", years_experience: 5)
            josh_hurler = RideMechanic.create!(ride_id: hurler.id, mechanic_id: josh.id)
            josh_scrambler = RideMechanic.create!(ride_id: scrambler.id, mechanic_id: josh.id)
            
            visit "/mechanics/#{josh.id}"
            
            expect(page).to have_content(josh.name)
            expect(page).to have_content(josh.years_experience)
            expect(page).to have_content(hurler.name)
            expect(page).to have_content(scrambler.name)
          end

          it 'lists rides that are open ordered by thrill in descending order' do
            six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
          
            hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
            scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
            wild_thing = six_flags.rides.create!(name: 'The Wild Thing', thrill_rating: 8, open: true)
            ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

            josh = Mechanic.create!(name: "Josh", years_experience: 5)

            josh_hurler = RideMechanic.create!(ride_id: hurler.id, mechanic_id: josh.id)
            josh_scrambler = RideMechanic.create!(ride_id: scrambler.id, mechanic_id: josh.id)
            josh_ferris = RideMechanic.create!(ride_id: ferris.id, mechanic_id: josh.id)
            josh_wild_thing = RideMechanic.create!(ride_id: wild_thing.id, mechanic_id: josh.id)

            visit "/mechanics/#{josh.id}"

            expect(page).to have_content(hurler.name)
            expect(page).to have_content(wild_thing.name)
            expect(page).to have_content(scrambler.name)
            expect(page).to_not have_content(ferris.name)

            expect(wild_thing.name).to appear_before(hurler.name)
            expect(hurler.name).to appear_before(scrambler.name)
          end
        end
      end
    end
  end
end