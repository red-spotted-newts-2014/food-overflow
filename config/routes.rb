Rails.application.routes.draw do
  
  root 'questions#index'

  # root 'questions#show'

  get '/users/sign_in', to: 'users#sign_in'
  post '/users/auth', to: 'users#auth'
  get '/users/auth', to: 'users#landing_page'
  get '/users/logout', to: 'users#logout'

  resources :users, shallow: true do
    resources :questions
  end
  
end
