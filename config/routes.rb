Rails.application.routes.draw do
  root "markets#index"

  devise_for :users
  resource :profile, only: :show
  resources :markets, path: "m" do
    resources :comments, path: "c", only: [:create, :destroy]
    resources :ratings, path: "r", only: :update
  end
end
