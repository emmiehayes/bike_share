Rails.application.routes.draw do

  root to: 'dashboard#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'dashboard#show'
  get '/trips-dashboard', to: 'trips_dashboard#index'
  get '/stations-dashboard', to: 'stations_dashboard#index'
  get '/conditions-dashboard', to: 'conditions_dashboard#index'
  get '/cart', to: 'cart#show'
  post '/cart', to: 'cart#create'
  delete '/cart', to: 'cart#destroy'

  resources :accessories, only: [:index, :show], path: 'bike-shop'
  resources :users, only: [:new, :create, :edit, :update]
  resources :stations, only: [:index]
  resources :conditions, only: [:index, :show]
  resources :trips, only: [:index, :show]
  resources :orders, only: [:show, :create]

  namespace :admin do
    resources :accessories, only: [:index, :edit, :update, :create], path: 'bike-shop'
    get '/dashboard', to: 'dashboard#show'
    resources :trips, except: [:index, :show]
    resources :stations, only: [:new, :create, :edit, :update, :destroy]
    resources :conditions, only: [:new, :create, :edit, :update, :destroy]
    resources :accessories, only: [:new, :create, :edit, :update]
    resources :orders, only: [:edit, :update]
  end

  get '/:id', to: 'stations#show'
end
