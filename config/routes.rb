Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  resources :bookings, only: [:edit, :update, :new, :create]
  resources :users, only: [:show]
  resources :workouts

  get '/dashboard', to: 'dashboard#index'
end
