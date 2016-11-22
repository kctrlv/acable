Rails.application.routes.draw do
  root to: 'home#show'

  resources :games, only: [:index]
  resources :users, only: [:create]

  get '/logout', to: 'sessions#destroy'
  
end
