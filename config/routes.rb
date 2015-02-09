Rails.application.routes.draw do
  root "markets#index"

  devise_for :users
  resource :profile, only: :show
  resources :markets, path: "m" do
    resources :comments, only: [:create, :destroy]
    resources :ratings, only: :update
  end
end
