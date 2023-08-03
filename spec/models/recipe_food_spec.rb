require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user:) }
  let(:food) { create(:food, user:) }

  # Test validations
  describe 'validations' do
    it 'is valid with a quantity, recipe, and food' do
      recipe_food = RecipeFood.new(
        quantity: 2,
        recipe:,
        food:
      )
      expect(recipe_food).to be_valid
    end

    it 'is invalid without a quantity' do
      recipe_food = RecipeFood.new(
        recipe:,
        food:
      )
      expect(recipe_food).not_to be_valid
      expect(recipe_food.errors[:quantity]).to include("can't be blank")
    end

    it 'is invalid with a negative quantity' do
      recipe_food = RecipeFood.new(
        quantity: -1,
        recipe:,
        food:
      )
      expect(recipe_food).not_to be_valid
      expect(recipe_food.errors[:quantity]).to include('must be greater than 0')
    end

    it 'is invalid without a recipe' do
      recipe_food = RecipeFood.new(
        quantity: 2,
        food:
      )
      expect(recipe_food).not_to be_valid
      expect(recipe_food.errors[:recipe]).to include('must exist')
    end

    it 'is invalid without a food' do
      recipe_food = RecipeFood.new(
        quantity: 2,
        recipe:
      )
      expect(recipe_food).not_to be_valid
      expect(recipe_food.errors[:food]).to include('must exist')
    end
  end
end
