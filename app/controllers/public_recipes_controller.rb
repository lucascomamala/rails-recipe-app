class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:recipe_foods, recipe_foods: [:food]).where(public: true)
  end
end
