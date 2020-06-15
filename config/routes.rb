Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  root to: 'recipes#index'
  resources :recipes 
end
