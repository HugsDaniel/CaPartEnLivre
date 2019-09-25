Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :books, only: [:show] do
    resources :comments, only: :create
  end
  resources :likes, only: [:destroy, :create]

  resources :groups, only: [:new, :create, :show] do
    resources :books, only: [:index, :show, :new, :create]
    resources :movies, only: [:index, :show, :new, :create]
    resources :games, only: [:index, :show, :new, :create]
    resources :series, only: [:index, :show, :new, :create]
    resources :podcasts, only: [:index, :show, :new, :create]
    resources :members, only: [:new, :create]
  end
  resources :users, only: [:edit, :update]

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for "User", at: "auth",
        controllers: {
          sessions: 'api/v1/devise_token_auth/sessions'
        }
      resources :podcasts, only: :index
    end
  end
end
