# frozen_string_literal: true

Rails.application.routes.draw do
  get 'login', to: 'admin/sessions#new'
  post 'login', to: 'admin/sessions#create'
  delete 'logout', to: 'admin/sessions#destroy'
  root 'admin/sessions#new'
  namespace :admin do
    resources :products
    resources :categories
    resources :users
    resource :sessions, only: %i[new create destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
