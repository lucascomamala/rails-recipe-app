require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { create(:user) }

  subject(:food) do
    described_class.new(
      name: 'Tomato',
      measurement_unit: 'kg',
      price: 2.5,
      quantity: 5,
      user:
    )
  end

  describe 'validations' do
    it 'validates presence of name' do
      food.name = nil
      expect(food.valid?).to be_falsey
      expect(food.errors[:name]).to include("can't be blank")
    end

    it 'validates presence of measurement_unit' do
      food.measurement_unit = nil
      expect(food.valid?).to be_falsey
      expect(food.errors[:measurement_unit]).to include("can't be blank")
    end

    it 'validates presence of price' do
      food.price = nil
      expect(food.valid?).to be_falsey
      expect(food.errors[:price]).to include("can't be blank")
    end

    it 'validates numericality of price greater than or equal to 0' do
      food.price = -1
      expect(food.valid?).to be_falsey
      expect(food.errors[:price]).to include('must be greater than or equal to 0')
    end

    it 'validates presence of quantity' do
      food.quantity = nil
      expect(food.valid?).to be_falsey
      expect(food.errors[:quantity]).to include("can't be blank")
    end

    it 'validates numericality of quantity as integer greater than or equal to 0' do
      food.quantity = -1
      expect(food.valid?).to be_falsey
      expect(food.errors[:quantity]).to include('must be greater than or equal to 0')
    end

    it 'validates that measurement_unit only allows letters' do
      food.measurement_unit = '123'
      expect(food.valid?).to be_falsey
      expect(food.errors[:measurement_unit]).to include('only allows letters')

      food.measurement_unit = 'kg'
      expect(food.valid?).to be_truthy
    end
  end
end
