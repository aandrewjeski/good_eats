Rails.application.routes.draw do
  devise_for :views
  root to: "restaurants#index"

  resources :restaurants
  resources :restaurants do
    resources :reviews
  end

  devise_for :users
end
