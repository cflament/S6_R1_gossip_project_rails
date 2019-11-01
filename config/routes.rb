Rails.application.routes.draw do
  resources :teams, only: [:index]
  resources :contacts, only: [:index]
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]
  resources :gossips do
    resources :comments
  end
  root 'gossips#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
