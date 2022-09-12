require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many :ride_mechanics }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe 'class methods' do
    describe 'average_years_experience' do
      josh = Mechanic.create!(name: "Josh", years_experience: 5)
      sandy = Mechanic.create!(name: "Sandy", years_experience: 10)
      miya = Mechanic.create!(name: "Miya", years_experience: 2)

      expect(Mechanic.average_years_experience.round(2)).to eq(5.67)
    end
  end
end