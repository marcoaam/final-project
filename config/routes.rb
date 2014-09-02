Rails.application.routes.draw do

	root to: "home#index"

	devise_for :users
	
	resources :user do
		resources :properties
	end

	resources :properties do
 		resources :pictures
	end
	
	resources :properties

end
