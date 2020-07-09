# frozen_string_literal: true

Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'admin/sessions#new'
  namespace :admin do
    resources :products
    resources :categories
    resources :users
    resource :sessions
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
