# frozen_string_literal: true

Rails.application.routes.draw do
  get 'admin/login', to: 'admin/sessions#new'
  post 'admin/login', to: 'admin/sessions#create'
  delete 'admin/logout', to: 'admin/sessions#destroy'
  namespace :admin do
    resources :products
    resources :categories
    resources :users
    resources :sessions, only: %i[new create destroy]
  end
  get 'myfood/signup', to: 'users#new'
  post 'myfood/signup', to: 'users#create'
  get 'myfood/login', to: 'sessions#new'  
  post 'myfood/login', to: 'sessions#create'  
  delete 'myfood/logout', to: 'sessions#destroy'
  get 'users/new'
  devise_for :users,     controllers:{omniauth_callbacks: "users/omniauth_callbacks"}
  resources :users, only: [:new, :create, :update, :edit, :show, :index]
  resources :sessions, only: [:new, :create, :destroy]
  root 'myfood#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
