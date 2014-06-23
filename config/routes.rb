Rails.application.routes.draw do
  root to: "restaurants#index"

  resources :restaurants
  resources :restaurants do
    resources :reviews
  end

  devise_for :users
end
