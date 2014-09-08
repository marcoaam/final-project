Rails.application.routes.draw do

	root to: "home#index"

	get '/users/sign_in', to: "home#index"
	get '/users/sign_up', to: "home#index"

	post '/users/sign_in', to: "home#index"
	post '/users/sign_up', to: "home#index"

	devise_for :users
	
	resources :user do
		resources :properties
		resources :reviews
	end

	resources :properties do
 		resources :pictures
 		resources :reviews
	end
	
 		resources :rooms
	resources :properties

end
