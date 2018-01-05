Rails.application.routes.draw do
  root 'static_pages#home'

  resources :posts do
    resources :reviews
  end
  resources :tags, only: [:show]
  resources :locations, only: [:show]

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users

end
