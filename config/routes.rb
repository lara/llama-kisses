Rails.application.routes.draw do
  resources :redemptions, only: %i[new create]
  resources :purchases, only: %i[home create]

  root "purchases#home"
end
