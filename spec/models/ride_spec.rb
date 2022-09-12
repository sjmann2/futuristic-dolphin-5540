require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many :ride_mechanics }
    it { should have_many(:mechanics).through(:ride_mechanics)}
  end
  describe 'class methods' do
    describe 'order_by_thrill' do
      it 'orders rides by most thrilling to least' do
        six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
          
        scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
        hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
        ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 3, open: false)

        expect(Ride.order_by_thrill).to eq([hurler, scrambler, ferris])
      end
    end

    describe 'order_alphabetically' do
      it 'orders rides alphabetically' do
        valley_fair = AmusementPark.create!(name: 'Valley Fair', admission_cost: 65)
        steel_venom = valley_fair.rides.create!(name: 'The Steel Venom', thrill_rating: 9, open: true)
        renegade = valley_fair.rides.create!(name: 'The Renegade', thrill_rating: 7, open: true)
        scrambler = valley_fair.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)

        expect(Ride.order_alphabetically).to eq([renegade, scrambler, steel_venom])
      end
    end
  end
  
  describe 'instance methods' do
    describe 'open?' do
      it 'returns true or false if a ride is open' do
        six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
          
        scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
        hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
        ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 3, open: false)

        expect(scrambler.open?).to eq(true)
        expect(hurler.open?).to eq(true)
        expect(ferris.open?).to eq(false)
      end
    end
  end
end