require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { create(:user) }

  # Test validations
  describe "validations" do
    it "is valid with a name, description, preparation_time, and cooking_time" do
      recipe = Recipe.new(
        name: "Pizza",
        description: "Delicious pizza with cheese",
        preparation_time: 30,
        cooking_time: 20,
        user: user
      )
      expect(recipe).to be_valid
    end

    it "is invalid without a name" do
      recipe = Recipe.new(
        description: "Delicious pizza with cheese",
        preparation_time: 30,
        cooking_time: 20,
        user: user
      )
      expect(recipe).not_to be_valid
      expect(recipe.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a description" do
      recipe = Recipe.new(
        name: "Pizza",
        preparation_time: 30,
        cooking_time: 20,
        user: user
      )
      expect(recipe).not_to be_valid
      expect(recipe.errors[:description]).to include("can't be blank")
    end

    it "is invalid without a preparation_time" do
      recipe = Recipe.new(
        name: "Pizza",
        description: "Delicious pizza with cheese",
        cooking_time: 20,
        user: user
      )
      expect(recipe).not_to be_valid
      expect(recipe.errors[:preparation_time]).to include("can't be blank")
    end

    it "is invalid without a cooking_time" do
      recipe = Recipe.new(
        name: "Pizza",
        description: "Delicious pizza with cheese",
        preparation_time: 30,
        user: user
      )
      expect(recipe).not_to be_valid
      expect(recipe.errors[:cooking_time]).to include("can't be blank")
    end

    it "is invalid with a negative preparation_time" do
      recipe = Recipe.new(
        name: "Pizza",
        description: "Delicious pizza with cheese",
        preparation_time: -10,
        cooking_time: 20,
        user: user
      )
      expect(recipe).not_to be_valid
      expect(recipe.errors[:preparation_time]).to include("must be greater than or equal to 0")
    end

    it "is invalid with a negative cooking_time" do
      recipe = Recipe.new(
        name: "Pizza",
        description: "Delicious pizza with cheese",
        preparation_time: 30,
        cooking_time: -10,
        user: user
      )
      expect(recipe).not_to be_valid
      expect(recipe.errors[:cooking_time]).to include("must be greater than or equal to 0")
    end
  end
end
