Rails.application.routes.draw do
  devise_for :users
  
  root 'foods#index'

  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy, :edit, :update]
  end
  resources :foods, only: [:index, :new, :create, :destroy]
end
