Rails.application.routes.draw do
  root :to => 'homes#index'

  resource :cart, only: [:show]

  resources :products do
    resources :reviews
  end
  resources :order_items
  resources :orders
  resources :charges
  resources :users

  get '/test' => 'homes#test'
  post '/test' => 'homes#test'

  get '/list' => 'products#list'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
