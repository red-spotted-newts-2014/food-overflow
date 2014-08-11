Rails.application.routes.draw do

  root 'questions#index'

  
  # get '/users/sign_in', to: 'users#sign_in'
  # post '/users/auth', to: 'users#auth'
  # get '/users/auth', to: 'users#landing_page'
  # post '/users/log_out', to: 'users#logout'

  get '/auths', to: 'auths#index', as: :auths
  get '/auths/new', to: 'auths#new', as: :new_auths

  resources :users
  resources :votes

  concern :commentable do
    resources :comments, only: [:show, :create]
  end

  resources :questions, shallow: true do
    resources :comments, concerns: :commentable
  end

  resources :tags, controller: 'hashtags', only: [:index, :show, :create] do
      member do
        get 'questions'
      end
  end
end
