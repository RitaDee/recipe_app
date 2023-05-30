Rails.application.routes.draw do
  resources :recipe_foods
  resources :recipes
  resources :foods
  resources :users

  resources :shopping_lists
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
