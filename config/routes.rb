Rails.application.routes.draw do
  get '/team', to: 'pages#Team'
  get '/contact', to: 'pages#Contact'
  get '/welcome/:first_name', to: 'pages#welcome'
  root 'pages#home'
  get '/gossips/:id', as: :gossip, to: 'pages#gossip'
  get '/users/:id', as: :user, to: 'pages#user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
