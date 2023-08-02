class FoodsController < ApplicationController
  before_action :set_food, only: %i[edit update destroy]

  # GET /foods
  def index
    @foods = Food.all.where(user: current_user)
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit; end

  # POST /foods
  def create
    @food = current_user.foods.new(food_params)

    if @food.save
      redirect_to foods_url, notice: 'Food successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

   # PATCH/PUT /foods/1
  def update
    if @food.update(food_params)
      redirect_to food_url(@food), notice: 'Food successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /foods/1
  def destroy
    @food.destroy
    redirect_to foods_url, notice: 'Food successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
