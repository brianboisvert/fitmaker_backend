Rails.application.routes.draw do
  resources :user_workouts
  resources :users
  resources :workout_exercises
  resources :exercises
  resources :workouts
  post '/login', to: 'auth#create'
  get 'current_user', to: 'auth#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
