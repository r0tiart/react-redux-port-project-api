Rails.application.routes.draw do
  resources :patterns
  resources :categories
  resources :works
  resources :relationships
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
