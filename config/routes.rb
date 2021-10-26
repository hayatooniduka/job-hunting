Rails.application.routes.draw do
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create, :update]
 end
