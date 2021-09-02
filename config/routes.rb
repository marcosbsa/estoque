Rails.application.routes.draw do
  devise_for :users
  root to: 'public#main'
  resources :foods
  resources :clients
  resources :armazems
  get '/public/main'
  
end
