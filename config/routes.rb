Rails.application.routes.draw do
  resources :games, only: [:index]

  root to: 'home#show'
  resources :users, only: [:create]
end
