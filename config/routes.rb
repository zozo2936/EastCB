Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resource :cart, only: [:show,:destroy] do
    collection do
      post :add, path: ':id/app'
      # /cart/2/add
      get :checkout
    end
  end

  resources :orders, only:[:index,:show,:create] do
    member do
      put :cancel  # PUT /orders/2/cancel  (刪除訂單) 
    end
  end


  resources :categories,only:[:show]
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
    resources :categories, except:[:show]
  end

  namespace :api do
    resources :books, only: [] do
      member do
        post :favorite
      end
    end
  end


  
end