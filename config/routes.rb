Rails.application.routes.draw do
	root "admin/products#new"
	namespace :admin do
		resources :products
		resources :categories
		resources :users
	end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
