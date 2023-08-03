class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show destroy]

  # GET /recipes
  def index
    @recipes = Recipe.all.where(user: current_user)
  end

  # GET /recipes/1
  def show
    @foods = Food.all
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # POST /recipes
  def create
    @recipe = current_user.recipes.new(recipe_params)

    if @recipe.save
      redirect_to recipes_url, notice: 'Recipe was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
