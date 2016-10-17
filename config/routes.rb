Myflix::Application.routes.draw do
  root to: 'pages#splash'

  get 'ui(/:action)', controller: 'ui' unless Rails.env.production?

  ### Categories ###
  get '/home', to: 'categories#index'
  get '/genre/:id', to: 'categories#show', as: "category"

  ### Videos > Reviews ###
  resources :videos, only: [:show] do 
    collection do 
      post :search, to: "videos#search"
    end

    resources :reviews, only: [:create]
  end

  ### Queue ###
  get '/my_queue', to: 'queue_items#index'
  patch '/update_queue', to: 'queue_items#update_queue'
  resources :queue_items, only: [:create, :destroy]

  ### Sessions ###
  get '/login', to: 'sessions#new'
  post '/logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]

  ### Users ###
  get '/register', to: 'users#new'
  get 'register/:token', to: 'users#new_with_invitation_token', as: 'register_with_token'
  resources :users, only: [:create, :show]

  get '/people', to: 'relationships#index'
  resources :relationships, only: [:destroy, :create]

  get 'forgot_password', to: 'forgot_passwords#new'
  get 'forgot_password_confirmation', to: 'forgot_passwords#confirm'
  resources :forgot_passwords, only: [:create]

  resources :password_resets, only: [:show, :create]
  get 'expired_token', to: 'pages#expired_token'

  resources :invitations, only: [:new, :create]

end
