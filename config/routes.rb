Rails.application.routes.draw do
  root "markets#index"

  devise_for :users
  resource :profile, only: :show
  resources :markets, path: "m"
end
