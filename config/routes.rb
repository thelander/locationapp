Rails.application.routes.draw do
  root "home#index"

  devise_for :users, controllers: { registrations: "registrations", omniauth_callbacks: "omniauth_callbacks" }

  resources :markets, path: "m" do
    resources :reviews, path: "r", only: [:create, :destroy]
  end
end
