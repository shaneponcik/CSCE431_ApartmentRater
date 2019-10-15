Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  root 'home#index'
  get 'home/index'
  get 'misc/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :apartments
  resources :reviews

  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

end
