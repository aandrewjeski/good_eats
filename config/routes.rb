Rails.application.routes.draw do
  resources :restaurants
  resources :restaurants do
    resources :reviews
  end

  devise_for :users
  root "pages#restaurants"
end
