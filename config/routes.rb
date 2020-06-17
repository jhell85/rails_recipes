Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :recipes do
    resources :instructions
    resources :ingredients
  end
end
