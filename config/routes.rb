Rails.application.routes.draw do
  # devise_for :admins
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  # devise_for :users, skip: :all
  # devise_scope :user do
  #   get 'users/log_in' => 'users/sessions#new', as: :new_user_session
  #   post 'users/log_in' => 'users/sessions#create', as: :user_session
  #   delete 'users/logout' => 'users/sessions#destroy', as: :destroy_user_session
  #   get 'users/sign_up' => 'users/registrations#new', as: :new_user_registration
  # end

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
    resources :items, only: [:index, :show] do
      resource :favorites, only: [:index, :create, :destroy]
    end
    resources :carts, only: [:index]

   post '/add_items' => 'carts#add_items'
   post '/update_items' => 'carts#update_items'
   delete '/delete_items' => 'carts#delete_items'
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
