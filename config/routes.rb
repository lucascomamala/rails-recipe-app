Rails.application.routes.draw do
  
  root 'foods#index'

  resources :users, only: [:index, :show]
  resources :recipes do
    resources :recipe_foods, only: [:new, :create, :destroy, :edit, :update]
  end
  resources :foods
end
