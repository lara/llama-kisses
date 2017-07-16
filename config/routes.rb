require "sidekiq/web"

Rails.application.routes.draw do
  get "auth/github/callback", to: "sessions#create"
  delete :logout, to: "sessions#destroy"
  resources :redemptions, only: %i[create]
  get :redeem, to: "redemptions#new", as: :new_redemption
  resources :purchases, only: %i[home index create]

  root "purchases#home"

  mount Sidekiq::Web => "/sidekiq"
end
