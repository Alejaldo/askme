Rails.application.routes.draw do
  root 'users#index'

  resources :users
  resources :questions, except: %i[show new index]
  resources :hash_tags, only: %i[show], param: :name
  resource :session, only: %i[new create destroy]

  # API V1 routes

  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        resources :questions, only: [:index]
      end
    end
  end
end
