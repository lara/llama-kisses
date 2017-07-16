Rails.application.routes.draw do
  get "auth/github/callback", to: "sessions#create"
  delete :logout, to: "sessions#destroy"
  resources :redemptions, only: %i[new create]
  resources :purchases, only: %i[home index create]

  root "purchases#home"
end
