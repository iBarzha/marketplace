Rails.application.routes.draw do
  devise_for :users
  root 'watches#index'

  resources :users, only: [:show, :edit, :update]
  resources :watches do
    resources :reviews, only: [:create, :destroy]
  end
  resources :orders, only: [:index, :show, :create]

  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
  end

  resources :devices, only: [:create, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check


end
