Rails.application.routes.draw do
  resources :purchases, only: %i[home create]
  root "purchases#home"
end
