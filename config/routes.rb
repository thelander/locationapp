Rails.application.routes.draw do
  devise_for :users

  resources :markets

  root "home#index"
end
