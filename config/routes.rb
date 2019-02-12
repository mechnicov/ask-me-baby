Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/new'
  # get 'users/edit'
  # get 'users/show'
  # get '/show', to: 'users#show'
  root 'users#index'
  resources :users
  resources :questions
end
