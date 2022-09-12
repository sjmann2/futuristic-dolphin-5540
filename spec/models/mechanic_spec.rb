require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many :ride_mechanics }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe 'class methods' do
    describe 'average_years_experience' do
      it 'calculates average years experience across all mechanics' do
        josh = Mechanic.create!(name: "Josh", years_experience: 5)
        sandy = Mechanic.create!(name: "Sandy", years_experience: 10)
        miya = Mechanic.create!(name: "Miya", years_experience: 2)

        expect(Mechanic.average_years_experience.round(2)).to eq(5.67)
      end
    end
  end

  describe 'instance methods' do
    describe 'mechanic_rides' do
      it 'lists all of a mechanics rides' do
        josh = Mechanic.create!(name: "Josh", years_experience: 5)

        six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

        hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
        scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)

        josh_hurler = RideMechanic.create!(ride_id: hurler.id, mechanic_id: josh.id)
        josh_scrambler = RideMechanic.create!(ride_id: scrambler.id, mechanic_id: josh.id)

        expect(josh.mechanic_rides).to eq('The Hurler, The Scrambler')
      end
    end
  end
end