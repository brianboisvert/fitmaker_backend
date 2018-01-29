Rails.application.routes.draw do
  resources :exercise_sets
  resources :super_sets
  resources :user_workouts
  resources :users
  resources :exercises
  resources :workouts
  post '/login', to: 'auth#create'
  get 'current_user', to: 'auth#show'
  post '/signup', to: 'auth#signup'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
