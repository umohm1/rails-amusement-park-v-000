Rails.application.routes.draw do

  root 'home#index'
  resources :users
  resources :attractions
  resources :rides 

  get '/signin', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#destroy'
  # resources :sessions

end
