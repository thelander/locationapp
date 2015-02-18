Rails.application.routes.draw do
  root "home#index"

  devise_for :users, controllers: { registrations: "registrations" }

  resources :markets, path: "m" do
    resources :comments, path: "c", only: [:create, :destroy]
    resources :ratings, path: "r", only: :update
  end
end
