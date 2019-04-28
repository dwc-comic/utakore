Rails.application.routes.draw do
  # devise_for :admins
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
  }

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
  get 'mains/top'
  get 'mains/about'

  namespace :user do
    resources :order_items, only: [:new, :create]
    resources :cart_items, only: [:create, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    resources :users
    resources :items, only: [:index, :show, :create, ] do
     resource :favorites, only: [:index, :create, :destroy]
    end
     resources :carts, only: [:index, :create, :destroy] do
    end
     resources :orders, only: [:new, :create, :index, :show] do
    end
  end


  namespace :admin do
    get 'orders/index'
    get 'orders/show'
    get 'orders/edit'

    resources :users
    resources :orders
    resources :items
  end

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
