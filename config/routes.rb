Rails.application.routes.draw do
  if Rails.env.development?
    #mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
  root to: 'pages#front'
  get 'ui(/:action)', controller: 'ui'
  get '/home', to: 'videos#index'
  get 'register', to: "users#new"
  get 'sign_in', to: 'sessions#new'
  get 'sign_out', to: 'sessions#destroy'

  resources :users, only: [:show]
  resources :users, only: [:create]
  get 'people', to: 'relationships#index'
  resources :relationships, only: [:destroy, :create]

  resources :queue_items, only: [:create, :destroy]
  post 'update_queue', to: 'queue_items#update_queue'

  resources :videos, only: [:show] do
    collection do
      post :search, to: "videos#search"
    end
    resources :reviews, only: [:create]
  end

  resources :categories, only: [:show]
  get 'my_queue', to: 'queue_items#index'
  resources :sessions, only: [:create]
  
  get 'forgot_password', to: 'forgot_passwords#new'
  resources :forgot_passwords, only: [:create]
  get 'forgot_password_confirmation', to: 'forgot_passwords#confirm'
  
  resources :password_resets, only: [:show, :create]
  get 'expired_token', to: 'password_resets#expired_token'
end
