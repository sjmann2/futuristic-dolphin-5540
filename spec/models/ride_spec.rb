require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many :ride_mechanics }
    it { should have_many(:mechanics).through(:ride_mechanics)}
  end

  describe 'instance methods' do
    describe 'open?' do
      it 'returns true or false if a ride is open' do
        six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
          
        scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
        hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
        ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

        expect(scrambler.open?).to eq(true)
        expect(hurler.open?).to eq(true)
        expect(ferris.open?).to eq(false)
      end
    end
  end
end