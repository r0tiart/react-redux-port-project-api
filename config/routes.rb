Rails.application.routes.draw do
  resources :patterns
  resources :categories
  resources :works
  resources :relationships
  resources :users do 
  	resources :works, only: [:index, :create, :update, :show]
  	member do
  		get :following, :followers
  	end
  end
  resources :sessions, only: [:create, :destroy]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
