require 'rails_helper'

RSpec.describe '/recipe_foods', type: :request do
  let(:user) { create(:user) }
  let(:food) { create(:food, user_id: user.id) }
  let(:recipe) { create(:recipe, user_id: user.id) }

  let(:valid_attributes) do
    {
      quantity: 5,
      recipe_id: recipe.id,
      food_id: food.id
    }
  end

  let(:invalid_attributes) do
    {
      quantity: 'asd',
      recipe_id: 1,
      food_id: 1
    }
  end

  before do
    sign_in user
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_recipe_recipe_food_url(recipe_id: recipe.id)
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      recipe_food = RecipeFood.create! valid_attributes
      get edit_recipe_recipe_food_url(recipe, recipe_food)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new RecipeFood' do
        expect do
          post recipe_recipe_foods_url(recipe), params: { recipe_food: valid_attributes }
        end.to change(RecipeFood, :count).by(1)
      end

      it 'redirects back to the recipe page' do
        post recipe_recipe_foods_url(recipe), params: { recipe_food: valid_attributes }
        expect(response).to redirect_to(recipe_url(recipe))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new RecipeFood' do
        expect do
          post recipe_recipe_foods_url(recipe), params: { recipe_food: invalid_attributes }
        end.to change(RecipeFood, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post recipe_recipe_foods_url(recipe), params: { recipe_food: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          quantity: 10
        }
      end

      it 'updates the requested recipe_food' do
        recipe_food = RecipeFood.create! valid_attributes
        patch recipe_recipe_food_url(recipe, recipe_food), params: { recipe_food: new_attributes }
        recipe_food.reload
        expect(recipe_food.quantity).to eq(10)
      end

      it 'redirects back to the recipe page' do
        recipe_food = RecipeFood.create! valid_attributes
        patch recipe_recipe_food_url(recipe, recipe_food), params: { recipe_food: new_attributes }
        recipe_food.reload
        expect(response).to redirect_to(recipe_url(recipe))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested recipe_food' do
      recipe_food = RecipeFood.create! valid_attributes
      expect do
        delete recipe_recipe_food_url(recipe, recipe_food)
      end.to change(RecipeFood, :count).by(-1)
    end

    it 'redirects back to the recipe page' do
      recipe_food = RecipeFood.create! valid_attributes
      delete recipe_recipe_food_url(recipe, recipe_food)
      expect(response).to redirect_to(recipe_url(recipe))
    end
  end
end
