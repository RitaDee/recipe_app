Rails.application.routes.draw do
  devise_for :users
  resources :recipes do 
    resources :recipe_foods 
  end
  
  resources :foods
  resources :users

  resources :shopping_lists
  resources :public_recipes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index", as: :authenticated_root
end
