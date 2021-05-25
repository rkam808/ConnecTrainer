Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/workouts/:id', to: 'workouts#show', as: 'workout'
end
