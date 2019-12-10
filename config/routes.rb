Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :books , only: [:index,:show] do 
    member do 
      post :comment    #/books/:id/comment , to: 'books#comment'
    end
  end
  resources :publishers, only: [:show]
  # resources :comments, only:[:create]

  root 'books#index'

  namespace :admin do
    root 'books#index'  #/admin
    resources :books    #/admin/book
    resources :publishers
  end

  namespace :api do
    resources :book, only:[] do
      member do
        post :favorite
      end
    end
  end

end