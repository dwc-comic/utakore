Rails.application.routes.draw do
  # devise_for :admins
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  get 'mains/top'
  get 'mains/about'

  namespace :user do
    get 'purchaces/index'
    get 'purchaces/pay'
    get 'inquerys/index'
    # get 'orders/index'
    # get 'orders/show'
    # get 'users/show'
    # get 'users/edit'
    get 'carts/index'
    get 'favorites/index'
    # get 'items/index'
    # get 'items/show'
    resources :orders, only: [:index, :show]
    resources :users
    resources :items, only: [:index, :show]

  end

  namespace :admin do
    get 'orders/index'
    get 'orders/show'
    get 'orders/edit'

    resources :users
    resources :orders
    resources :items
  end
  devise_for :users, controllers:{
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end