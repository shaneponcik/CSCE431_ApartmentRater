Rails.application.routes.draw do
  get 'home/index'
  get 'misc/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  root 'apartments#index'
  resources :apartments
  resources :reviews
  resources :users
  resources :tags

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'sessions/show_admin', to 'users#admin_portal', as: 'admin_only'
end
