Rails.application.routes.draw do
  get '/team', to: 'pages#Team'
  get '/contact', to: 'pages#Contact'
  get '/welcome/:first_name', to: 'pages#welcome'

  
  resources :gossips, only: [:new, :create, :index, :show]
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]
  root 'gossips#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
