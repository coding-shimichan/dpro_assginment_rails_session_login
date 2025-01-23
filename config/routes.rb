Rails.application.routes.draw do
  resources :users
  root 'tasks#index'
  resources :tasks
  resources :sessions, only: [:new, :create, :destroy]
end
