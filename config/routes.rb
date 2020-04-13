Rails.application.routes.draw do
  # root 'admin/users#new'
  root 'users#new'
  resources :users

  namespace :admin do
    resources :users
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :tasks
end
