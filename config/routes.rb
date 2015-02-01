Rails.application.routes.draw do
  devise_for :users

  resources :markets, path: "m"

  root "markets#index"
end
