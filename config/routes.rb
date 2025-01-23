Rails.application.routes.draw do
  resources :users, only: [:new, :create, :destroy, :show, :edit]
  root 'tasks#index'
  resources :tasks
  resources :sessions, only: [:new, :create, :destroy]
end
