Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # resources :users, only: [:new, :create, :]
  resources :workouts

  get '/dashboard', to: 'dashboard#index'
end
