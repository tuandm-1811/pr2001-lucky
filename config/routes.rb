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
  post 'myfood/signup', to: 'users#new'
  get 'myfood/login', to: 'sessions#new'
  get 'myfood/edit'
  get 'users/new'
  post 'myfood/login', to: 'sessions#create'
  delete 'myfood/logout', to: 'sessions#destroy'

  resources :users, only: %i[:new, :create, :update, :edit]
  resources :sessions, only: [:new, :create, :destroy]
  root 'myfood#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
