Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :books, only: [:show] do
    resources :comments, only: :create
    resources :likes, only: :create
  end
  resources :likes, only: :destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :groups, only: [:new, :create, :show] do
    resources :books, only: [:new, :create]
    resources :members, only: [:new, :create]
  end
  resources :users, only: [:edit, :update]
end
