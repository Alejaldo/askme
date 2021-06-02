Rails.application.routes.draw do
  root 'users#index'

  resources :users
  resources :questions, except: [:show, :new, :index]
  resources :hash_tag, only: [:show]

  get '/sign_up', to: 'users#new'
  get '/log_in', to: 'sessions#new'
  get '/search', to: 'search#index'
  post '/log_in', to: 'sessions#create'
  delete '/log_out', to: 'sessions#destroy'
end
