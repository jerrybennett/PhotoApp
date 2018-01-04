Rails.application.routes.draw do
  resources :posts do
    resources :reviews
  end
  resources :tags
  resources :locations
  
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
