Rails.application.routes.draw do
  get 'mains/top'
  namespace :user do
    get 'purchaces/index'
    get 'purchaces/pay'
  end
  namespace :user do
    get 'inquerys/index'
  end
  namespace :user do
    get 'orders/index'
    get 'orders/show'
  end
  namespace :user do
    get 'users/show'
    get 'users/edit'
  end
  namespace :user do
    get 'carts/index'
  end
  namespace :user do
    get 'favorites/index'
  end
  namespace :user do
    get 'items/index'
    get 'items/show'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
    get 'orders/edit'
  end
  namespace :admin do
    get 'item/new'
    get 'item/index'
    get 'item/show'
    get 'item/edit'
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
