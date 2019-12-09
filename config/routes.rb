Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :books , only: [:index,:show]
  resources :publishers, only: [:show]
  root 'books#index'

  namespace :admin do
    root 'books#index'  #/admin
    resources :books    #/admin/book
    resources :publishers
  end
end