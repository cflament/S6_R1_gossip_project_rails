Rails.application.routes.draw do
  get '/team', to: 'pages#Team'
  get '/contact', to: 'pages#Contact'
  get '/welcome/:first_name', to: 'pages#welcome'
  get '/users/:id', as: :user, to: 'pages#user'
  
  resources :gossips, only: [:new, :create, :index, :show]
  root 'gossips#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
