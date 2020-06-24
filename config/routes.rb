Rails.application.routes.draw do
	get "awesome/home" => "fooddrink_pages#home" 
	get "awesome/menu" => "fooddrink_pages#menu" 
	get "awesome/pages" => "fooddrink_pages#pages" 
	get "awesome/sale" => "fooddrink_pages#sale"
	get "awesome/blog" => "fooddrink_pages#blog" 
	get "awesome/aboutus" => "fooddrink_pages#about_us"
	root "fooddrink_pages#home"  
  	resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
