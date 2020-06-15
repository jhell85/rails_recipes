Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :recipes

  # get '/new_recipe_path' => 'recipes#new'

end
