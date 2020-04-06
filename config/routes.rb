Rails.application.routes.draw do
  # root 'tasks#index'
  root 'toppages#index'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  
  resources :tasks
end
