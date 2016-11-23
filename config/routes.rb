Rails.application.routes.draw do
  root to: 'home#show'

  resources :games, only: [:index, :new]
  resources :users, only: [:create]

  get '/logout', to: 'sessions#destroy'

end
