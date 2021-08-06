Rails.application.routes.draw do
  root 'users#index'

  resources :users
  resources :questions, except: %i[show new index]
  resources :hash_tags, only: %i[show]
  resource :session, only: %i[new create destroy]
end
