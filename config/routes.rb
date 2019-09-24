Rails.application.routes.draw do
  root 'toppages#index'

  resources :tasks, only: [:show, :new, :create, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
