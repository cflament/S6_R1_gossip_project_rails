Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/create'
  get 'comments/show'
  get 'comments/edit'
  get 'comments/update'
  get 'comments/destroy'
  get '/team', to: 'pages#Team'
  get '/contact', to: 'pages#Contact'
  get '/welcome/:first_name', to: 'pages#welcome'

  
  
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]
  resources :gossips do
    resources :comments
  end
  root 'gossips#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
