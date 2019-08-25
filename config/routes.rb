Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :books, only: [] do
    resources :comments, only: :create
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :groups, only: [:new, :create, :show] do
    resources :books, only: [:new, :create]
  end
end
