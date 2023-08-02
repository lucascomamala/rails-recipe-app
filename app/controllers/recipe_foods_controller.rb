class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show edit update destroy]

  # GET /recipe_foods/new
  def new
    @recipe_food = RecipeFood.new
  end

  # GET /recipe_foods/1/edit
  def edit; end

  # POST /recipe_foods
  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = Recipe.find(params[:recipe_id]).id

    if @recipe_food.save
      redirect_to recipe_path(params[:recipe_id]), notice: 'Ingredient successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipe_foods/1
  def update
    if @recipe_food.update(recipe_food_params)
      redirect_to recipe_food_url(@recipe_food), notice: 'Recipe food was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /recipe_foods/1
  def destroy
    @recipe_food.destroy
    redirect_to request.referrer, notice: 'Ingredient was successfully removed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
